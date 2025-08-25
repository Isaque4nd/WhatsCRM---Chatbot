const { Pool } = require('pg');

const pool = new Pool({
  host: process.env.DBHOST,
  port: process.env.DBPORT || 5432,
  user: process.env.DBUSER,
  password: process.env.DBPASS,
  database: process.env.DBNAME,
  ssl: { rejectUnauthorized: false }
});

module.exports = pool;

pool.connect((err) => {
  if (err) {
    console.log({
      err: err,
      msg: "Database connected error",
    });
    return;
  } else {
    console.log("Database has been connected");
  }
});

module.exports = config;
