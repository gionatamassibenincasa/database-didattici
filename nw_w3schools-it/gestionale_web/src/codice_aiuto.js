import hljs from 'highlight.js';
import 'highlight.js/styles/github.css';

export let aiuti = {
    html_select: {
        src: `<form method="get">
   <label for="ordine">
      Scegli l'ordine:
      <select id="ordine" name="id_ordine">
         <option value="0">Scegli un'ordine</option>
         <option value="10248">n. 10248 del 1996 - 07 - 04</option>
         <option value="10249">n. 10249 del 1996 - 07 - 05</option>
         <option value="10250">n. 10250 del 1996 - 07 - 08</option>
         <option value="10251">n. 10251 del 1996 - 07 - 08</option>
         <option value="10252">n. 10252 del 1996 - 07 - 09</option>
         <option value="10253">n. 10253 del 1996 - 07 - 10</option>
         <option value="10254">n. 10254 del 1996 - 07 - 11</option>
      </select>
   </label>
   <button type="submit">Dettagli</button>
</form>`,
        linguaggio: 'html'
    },
    php_select: {
        src: `<?php

        try {
            // Connect to SQLite database in file
            $db = new PDO('sqlite:nw_w3school-it.sqlite');
            // Set errormode to exceptions
            $db->setAttribute(PDO::ATTR_ERRMODE, 
                                    PDO::ERRMODE_EXCEPTION);
            // The SQL query string
            // Annotate the field names (i.e. id_ordine and data_ordine)
            $sql = 'SELECT id_ordine, data_ordine FROM ordine ORDER BY data_ordine';
        
            // Execute the query and save the result in an array of associative arrays
            $table = $db->query($sql)->fetchAll();
        
            // Generate the options
        ?>
          <form>
            <select name="id_ordine">
        <?
        // Run over the data using the C style iteration
            for($i = 0; $i < count($table); $i++) {
              // r is the reference for the record
              $r = $table[$i];
              // To access the field use $r[field_name]
              echo '<option value="' . $r['id_ordine'] . '">' . $r['id_ordine'] . "</option>\n";
            }
          } catch(PDOException $e) {
            // Print PDOException message
            echo $e->getMessage();
          }
        ?>
            </select>
            <button type="submit">Invia</button>
          </form>
        
        <?php
          if($_GET['id_ordine']) {
        ?>
          <table>
            <caption>Ordine n. <? echo $_GET['id_ordine']; ?></caption>
            <thead>
              <tr>
                <th>Codice...</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td></td>
              </tr>
            </tbody>
          </table>
        <?php
          }
            ?>
        <?php
            // At the and, close the db connection
            $db = null;
        ?>`,
        lang: 'php'
  },
  sql_data_ordine: {
    src: `SELECT id_ordine, data_ordine
FROM ordine
ORDER BY data_ordine`,
    lang: 'sql'
    },
    sql_acquirente_ordine: {
      src: `SELECT azienda
FROM cliente
  INNER JOIN ordine USING (id_cliente)
WHERE id_ordine = ???`,
      lang: 'sql'
      },
      sql_dettaglio_ordine: {
        src: `SELECT id_prodotto AS codice, nome, quantita, prezzo, quantita * prezzo AS prezzo_totale
FROM ordine
  INNER JOIN composizione USING (id_ordine)
  INNER JOIN prodotto USING (id_prodotto)
WHERE id_ordine = ???`,
        lang: 'sql'
  },
  sql_riepilogo_ordine: {
        src: `SELECT SUM(quantita) AS quantita_totale, SUM(quantita * prezzo) AS importo_totale
FROM ordine
  INNER JOIN composizione USING (id_ordine)
  INNER JOIN prodotto USING (id_prodotto)
WHERE id_ordine = ???`,
    lang: 'php'
      }
};
