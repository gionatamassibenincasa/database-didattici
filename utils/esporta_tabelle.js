const yargs = require("yargs");
const Database = require("better-sqlite3");
const fs = require("fs");
const argv = yargs
  .option("database", {
    description: "Il file dati in formato SQLite",
    alias: "db",
    type: "string",
    demandOption: true,
  })
  .option("output", {
    alias: "o",
    description: "Il file JSON",
    type: "string",
    demandOption: true,
  })
  .help()
  .alias("help", "h").argv;
console.log("DATABASE: ", argv.database);
const db = new Database(argv.database, {});
const tablesStmt = db.prepare(
  "SELECT * FROM sqlite_schema WHERE type = 'table' AND tbl_name <> 'sqlite_sequence'"
);
let tables = {};

let idx = 0;
for (const table of tablesStmt.iterate()) {
  const tblName = table.tbl_name;
  const dataStmt = db.prepare(`SELECT * FROM '${table.name}'`);
  tables[tblName] = dataStmt.all();
}

fs.writeFileSync(argv.output, JSON.stringify(tables, null, 2));
