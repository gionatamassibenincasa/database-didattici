import { Database } from "bun:sqlite";

const dbName : string = "chinook-it";
const dbFile : string  = dbName + ".sqlite";

const escape = text => {
	text = text.replaceAll("'", "`");
	return `'${text}'`;
};

const adapt = (field) => {
	if (typeof(field)=='string')
		return escape(field)
	if (!field)
		return 'NULL';
	return field;
};

const db = new Database(dbFile);
const tables_query = db.query("SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name <> 'sqlite_sequence'");
const tables = tables_query.all();

console.log(`group:${dbName}`);
console.log(`description: ${dbName} database relations (tables)`);
console.log('');

tables.forEach(table_name => {
	const tbl : string = table_name.tbl_name;
	const schema_sql : string = `SELECT name FROM pragma_table_info('${tbl}')`;
	const schema_query = db.query(schema_sql);
	const schema = schema_query.all();
	console.log(`${tbl} = {${schema.map(obj => obj.name).join(",")}`);
	const data_sql = `SELECT * FROM ${tbl}`;
	const data_query = db.query(data_sql);
	const data = data_query.all();
	data.forEach(row => console.log(
		"\t" + Object.values(row).map(adapt).join(',')
	));
	console.log("}\n");

});
