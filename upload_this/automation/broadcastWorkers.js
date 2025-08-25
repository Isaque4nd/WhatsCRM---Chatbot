const xlsx = require("xlsx");
const fs = require("fs");
const path = require("path");
const { v4: uuidv4 } = require("uuid");
const { query } = require("../database/dbpromise.js");
const { enviarMensagemTextoOuMidia, enviarDocumentoParaSessao } = require("../functions/sender"); // NOVO
const { parseDelimitedMaybeCSV } = require("../helper/utils/csv.js"); // NOVO helper simples abaixo
const os = require("os");

// ---------------- utils ----------------
function sleep(ms) {
  return new Promise((r) => setTimeout(r, ms));
}

function isE164(num) {
  // E.164: + e até 15 dígitos
  return typeof num === "string" && /^\+[1-9]\d{1,14}$/.test(num.trim());
}

function shuffle(arr) {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

function ensureDir(dirPath) {
  if (!fs.existsSync(dirPath)) fs.mkdirSync(dirPath, { recursive: true });
}

// -------------- núcleo do worker --------------
async function processarPlanilha(filePath, config) {
  // Gera um ID do job
  const jobId = uuidv4();
  const startedAt = new Date();

  // Cria registro do job
  await query(
    `INSERT INTO upload_jobs (job_id, uid, sessao, status, delay_min, delay_max, ordem, intercalar, created_at)
     VALUES (?, ?, ?, 'RUNNING', ?, ?, ?, ?, NOW())`,
    [
      jobId,
      config.uid,
      config.sessao || null,
      config.delayMin,
      config.delayMax,
      config.ordem,
      config.intercalar ? 1 : 0,
    ]
  );

  // Lê CSV/XLSX
  let rows = [];
  const ext = path.extname(filePath).toLowerCase();
  if (ext === ".csv") {
    const content = fs.readFileSync(filePath, "utf8");
    rows = parseDelimitedMaybeCSV(content);
  } else {
    const workbook = xlsx.readFile(filePath);
    const sheet = workbook.Sheets[workbook.SheetNames[0]];
    rows = xlsx.utils.sheet_to_json(sheet);
  }

  // normaliza chaves (case-insensitive -> minúsculo)
  rows = rows.map((r) => {
    const out = {};
    Object.keys(r).forEach((k) => (out[String(k).trim().toLowerCase()] = r[k]));
    return out;
  });

  // campos esperados base
  // nome, numero (E.164), mensagem, midia (url ou nome de arquivo), + colunas extras
  let contatos = rows.filter((r) => r.numero);

  // deduplicar por numero mantendo a primeira ocorrência
  const seen = new Set();
  const duplicados = [];
  contatos = contatos.filter((r) => {
    const num = String(r.numero).trim();
    if (seen.has(num)) {
      duplicados.push(num);
      return false;
    }
    seen.add(num);
    return true;
  });

  // ordem
  if (config.ordem === "embaralhada") contatos = shuffle(contatos);

  // relatórios
  const reportDir = path.join(process.cwd(), "reports");
  ensureDir(reportDir);
  const relCsv = path.join(reportDir, `relatorio_${jobId}.csv`);
  const relTxt = path.join(reportDir, `relatorio_${jobId}.txt`);

  // cabeçalho do CSV
  const csvHeader = [
    "numero",
    "status",
    "erro",
    "mensagem_enviada",
    "midia_utilizada",
    "createdAt",
  ].join(",");

  fs.writeFileSync(relCsv, csvHeader + os.EOL);

  let enviados = 0;
  let falhas = 0;

  // logs iniciais de duplicados
  for (const num of duplicados) {
    await query(
      `INSERT INTO upload_job_logs (job_id, uid, numero, status, error_message, created_at)
       VALUES (?, ?, ?, 'DUPLICATE', NULL, NOW())`,
      [jobId, config.uid, num]
    );
  }

  // função para escrever linha no CSV
  function appendCsvLine(row) {
    const safe = (v) =>
      `"${String(v ?? "")
        .replaceAll('"', '""')
        .replaceAll("\n", " ")
        .replaceAll("\r", " ")}"`;
    const line = [
      row.numero,
      row.status,
      row.erro || "",
      row.mensagem || "",
      row.midia || "",
      row.createdAt || new Date().toISOString(),
    ]
      .map(safe)
      .join(",");
    fs.appendFileSync(relCsv, line + os.EOL);
  }

  // Disparo
  for (let i = 0; i < contatos.length; i++) {
    const contato = contatos[i];

    const numero = String(contato.numero).trim();
    if (!isE164(numero)) {
      falhas++;
      await query(
        `INSERT INTO upload_job_logs (job_id, uid, numero, status, error_message, created_at)
         VALUES (?, ?, ?, 'INVALID', 'Número não está em E.164', NOW())`,
        [jobId, config.uid, numero]
      );
      appendCsvLine({
        numero,
        status: "INVALID",
        erro: "Número não está em E.164",
        mensagem: "",
        midia: "",
      });
      continue;
    }

    // mensagem base: prioriza coluna mensagem; se intercalar mensagensFixas foi enviado, intercala
    let mensagem = String(contato.mensagem ?? "").trim();
    if (!mensagem && Array.isArray(config.mensagensFixas) && config.mensagensFixas.length) {
      mensagem = String(config.mensagensFixas[i % config.mensagensFixas.length] || "");
    }

    // substitui variáveis com TODAS as colunas da linha
    Object.keys(contato).forEach((col) => {
      const re = new RegExp(`{{\\s*${col}\\s*}}`, "g");
      mensagem = mensagem.replace(re, String(contato[col] ?? ""));
    });

    // mídia: prioriza coluna midia; se intercalar midiasFixas, usa round-robin
    let midia = contato.midia ? String(contato.midia).trim() : "";
    if (!midia && Array.isArray(config.midiasFixas) && config.midiasFixas.length) {
      midia = String(config.midiasFixas[i % config.midiasFixas.length] || "");
    }

    // delay aleatório
    const delay =
      Math.floor(Math.random() * (config.delayMax - config.delayMin + 1)) +
      config.delayMin;

    try {
      await enviarMensagemTextoOuMidia({
        uid: config.uid,
        sessao: config.sessao,
        to: numero,
        text: mensagem,
        media: midia, // pode ser URL http(s) OU caminho local previamente carregado
      });

      enviados++;
      await query(
        `INSERT INTO upload_job_logs (job_id, uid, numero, status, error_message, created_at, payload)
         VALUES (?, ?, ?, 'SENT', NULL, NOW(), ?)`,
        [jobId, config.uid, numero, JSON.stringify({ mensagem, midia })]
      );
      appendCsvLine({
        numero,
        status: "SENT",
        mensagem,
        midia,
      });
    } catch (err) {
      falhas++;
      const msg = err?.message || "Falha ao enviar";
      await query(
        `INSERT INTO upload_job_logs (job_id, uid, numero, status, error_message, created_at, payload)
         VALUES (?, ?, ?, 'FAILED', ?, NOW(), ?)`,
        [jobId, config.uid, numero, msg, JSON.stringify({ mensagem, midia })]
      );
      appendCsvLine({
        numero,
        status: "FAILED",
        erro: msg,
        mensagem,
        midia,
      });
    }

    await sleep(delay);
  }

  // TXT humano
  const txt = [
    `Job: ${jobId}`,
    `Iniciado: ${startedAt.toISOString()}`,
    `Concluído: ${new Date().toISOString()}`,
    `Contatos (únicos): ${contatos.length}`,
    `Duplicados removidos: ${duplicados.length}`,
    `Enviados: ${enviados}`,
    `Falhas: ${falhas}`,
    `Relatório CSV: ${path.basename(relCsv)}`,
  ].join("\n");
  fs.writeFileSync(relTxt, txt, "utf8");

  // Atualiza job
  await query(
    `UPDATE upload_jobs
     SET status = 'DONE', sent = ?, failed = ?, duplicates = ?, finished_at = NOW(), report_csv = ?, report_txt = ?
     WHERE job_id = ?`,
    [enviados, falhas, duplicados.length, path.basename(relCsv), path.basename(relTxt), jobId]
  );

  // Envia relatório para a própria sessão (mensagem + documento)
  try {
    await enviarMensagemTextoOuMidia({
      uid: config.uid,
      sessao: config.sessao,
      to: config.sessao, // o próprio número conectado
      text:
        "✅ Disparo concluído. O relatório foi enviado para seu WhatsApp.\n🔌 Você pode desconectar este número agora.",
    });

    await enviarDocumentoParaSessao({
      uid: config.uid,
      sessao: config.sessao,
      filePath: relCsv,
      caption: `Relatório CSV do job ${jobId}`,
    });

    await enviarDocumentoParaSessao({
      uid: config.uid,
      sessao: config.sessao,
      filePath: relTxt,
      caption: `Resumo TXT do job ${jobId}`,
    });
  } catch (e) {
    console.error("Falha ao enviar relatório para a sessão:", e?.message);
  }

  return { jobId, relCsv, relTxt };
}

module.exports = { processarPlanilha };
