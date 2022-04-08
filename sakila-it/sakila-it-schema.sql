/*

Sakila for SQLite is a port of the Sakila example database available for MySQL, which was originally developed by Mike Hillyer of the MySQL AB documentation team. 
This project is designed to help database administrators to decide which database to use for development of new products
The user can run the same SQL against different kind of databases and compare the performance

License: BSD
Copyright DB Software Laboratory
http://www.etl-tools.com

*/

--
-- Table structure for table attore
--
--DROP TABLE attore;

CREATE TABLE attore (
  attore_id numeric NOT NULL ,
  nome VARCHAR(45) NOT NULL,
  cognome VARCHAR(45) NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (attore_id)
  )
  ;

CREATE  INDEX idx_attore_cognome ON attore(cognome)
;
 
CREATE TRIGGER attore_trigger_ai AFTER INSERT ON attore
 BEGIN
  UPDATE attore SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER attore_trigger_au AFTER UPDATE ON attore
 BEGIN
  UPDATE attore SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

 --
-- Table structure for table nazione
--

CREATE TABLE nazione (
  nazione_id SMALLINT NOT NULL,
  nazione VARCHAR(50) NOT NULL,
  ultima_modifica TIMESTAMP,
  PRIMARY KEY  (nazione_id)
)
;

CREATE TRIGGER nazione_trigger_ai AFTER INSERT ON nazione
 BEGIN
  UPDATE nazione SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER nazione_trigger_au AFTER UPDATE ON nazione
 BEGIN
  UPDATE nazione SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table citta
--

CREATE TABLE citta (
  citta_id int NOT NULL,
  citta VARCHAR(50) NOT NULL,
  nazione_id SMALLINT NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (citta_id),
  CONSTRAINT fk_citta_nazione FOREIGN KEY (nazione_id) REFERENCES nazione (nazione_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
;
CREATE  INDEX idx_fk_nazione_id ON citta(nazione_id)
;

CREATE TRIGGER citta_trigger_ai AFTER INSERT ON citta
 BEGIN
  UPDATE citta SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER citta_trigger_au AFTER UPDATE ON citta
 BEGIN
  UPDATE citta SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table indirizzo
--

CREATE TABLE indirizzo (
  indirizzo_id int NOT NULL,
  indirizzo VARCHAR(50) NOT NULL,
  indirizzo2 VARCHAR(50) DEFAULT NULL,
  quartiere VARCHAR(20) NOT NULL,
  citta_id INT  NOT NULL,
  codice_postale VARCHAR(10) DEFAULT NULL,
  telefono VARCHAR(20) NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (indirizzo_id),
  CONSTRAINT fk_indirizzo_citta FOREIGN KEY (citta_id) REFERENCES citta (citta_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
;

CREATE  INDEX idx_fk_citta_id ON indirizzo(citta_id)
;

CREATE TRIGGER indirizzo_trigger_ai AFTER INSERT ON indirizzo
 BEGIN
  UPDATE indirizzo SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER indirizzo_trigger_au AFTER UPDATE ON indirizzo
 BEGIN
  UPDATE indirizzo SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table lingua
--

CREATE TABLE lingua (
  lingua_id SMALLINT NOT NULL ,
  nome CHAR(20) NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY (lingua_id)
)
;

CREATE TRIGGER lingua_trigger_ai AFTER INSERT ON lingua
 BEGIN
  UPDATE lingua SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER lingua_trigger_au AFTER UPDATE ON lingua
 BEGIN
  UPDATE lingua SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table categoria
--

CREATE TABLE categoria (
  categoria_id SMALLINT NOT NULL,
  nome VARCHAR(25) NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (categoria_id)
);

CREATE TRIGGER categoria_trigger_ai AFTER INSERT ON categoria
 BEGIN
  UPDATE categoria SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER categoria_trigger_au AFTER UPDATE ON categoria
 BEGIN
  UPDATE categoria SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table cliente
--

CREATE TABLE cliente (
  cliente_id INT NOT NULL,
  negozio_id INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  cognome VARCHAR(45) NOT NULL,
  email VARCHAR(50) DEFAULT NULL,
  indirizzo_id INT NOT NULL,
  attivo CHAR(1) DEFAULT 'Y' NOT NULL,
  data_creazione TIMESTAMP NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (cliente_id),
  CONSTRAINT fk_cliente_negozio FOREIGN KEY (negozio_id) REFERENCES negozio (negozio_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_cliente_indirizzo FOREIGN KEY (indirizzo_id) REFERENCES indirizzo (indirizzo_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
;

CREATE  INDEX idx_cliente_fk_negozio_id ON cliente(negozio_id)
;
CREATE  INDEX idx_cliente_fk_indirizzo_id ON cliente(indirizzo_id)
;
CREATE  INDEX idx_cliente_cognome ON cliente(cognome)
;

CREATE TRIGGER cliente_trigger_ai AFTER INSERT ON cliente
 BEGIN
  UPDATE cliente SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER cliente_trigger_au AFTER UPDATE ON cliente
 BEGIN
  UPDATE cliente SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table film
--

CREATE TABLE film (
  film_id int NOT NULL,
  titolo VARCHAR(255) NOT NULL,
  descrizione BLOB SUB_TYPE TEXT DEFAULT NULL,
  anno_uscita VARCHAR(4) DEFAULT NULL,
  lingua_id SMALLINT NOT NULL,
  lingua_originale_id SMALLINT DEFAULT NULL,
  durata_noleggio SMALLINT  DEFAULT 3 NOT NULL,
  canone_noleggio DECIMAL(4,2) DEFAULT 4.99 NOT NULL,
  durata SMALLINT DEFAULT NULL,
  costo_rimpiazzo DECIMAL(5,2) DEFAULT 19.99 NOT NULL,
  valutazione VARCHAR(10) DEFAULT 'G',
  caratteristiche_particolari VARCHAR(100) DEFAULT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (film_id),
  CONSTRAINT CHECK_caratteristiche_particolari CHECK(caratteristiche_particolari is null or
                                                           caratteristiche_particolari like '%Trailers%' or
                                                           caratteristiche_particolari like '%Commentaries%' or
                                                           caratteristiche_particolari like '%Deleted Scenes%' or
                                                           caratteristiche_particolari like '%Behind the Scenes%'),
  CONSTRAINT CHECK_special_valutazione CHECK(valutazione in ('G','PG','PG-13','R','NC-17')),
  CONSTRAINT fk_film_lingua FOREIGN KEY (lingua_id) REFERENCES lingua (lingua_id) ,
  CONSTRAINT fk_film_lingua_original FOREIGN KEY (lingua_originale_id) REFERENCES lingua (lingua_id)
)
;
CREATE  INDEX idx_fk_lingua_id ON film(lingua_id)
;
CREATE  INDEX idx_fk_lingua_originale_id ON film(lingua_originale_id)
;

CREATE TRIGGER film_trigger_ai AFTER INSERT ON film
 BEGIN
  UPDATE film SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER film_trigger_au AFTER UPDATE ON film
 BEGIN
  UPDATE film SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table film_attore
--

CREATE TABLE film_attore (
  attore_id INT NOT NULL,
  film_id  INT NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (attore_id,film_id),
  CONSTRAINT fk_film_attore_attore FOREIGN KEY (attore_id) REFERENCES attore (attore_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_film_attore_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
;

CREATE  INDEX idx_fk_film_attore_film ON film_attore(film_id)
;

CREATE  INDEX idx_fk_film_attore_attore ON film_attore(attore_id) 
;

CREATE TRIGGER film_attore_trigger_ai AFTER INSERT ON film_attore
 BEGIN
  UPDATE film_attore SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER film_attore_trigger_au AFTER UPDATE ON film_attore
 BEGIN
  UPDATE film_attore SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;


--
-- Table structure for table film_categoria
--

CREATE TABLE film_categoria (
  film_id INT NOT NULL,
  categoria_id SMALLINT  NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY (film_id, categoria_id),
  CONSTRAINT fk_film_categoria_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_film_categoria_categoria FOREIGN KEY (categoria_id) REFERENCES categoria (categoria_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
;

CREATE  INDEX idx_fk_film_categoria_film ON film_categoria(film_id)
;

CREATE  INDEX idx_fk_film_categoria_categoria ON film_categoria(categoria_id)
;

CREATE TRIGGER film_categoria_trigger_ai AFTER INSERT ON film_categoria
 BEGIN
  UPDATE film_categoria SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER film_categoria_trigger_au AFTER UPDATE ON film_categoria
 BEGIN
  UPDATE film_categoria SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table film_testo
--

CREATE TABLE film_testo (
  film_id SMALLINT NOT NULL,
  titolo VARCHAR(255) NOT NULL,
  descrizione BLOB SUB_TYPE TEXT,
  PRIMARY KEY  (film_id)
)
;

--
-- Table structure for table inventario
--

CREATE TABLE inventario (
  inventario_id INT NOT NULL,
  film_id INT NOT NULL,
  negozio_id INT NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (inventario_id),
  CONSTRAINT fk_inventario_negozio FOREIGN KEY (negozio_id) REFERENCES negozio (negozio_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_inventario_film FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
;

CREATE  INDEX idx_fk_film_id ON inventario(film_id)
;

CREATE  INDEX idx_fk_film_id_negozio_id ON inventario(negozio_id,film_id)
;

CREATE TRIGGER inventario_trigger_ai AFTER INSERT ON inventario
 BEGIN
  UPDATE inventario SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER inventario_trigger_au AFTER UPDATE ON inventario
 BEGIN
  UPDATE inventario SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table personale
--

CREATE TABLE personale (
  personale_id SMALLINT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  cognome VARCHAR(45) NOT NULL,
  indirizzo_id INT NOT NULL,
  fotografia BLOB DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  negozio_id INT NOT NULL,
  attivo SMALLINT DEFAULT 1 NOT NULL,
  username VARCHAR(16) NOT NULL,
  password VARCHAR(40) DEFAULT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (personale_id),
  CONSTRAINT fk_personale_negozio FOREIGN KEY (negozio_id) REFERENCES negozio (negozio_id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT fk_personale_indirizzo FOREIGN KEY (indirizzo_id) REFERENCES indirizzo (indirizzo_id) ON DELETE NO ACTION ON UPDATE CASCADE
)
;
CREATE  INDEX idx_fk_personale_negozio_id ON personale(negozio_id)
;

CREATE  INDEX idx_fk_personale_indirizzo_id ON personale(indirizzo_id)
;

CREATE TRIGGER personale_trigger_ai AFTER INSERT ON personale
 BEGIN
  UPDATE personale SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER personale_trigger_au AFTER UPDATE ON personale
 BEGIN
  UPDATE personale SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table negozio
--

CREATE TABLE negozio (
  negozio_id INT NOT NULL,
  responsabile_personale_id SMALLINT NOT NULL,
  indirizzo_id INT NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (negozio_id),
  CONSTRAINT fk_negozio_personale FOREIGN KEY (responsabile_personale_id) REFERENCES personale (personale_id) ,
  CONSTRAINT fk_negozio_indirizzo FOREIGN KEY (indirizzo_id) REFERENCES indirizzo (indirizzo_id)
)
;

CREATE  INDEX idx_negozio_fk_responsabile_personale_id ON negozio(responsabile_personale_id)
;

CREATE  INDEX idx_fk_negozio_indirizzo ON negozio(indirizzo_id)
;

CREATE TRIGGER negozio_trigger_ai AFTER INSERT ON negozio
 BEGIN
  UPDATE negozio SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER negozio_trigger_au AFTER UPDATE ON negozio
 BEGIN
  UPDATE negozio SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

--
-- Table structure for table pagamento
--

CREATE TABLE pagamento (
  pagamento_id int NOT NULL,
  cliente_id INT  NOT NULL,
  personale_id SMALLINT NOT NULL,
  noleggio_id INT DEFAULT NULL,
  importo DECIMAL(5,2) NOT NULL,
  data_pagamento TIMESTAMP NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY  (pagamento_id),
  CONSTRAINT fk_pagamento_noleggio FOREIGN KEY (noleggio_id) REFERENCES noleggio (noleggio_id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_pagamento_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (cliente_id) ,
  CONSTRAINT fk_pagamento_personale FOREIGN KEY (personale_id) REFERENCES personale (personale_id)
)
;
CREATE  INDEX idx_fk_personale_id ON pagamento(personale_id)
;
CREATE  INDEX idx_fk_cliente_id ON pagamento(cliente_id)
;

CREATE TRIGGER pagamento_trigger_ai AFTER INSERT ON pagamento
 BEGIN
  UPDATE pagamento SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER pagamento_trigger_au AFTER UPDATE ON pagamento
 BEGIN
  UPDATE pagamento SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;

CREATE TABLE noleggio (
  noleggio_id INT NOT NULL,
  data_noleggio TIMESTAMP NOT NULL,
  inventario_id INT  NOT NULL,
  cliente_id INT  NOT NULL,
  data_restituzione TIMESTAMP DEFAULT NULL,
  personale_id SMALLINT  NOT NULL,
  ultima_modifica TIMESTAMP NOT NULL,
  PRIMARY KEY (noleggio_id),
  CONSTRAINT fk_noleggio_personale FOREIGN KEY (personale_id) REFERENCES personale (personale_id) ,
  CONSTRAINT fk_noleggio_inventario FOREIGN KEY (inventario_id) REFERENCES inventario (inventario_id) ,
  CONSTRAINT fk_noleggio_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (cliente_id)
)
;
CREATE INDEX idx_noleggio_fk_inventario_id ON noleggio(inventario_id)
;
CREATE INDEX idx_noleggio_fk_cliente_id ON noleggio(cliente_id)
;
CREATE INDEX idx_noleggio_fk_personale_id ON noleggio(personale_id)
;
CREATE UNIQUE INDEX   idx_noleggio_uq  ON noleggio (data_noleggio,inventario_id,cliente_id)
;

CREATE TRIGGER noleggio_trigger_ai AFTER INSERT ON noleggio
 BEGIN
  UPDATE noleggio SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
 
CREATE TRIGGER noleggio_trigger_au AFTER UPDATE ON noleggio
 BEGIN
  UPDATE noleggio SET ultima_modifica = DATETIME('NOW')  WHERE rowid = new.rowid;
 END
;
--
-- View structure for view elenco_clienti
--

CREATE VIEW elenco_clienti
AS
SELECT cu.cliente_id AS ID,
       cu.nome||' '||cu.cognome AS nome,
       a.indirizzo AS indirizzo,
       a.codice_postale AS CAP,
       a.telefono AS telefono,
       citta.citta AS citta,
       nazione.nazione AS nazione,
       case when cu.attivo=1 then 'attivo' else '' end AS note,
       cu.negozio_id AS SID
FROM cliente AS cu JOIN indirizzo AS a ON cu.indirizzo_id = a.indirizzo_id JOIN citta ON a.citta_id = citta.citta_id
    JOIN nazione ON citta.nazione_id = nazione.nazione_id
;
--
-- View structure for view cognome
--

CREATE VIEW cognome
AS
SELECT film.film_id AS FID,
       film.titolo AS titolo,
       film.descrizione AS descrizione,
       categoria.nome AS categoria,
       film.canone_noleggio AS prezzo,
       film.durata AS durata,
       film.valutazione AS valutazione,
       attore.nome||' '||attore.cognome AS attori
FROM categoria LEFT JOIN film_categoria ON categoria.categoria_id = film_categoria.categoria_id LEFT JOIN film ON film_categoria.film_id = film.film_id
        JOIN film_attore ON film.film_id = film_attore.film_id
    JOIN attore ON film_attore.attore_id = attore.attore_id
;

--
-- View structure for view elenco_personale
--

CREATE VIEW elenco_personale
AS
SELECT s.personale_id AS ID,
       s.nome||' '||s.cognome AS nome,
       a.indirizzo AS indirizzo,
       a.codice_postale AS CAP,
       a.telefono AS telefono,
       citta.citta AS citta,
       nazione.nazione AS nazione,
       s.negozio_id AS SID
FROM personale AS s JOIN indirizzo AS a ON s.indirizzo_id = a.indirizzo_id JOIN citta ON a.citta_id = citta.citta_id
    JOIN nazione ON citta.nazione_id = nazione.nazione_id
;
--
-- View structure for view vendite_per_negozio
--

CREATE VIEW vendite_per_negozio
AS
SELECT
  s.negozio_id
 ,c.citta||','||cy.nazione AS negozio
 ,m.nome||' '||m.cognome AS responsabile
 ,SUM(p.importo) AS vendite_totali
FROM pagamento AS p
INNER JOIN noleggio AS r ON p.noleggio_id = r.noleggio_id
INNER JOIN inventario AS i ON r.inventario_id = i.inventario_id
INNER JOIN negozio AS s ON i.negozio_id = s.negozio_id
INNER JOIN indirizzo AS a ON s.indirizzo_id = a.indirizzo_id
INNER JOIN citta AS c ON a.citta_id = c.citta_id
INNER JOIN nazione AS cy ON c.nazione_id = cy.nazione_id
INNER JOIN personale AS m ON s.responsabile_personale_id = m.personale_id
GROUP BY  
  s.negozio_id
, c.citta||','||cy.nazione
, m.nome||' '||m.cognome
;
--
-- View structure for view sales_by_film_categoria
--
-- Note that total sales will add up to >100% because
-- some titolos belong to more than 1 categoria
--

CREATE VIEW sales_by_film_categoria
AS
SELECT
c.nome AS categoria
, SUM(p.importo) AS vendite_totali
FROM pagamento AS p
INNER JOIN noleggio AS r ON p.noleggio_id = r.noleggio_id
INNER JOIN inventario AS i ON r.inventario_id = i.inventario_id
INNER JOIN film AS f ON i.film_id = f.film_id
INNER JOIN film_categoria AS fc ON f.film_id = fc.film_id
INNER JOIN categoria AS c ON fc.categoria_id = c.categoria_id
GROUP BY c.nome
;

--
-- View structure for view attore_info
--

/*
CREATE VIEW attore_info
AS
SELECT
a.attore_id,
a.nome,
a.cognome,
GROUP_CONCAT(DISTINCT CONCAT(c.nome, ': ',
        (SELECT GROUP_CONCAT(f.titolo ORDER BY f.titolo SEPARATOR ', ')
                    FROM sakila.film f
                    INNER JOIN sakila.film_categoria fc
                      ON f.film_id = fc.film_id
                    INNER JOIN sakila.film_attore fa
                      ON f.film_id = fa.film_id
                    WHERE fc.categoria_id = c.categoria_id
                    AND fa.attore_id = a.attore_id
                 )
             )
             ORDER BY c.nome SEPARATOR '; ')
AS film_info
FROM sakila.attore a
LEFT JOIN sakila.film_attore fa
  ON a.attore_id = fa.attore_id
LEFT JOIN sakila.film_categoria fc
  ON fa.film_id = fc.film_id
LEFT JOIN sakila.categoria c
  ON fc.categoria_id = c.categoria_id
GROUP BY a.attore_id, a.nome, a.cognome;
*/

-- TO DO PROCEDURES
-- TO DO TRIGGERS

