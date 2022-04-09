-- Query 1:
-- Elenca tutti i dati dei clienti
SELECT * FROM cliente;

-- Query 2:
-- Elenca le nazioni dei clienti
SELECT nazione FROM cliente;

-- Query 3:
-- Elenca le nazioni in modo distinto
-- (ogni nazione deve comparire una sola volta)
SELECT DISTINCT nazione FROM cliente;

-- Query 4:
-- Conta il numero di nazioni distinte dei clienti
SELECT COUNT(DISTINCT nazione) FROM cliente;
-- oppure SELECT COUNT(nazione) FROM (SELECT DISTINCT nazione FROM cliente);
-- oppure SELECT COUNT(*) FROM (SELECT nazione FROM cliente GROUP BY nazione);

-- Query 5:
-- Per ogni nazione, conta il numero di clienti
SELECT nazione, COUNT(id_cliente)
FROM cliente
GROUP BY nazione;

-- Query 6:
-- Elenca tutti i clienti del ‘Mexico’
SELECT * FROM cliente WHERE nazione = 'Mexico';

-- Query 7:
-- Elenca tutti i clienti che sono tedeschi
-- (la nazione è indicata come ‘Germany’) e residenti a ‘Berlin’
SELECT * FROM cliente WHERE nazione = 'Germany' AND citta = 'Berlin';

-- Query 8:
-- Elenca tutti i clienti che sono tedeschi
-- (la nazione è indicata come ‘Germany’) e residenti
-- a ‘Berlin’ oppure a ‘Stuttgart’
-- SELECT * FROM cliente WHERE nazione = 'Germany' AND (citta = 'Berlin' OR citta = 'Stuttgart');
-- oppure SELECT * FROM cliente WHERE nazione = 'Germany' AND citta IN ('Berlin' , 'Stuttgart');

-- Query 9:
-- Conta il numero dei clienti che non sono né statunitensi
-- (nazione ‘USA’) né tedeschi (‘Germany’)
SELECT COUNT(*) FROM cliente WHERE nazione NOT IN ('USA', 'Germany');

-- Query 10:
-- Elenca il prezzo del prodotto, o dei prodotti, che costa, o costano, meno
SELECT MIN(prezzo) FROM prodotto;

-- Query 11:
-- Elenca l’id dell’ordine, il nome del cliente e quello dello
-- spedizioniere di tutti gli ordini presenti nella base di dati
SELECT o.id_ordine, c.azienda, s.nome
FROM ordine AS o INNER JOIN cliente AS c ON o.id_cliente = c.id_cliente
INNER JOIN spedizioniere AS s ON o.id_spedizioniere = s.id_spedizioniere;

-- Query 12:
-- Elenca i clienti che sono della stessa città proiettando gli
-- attributi con le seguenti ridenominazioni:
-- Cliente1, Cliente2, Citta
SELECT A.azienda AS Cliente1, B.azienda AS Cliente2, A.citta AS Citta
FROM cliente A, cliente B
WHERE A.id_cliente <> B.id_cliente
AND A.citta = B.citta;

-- Query 13:
-- Elenca il numero di clienti in ogni nazione, ridenominando gli
-- attributi: NumClienti, Nazione
SELECT COUNT(*) AS NumClienti, nazione AS Nazione FROM cliente
GROUP BY nazione;

-- Query 14:
-- Elenca il numero di clienti in ogni nazione in cui ci sono almeno
-- 6 clienti, ridenominando gli attributi: NumClienti, Nazione
SELECT COUNT(*) AS NumClienti, nazione AS Nazione FROM cliente
GROUP BY nazione HAVING NumClienti > 5;

-- Query 15:
-- Conta i prodotti il cui prezzo è 18 e la categoria è ‘Beverages’
SELECT COUNT(*) FROM prodotto AS p INNER JOIN categoria AS c USING (id_categoria)
WHERE c.nome = 'Beverages';

-- Query 16:
-- Elenca i clienti il cui nome (azienda) inizia per A ed è lungo almeno 3 caratteri
SELECT * FROM cliente WHERE azienda LIKE 'a__%';

-- Query 17:
-- Elenca i clienti i cui fornitori sono nella stessa nazione
