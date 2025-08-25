const express = require("express");
const multer = require("multer");
const path = require("path");
const fs = require("fs");
const validateUser = require("../middlewares/user.js");
const { processarPlanilha } = require("../automation/broadcastWorker");

const router = express.Router();

// garante pasta de uploads
const uploadsDir = path.join(process.cwd(), "uploads");
if (!fs.existsSync(uploadsDir)) fs.mkdirSync(uploadsDir, { recursive: true });

const upload = multer({ dest: "uploads/" });

// Upload + Configuração de disparo
router.post(
  "/upload",
  validateUser,
  upload.single("planilha"),
  async (req, res) => {
    try {
      if (!req.file) {
        return res.status(400).json({ error: "Arquivo de planilha é obrigatório" });
      }

      const config = {
        uid: req.decode.uid,
        sessao: req.body.sessao, // id/alias da sessão/telefone conectado
        delayMin: parseInt(req.body.delayMin, 10) || 500,
        delayMax: parseInt(req.body.delayMax, 10) || 1500,
        ordem: req.body.ordem === "embaralhada" ? "embaralhada" : "sequencial",
        intercalar: String(req.body.intercalar) === "true",
        // escolha de mensagens/mídias manuais (opcional para campanhas híbridas)
        mensagensFixas: req.body.mensagensFixas ? JSON.parse(req.body.mensagensFixas) : [],
        midiasFixas: req.body.midiasFixas ? JSON.parse(req.body.midiasFixas) : [],
      };

      const filePath = path.join(process.cwd(), req.file.path);

      const { jobId } = await processarPlanilha(filePath, config);

      res.json({ status: "ok", jobId });
    } catch (err) {
      console.error(err);
      res.status(500).json({ error: "Erro no upload/disparo" });
    }
  }
);

module.exports = router;
