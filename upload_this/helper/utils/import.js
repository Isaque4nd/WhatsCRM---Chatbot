import fs from "fs";
import pg from "pg";

const { Client } = pg;

async function run() {
  const client = new Client({
    connectionString: "postgresql://admin:3PCcfaQ4fCmXO2l7jaVX868LH7IH0Ysm@dpg-d2lsdvfdiees73camab0-a/envimax"
  });

  await client.connect();

  try {
    // 🔎 Verifica se já existe alguma tabela no schema público
    const res = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public';
    `);

    if (res.rows.length > 0) {
      console.log("⚠️ O banco já possui tabelas. Importação ignorada.");
    } else {
      const sql = fs.readFileSync("import_postgres.sql", "utf-8");
      await client.query(sql);
      console.log("✅ Banco importado com sucesso!");
    }

  } catch (err) {
    console.error("⚠️ Erro ao importar:", err.message);
  } finally {
    await client.end();
  }
}

run();
