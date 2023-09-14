import Database from "better-sqlite3";
const db = new Database("sql-murder-mystery.db", { verbose: console.log });
db.pragma("journal_mode = WAL");

const MODE = {
  ENUM: "Enum",
  ITERATOR: "Iterator",
};

const columns = [
  {
    table: "crime_scene_report",
    id: null,
    column: "type",
    mode: MODE.ENUM,
  },
  {
    table: "crime_scene_report",
    id: null,
    column: "description",
    mode: MODE.ENUM,
  },
  {
    table: "interview",
    id: "person_id",
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
      const stmt = db.prepare(`SELECT ${ctx.id}, ${c} FROM ${t}`);

      for (const record of stmt.iterate()) {
        const en = record[c];
        const url =
          "https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=it&dt=t&q=" +
          encodeURIComponent(en);
        const it = fetch(url)
          .then((response) => response.json())
          .then((json) => {
            try {
              const it = processGoogleTranslateResponse(json);
              const sql = `UPDATE ${t} SET ${c} = ? WHERE ${id} = ?`;
              console.log(sql);

              const stmt = db.prepare(sql);
              const info = stmt.run(it, id);
              console.log(info.changes);
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
  });
}

main();
