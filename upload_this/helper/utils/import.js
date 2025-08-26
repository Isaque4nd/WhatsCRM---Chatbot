import fs from "fs";
import pg from "pg";

const { Client } = pg;

async function resetDatabase(client) {
  console.log("⚠️ Resetando o banco de dados...");
  
  // Busca todas as tabelas do schema público
  const tablesRes = await client.query(`
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = 'public';
  `);

  // Dropa cada tabela encontrada
  for (const row of tablesRes.rows) {
    const table = row.table_name;
    console.log(`🗑️ Apagando tabela: ${table}`);
    await client.query(`DROP TABLE IF EXISTS "${table}" CASCADE;`);
  }

  console.log("✅ Todas as tabelas foram apagadas.");
}

async function run() {
  const client = new Client({
    connectionString: "postgresql://admin:3PCcfaQ4fCmXO2l7jaVX868LH7IH0Ysm@dpg-d2lsdvfdiees73camab0-a/envimax"
  });

  await client.connect();

  try {
    // 🔹 Resetar o banco **apenas uma vez**
    await resetDatabase(client);

    const sql = fs.readFileSync("import_postgres.sql", "utf-8");
    await client.query(sql);
    console.log("✅ Banco importado com sucesso!");

  } catch (err) {
    console.error("⚠️ Erro ao importar:", err.message);
  } finally {
    await client.end();
  }
}

run();
