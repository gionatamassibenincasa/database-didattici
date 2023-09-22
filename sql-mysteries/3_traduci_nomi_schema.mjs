import Database from "better-sqlite3";
const db = new Database("sql-murder-mystery.db", { verbose: console.log });
db.pragma("journal_mode = WAL");

const schema = [
  {
    table: "crime_scene_report",
    translation: "rapport_scena_del_crimine",
    columns: [
      { name: "date", translation: "nome" },
      { name: "type", translation: "tipo" },
      { name: "description", translation: "descrizione" },
      { name: "city", translation: "luogo" },
    ],
  },
  {
    table: "drivers_license",
    translation: "patente",
    columns: [
      { name: "id", translation: "id" },
      { name: "age", translation: "eta" },
      { name: "height", translation: "altezza" },
      { name: "eye_color", translation: "colore_occhi" },
      { name: "hair_color", translation: "colore_capelli" },
      { name: "gender", translation: "sesso" },
      { name: "plate_number", translation: "targa" },
      { name: "car_make", translation: "costruttore_veicolo" },
      { name: "car_model", translation: "modello_veicolo" },
    ],
  },
  {
    table: "facebook_event_checkin",
    translation: "facebook_ingresso_eventi",
    columns: [
      { name: "person_id", translation: "persona_id" },
      { name: "event_id", translation: "evento_id" },
      { name: "event_name", translation: "nome_evento" },
      { name: "date", translation: "data" },
    ],
  },
  {
    table: "interview",
    translation: "interrogatorio",
    columns: [
      { name: "person_id", translation: "persona_id" },
      { name: "transcript", translation: "trascrizione" },
    ],
  },
  {
    table: "get_fit_now_member",
    translation: "get_fit_now_iscrizione",
    columns: [
      { name: "id", translation: "id" },
      { name: "person_id", translation: "persona_id" },
      { name: "name", translation: "nome" },
      { name: "membership_start_date", translation: "data_iscrizione" },
      { name: "membership_status", translation: "tipo_iscrizione" },
    ],
  },
  {
    table: "get_fit_now_check_in",
    translation: "get_fit_now_ingresso",
    columns: [
      { name: "membership_id", translation: "tessera_id" },
      { name: "check_in_date", translation: "data_ingresso" },
      { name: "check_in_time", translation: "ora_ingresso" },
      { name: "check_out_time", translation: "ora_uscita" },
    ],
  },
  {
    table: "solution",
    translation: "soluzione",
    columns: [
      { name: "user", translation: "utente" },
      { name: "value", translation: "valore" },
    ],
  },
  {
    table: "income",
    translation: "reddito",
    columns: [
      { name: "ssn", translation: "codice_fiscale" },
      { name: "annual_income", translation: "reddito_annuo" },
    ],
  },
  {
    table: "person",
    translation: "persona",
    columns: [
      { name: "id", translation: "id" },
      { name: "name", translation: "nome" },
      { name: "license_id", translation: "patente_id" },
      { name: "address_number", translation: "numero_civico" },
      { name: "address_street_name", translation: "indirizzo" },
      { name: "ssn", translation: "codice_fiscale" },
    ],
  },
];

function main() {
  schema.forEach((entry) => {
    const t = entry.table;
    entry.columns.forEach((column) => {
      const c = column.name;
      const n = column.translation;
      const sql = `ALTER TABLE ${t} RENAME COLUMN ${c} TO ${n}`;
      db.prepare(sql).run();
    });
    const sql = `ALTER TABLE ${t} RENAME TO ${entry.translation}`;
    db.prepare(sql).run();
  });
}

main();
