--
-- Viste (DQL, DDL)
--

BEGIN TRANSACTION;

-- Visualizzare il numero di forme prodotte da ciascun caseificio
-- tra due date fornite
-- Nel programma la query va costruita con due parametri nella
-- clausola WHERE
CREATE VIEW q1 AS
SELECT nome, count(*) AS Numero
FROM Forma
    INNER JOIN Caseificio
        ON Forma.codiceCaseificio = Caseificio.codice
WHERE data BETWEEN '2021-02-03' AND '2021-03-04'
-- le date devono essere parametrizzate nell'applicazione
GROUP BY codiceCaseificio;


-- Visualizzare la media del latte lavorato giornalmente nell'anno
-- corrente dai caseifici provincia per provincia
CREATE VIEW q2 AS
SELECT AVG(quantita) AS mediaLatteRaccolto, provincia
FROM raccolta
    INNER JOIN Caseificio
        ON Raccolta.codice = Caseificio.codice
    INNER JOIN Comune
        ON Caseificio.comune = Comune.codice
WHERE substr(data, 1, 4) = substr(date(), 1, 4)
GROUP BY Comune.provincia;

-- Visualizzare i dati del caseificio che ha venduto il maggior numero
-- di forme di prima scelta in un anno impostato dall’utente
-- Nel programma la query va costruita con un parametro nella
-- clausola WHERE
CREATE VIEW q3 AS
SELECT *
FROM Caseificio
WHERE codice = 
(SELECT codiceCaseificio
FROM Vendita AS V
    INNER JOIN Forma AS F
        ON V.codiceForma = F.codice
    INNER JOIN Caseificio AS C
        ON F.codiceCaseificio = C.codice
WHERE
    V.scelta = 1
-- AND substr(V.data, 1, 4) = %1
GROUP BY C.codice
ORDER BY count(scelta) DESC
LIMIT 1);

-- Visualizzare l’elenco dei caseifici che, in un certo periodo
-- individuato da due date fornite dall’utente, hanno venduto
-- meno di 10 forme di seconda scelta
-- Nel programma la query va costruita con due parametri nella
-- clausola WHERE
CREATE VIEW q4 AS
SELECT C.nome
FROM Vendita AS V
    INNER JOIN Forma AS F
      ON V.codiceForma = F.codice
    INNER JOIN Caseificio AS C
      ON F.codiceCaseificio = C.codice
WHERE V.scelta = 2
    AND V.data
      BETWEEN '2000-01-01' AND '2022-12-31'
      -- le date vanno parametrizzate
GROUP BY C.codice
HAVING count(*) < 10;

-- Calcolare la percentuale di forme di seconda scelta prodotte
-- annualmente da un certo caseificio (sul totale delle forme da
-- questi prodotte annualmente)
CREATE VIEW q5 AS
SELECT FormeTotali.nome,
       FormeTotali.anno,
       100 * Forme2aScelta.forme / FormeTotali.forme || " %"
       AS perc2scelta
FROM
  (
  SELECT C.nome,
    substr(F.data, 1, 4) AS anno,
    count(*) AS forme
  FROM Vendita AS V
    INNER JOIN Forma AS F ON V.codiceForma = F.codice
    INNER JOIN Caseificio AS C ON F.codiceCaseificio = C.codice
  GROUP BY C.codice, anno
  ) AS FormeTotali
    INNER JOIN
  (
  SELECT C.nome,
    substr(F.data, 1, 4) AS anno,
    count(*) AS forme
  FROM Vendita AS V
      INNER JOIN Forma AS F ON V.codiceForma = F.codice
      INNER JOIN Caseificio AS C ON F.codiceCaseificio = C.codice
  WHERE V.scelta = 2
  GROUP BY C.codice, anno
  ) AS Forme2aScelta
    ON FormeTotali.nome = Forme2aScelta.nome
      AND FormeTotali.anno = Forme2aScelta.anno;

COMMIT;

--
-- END
--
