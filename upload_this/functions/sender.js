const path = require("path");
const fs = require("fs");
const { query } = require("../database/dbpromise.js");
// Caso já tenha funções de envio, importe-as aqui e use no lugar dos fetch:
const fetch = (...args) =>
  import("node-fetch").then(({ default: fetch }) => fetch(...args));

/**
 * Retorna credenciais META para o usuário (uid)
 */
async function getMetaCreds(uid) {
  const rows = await query(`SELECT * FROM meta_api WHERE uid = ?`, [uid]);
  if (!rows || !rows.length) {
    throw new Error("Meta API não configurada para este usuário");
  }
  const { business_phone_number_id, access_token } = rows[0];
  if (!business_phone_number_id || !access_token) {
    throw new Error("Credenciais META inválidas");
  }
  return { business_phone_number_id, access_token };
}

/**
 * Envia texto ou mídia para um destinatário.
 * media: pode ser URL http(s) ou caminho local.
 * Para caminho local, é necessário servir o arquivo publicamente
 * ou fazer upload no endpoint de mídia da Graph API.
 */
async function enviarMensagemTextoOuMidia({ uid, sessao, to, text, media }) {
  const { business_phone_number_id, access_token } = await getMetaCreds(uid);

  const url = `https://graph.facebook.com/v20.0/${business_phone_number_id}/messages`;
  const headers = {
    "Content-Type": "application/json",
    Authorization: `Bearer ${access_token}`,
  };

  try {
    // Se tiver mídia e for URL
    if (media && /^https?:\/\//i.test(media)) {
      const type = inferMediaType(media); // image | video | document | audio
      const body = {
        messaging_product: "whatsapp",
        to,
        type,
        [type]: { link: media, caption: text || undefined },
      };

      const resp = await fetch(url, {
        method: "POST",
        headers,
        body: JSON.stringify(body),
      });

      const data = await resp.json();
      if (!resp.ok) {
        throw new Error(`Erro META mídia: ${resp.status} ${JSON.stringify(data)}`);
      }
      console.log(`📤 Mídia enviada para ${to}:`, data);
      return true;
    }

    // Se não tem mídia, enviar apenas texto
    if (text && text.trim()) {
      const body = {
        messaging_product: "whatsapp",
        to,
        type: "text",
        text: { body: text },
      };

      const resp = await fetch(url, {
        method: "POST",
        headers,
        body: JSON.stringify(body),
      });

      const data = await resp.json();
      if (!resp.ok) {
        throw new Error(`Erro META texto: ${resp.status} ${JSON.stringify(data)}`);
      }
      console.log(`📤 Texto enviado para ${to}:`, data);
      return true;
    }

    throw new Error("Nada para enviar (sem texto e sem mídia válida)");
  } catch (err) {
    console.error("❌ Falha ao enviar mensagem:", err.message);
    return false;
  }
}

/**
 * Envia documento (arquivo local) para a própria sessão (número conectado).
 * Se não houver servidor estático configurado para expor o arquivo,
 * envia apenas um aviso em texto com o caminho.
 */
async function enviarDocumentoParaSessao({ uid, sessao, filePath, caption }) {
  const filename = path.basename(filePath);

  // Se você tiver servidor público configurado, substitua aqui:
  // Ex.: `${process.env.PUBLIC_BASE_URL}/reports/${filename}`
  const publicUrl = null;

  if (publicUrl) {
    // Enviar como documento por URL público
    return enviarMensagemTextoOuMidia({
      uid,
      sessao,
      to: sessao,
      text: caption,
      media: publicUrl,
    });
  } else {
    // Fallback: manda texto com aviso
    return enviarMensagemTextoOuMidia({
      uid,
      sessao,
      to: sessao,
      text: `${caption}\nArquivo disponível no painel interno: ${filePath}`,
    });
  }
}

/**
 * Detecta tipo de mídia a partir da extensão
 */
function inferMediaType(url) {
  const U = url.toLowerCase();
  if (
    U.endsWith(".jpg") ||
    U.endsWith(".jpeg") ||
    U.endsWith(".png") ||
    U.endsWith(".gif") ||
    U.endsWith(".webp")
  )
    return "image";
  if (U.endsWith(".mp4") || U.endsWith(".mov") || U.endsWith(".m4v"))
    return "video";
  if (U.endsWith(".mp3") || U.endsWith(".ogg") || U.endsWith(".wav"))
    return "audio";
  return "document";
}

module.exports = {
  getMetaCreds,
  enviarMensagemTextoOuMidia,
  enviarDocumentoParaSessao,
};
