const express = require("express");
const { query } = require("../database/dbpromise.js");
const validateUser = require("../middlewares/user.js");

const router = express.Router();

router.get("/status/:jobId", validateUser, async (req, res) => {
  const { jobId } = req.params;
  const rows = await query(`SELECT * FROM upload_jobs WHERE job_id = ? AND uid = ?`, [
    jobId,
    req.decode.uid,
  ]);
  if (!rows.length) return res.status(404).json({ success: false, msg: "Job não encontrado" });

  const logsCount = await query(
    `SELECT status, COUNT(*) as c FROM upload_job_logs WHERE job_id = ? GROUP BY status`,
    [jobId]
  );

  res.json({ success: true, job: rows[0], logsCount });
});

module.exports = router;
