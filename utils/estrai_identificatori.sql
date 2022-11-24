-- Query per ottenere gli identificatori da tradurre
SELECT DISTINCT 's/' || identificatore || '//g'
FROM
(SELECT DISTINCT m.tbl_name AS identificatore
  FROM sqlite_schema AS m
 WHERE m.type IN ('table', 'view')
UNION
SELECT DISTINCT colonne.name AS identificatore
  FROM sqlite_schema AS catalogo,
  pragma_table_info(catalogo.name) AS colonne
 WHERE catalogo.type IN ('table', 'view')
)
ORDER BY length(identificatore) DESC, substr(identificatore, 1, 1);
