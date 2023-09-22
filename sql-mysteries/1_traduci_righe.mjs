import Database from "better-sqlite3";
const db = new Database("sql-murder-mystery.db", { verbose: console.log });
db.pragma("journal_mode = WAL");
import { execSync } from "child_process";
// const { execSync } = require("child_process");

const MODE = {
  ENUM: "Enum",
  ITERATOR: "Iterator",
};

const columns = [
  /*
// SELECT description
// FROM crime_scene_report csr 
// WHERE lower(city)  = 'sql city' AND 
// type = 'murder' AND 
// date = 20180115
  {
    table: "crime_scene_report",
    id_column_name: null,
    column: "type",
    mode: MODE.ENUM,
  },
  {
    table: "crime_scene_report",
    id_column_name: null,
    column: "description",
    mode: MODE.ENUM,
  },
  */
  {
    table: "interview",
    id_column_name: "person_id",
    column: "transcript",
    mode: MODE.ITERATOR,
  },
];

// from https://github.com/ipython-contrib/jupyter_contrib_nbextensions/blob/master/src/jupyter_contrib_nbextensions/nbextensions/nbTranslate/nbTranslate.js#L188
function processGoogleTranslateResponse(responseJSON) {
  // console.log(responseJSON);
  var translated_text = "";

  var list_paragraphs = responseJSON[0];
  //var list_paragraphs = data.responseText.match(/\[\"([\S\s]*?)\",/g)

  list_paragraphs.forEach(function (elt) {
    translated_text += elt[0]; //.substring(2, elt.length - 2)
  });
  translated_text = translated_text
    .replace(/([^\\])\\n/g, "$1\n")
    .replace(/([^\\])\\n/g, "$1\n")
    .replace(/\\\\/g, "\\") // unescape
    .replace(/\\"/g, '"') // replace double quotes
    .replace(
      /\\u003c([\*|_|@]{1,2})\\u003e\s*([\s\S]*?)\s*\\u003c\1\\u003e/g,
      function (m0, m1, m2) {
        return m1 + m2 + m1;
      }
    )
    .replace(/<([\*|_|@]{1,2})>\s*([\s\S]*?)\s*<\1>/g, function (m0, m1, m2) {
      return m1 + m2 + m1;
    });

  /*for (item in mdReplacements) {
        var pattern = new RegExp(mdReplacements[item], 'gmi');
        translated_text = translated_text.replace(pattern, item);
    }*/

  // Remove spurious md remaining
  translated_text = translated_text.replace(
    /\\u003c([\*|_|@]{1,2})\\u003e/g,
    ""
  );
  // Remove extra spaces in markdown
  translated_text = translated_text.replace(
    /([\*|_|@]{1,2})\s*([\s\S]*?)\s*\1/g,
    function (m0, m1, m2) {
      return m1 + m2 + m1;
    }
  );
  return translated_text;
}

function main() {
  columns.forEach((ctx) => {
    const t = ctx.table; //< db table name
    const c = ctx.column; //< db column name
    if (ctx.mode === MODE.ITERATOR) {
      const sql = `SELECT ${ctx.id_column_name}, ${c} FROM ${t}`;
      console.log(sql);
      const stmt = db.prepare(sql);

      for (const record of stmt.iterate()) {
        const id = record[ctx.id_column_name];
        const en = record[c];
        const url =
          "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=it&dt=t&q=" +
          encodeURIComponent(en);
        const it = fetch(url)
          .then((response) => response.json())
          .then((json) => {
            let it = "BLA BLA BLA...";
            try {
              it = processGoogleTranslateResponse(json);
            } catch (error) {
              console.log(error);
            }
            try {
              const sql = `UPDATE ${t} SET ${c} = ? WHERE ${ctx.id_column_name} = ?`;
              console.log(sql);

              const stmt = db.prepare(sql);
              const info = stmt.run(it, id);
              console.error(info.changes);
            } catch (error) {
              console.log(error);
            }
          });
      }
    } else {
      const stmt = db.prepare(`SELECT DISTINCT ${c} FROM ${t}`);
      const enumerated_values = stmt.all();
      for (const value of enumerated_values) {
        const en = value[c];
        const url =
          "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=it&dt=t&q=" +
          encodeURIComponent(en);
        const it = fetch(url)
          .then((response) => response.json())
          .then((json) => {
            try {
              const it = processGoogleTranslateResponse(json);
              const sql = `UPDATE ${t} SET ${c} = ? WHERE ${c} = ?`;
              console.log(sql);

              const stmt = db.prepare(sql);
              const info = stmt.run(it, en);
              console.log(info.changes);
            } catch (error) {
              console.log(error);
            }
          });
      }
    }
    // Aspetta almeno 250 ms prima di contattare nuovamente Google Translate
    execSync("sleep 0.25");
  });
}

main();
