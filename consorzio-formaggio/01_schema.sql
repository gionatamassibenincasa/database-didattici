--
-- Schema (DDL)
--
BEGIN TRANSACTION;

--!
--! Provincia
--! 
CREATE TABLE Provincia (
    --! sigla automobilistica della provincia
    sigla TEXT PRIMARY KEY
        CHECK (
		LENGTH(sigla) = 2
	       	OR sigla = 'BAT'
	       	OR 'ROMA'),
    nome TEXT);

--!
--! Comune
--! 
CREATE TABLE Comune (
    --! codice catastale del comune
    codice TEXT PRIMARY KEY
		CHECK(LENGTH(codice) = 4),
    comune TEXT,
    provincia TEXT
		REFERENCES Provincia(sigla),
    UNIQUE(comune, provincia)
);

--!
--! Caseificio
--! 
CREATE TABLE Caseificio (
    codice INTEGER PRIMARY KEY
		CHECK (codice BETWEEN 0 AND 9999),
    nome TEXT NOT NULL,
    indirizzo TEXT,
    comune TEXT REFERENCES Comune(codice),
    latitudine REAL
		CHECK(latitudine BETWEEN 35 AND 47),
    longitudine REAL
		CHECK(longitudine BETWEEN 6 AND 19),
    titolare TEXT
);

--!
--! Fotografia
--! 
CREATE TABLE Fotografia (
    codice INTEGER PRIMARY KEY,
    codiceCaseificio INTEGER
		REFERENCES Caseificio(codice),
    percorso TEXT NOT NULL UNIQUE
);

--!
--! Raccolta
--! 
CREATE TABLE Raccolta (
    codice INTEGER
		REFERENCES Caseificio(codice),
    data TEXT,
    quantita REAL CHECK(quantita >= 0),
    PRIMARY KEY(codice, data)
);

--!
--! Forma
--! 
CREATE TABLE Forma (
    codice INTEGER PRIMARY KEY,
    codiceCaseificio INTEGER
		REFERENCES Caseificio(codice),
    data TEXT,
    quantitaLatte REAL DEFAULT 10
		CHECK(quantitaLatte >= 0),
    progressivo INTEGER
    -- non si può inserire un vincolo UNIQUE(substr(data,1, 4) || substr(data, 6, 2) || progressivo)
    -- si usa un trigger
);

--!
--! Acquirente
--! 
CREATE TABLE Acquirente (
    nome TEXT PRIMARY KEY,
    tipo TEXT
		CHECK (tipo IN (
			'grande distribuzione',
			'grossista',
			'privato'))
);

--!
--! Vendita
--! 
CREATE TABLE Vendita (
    codiceForma INTEGER
    PRIMARY KEY
	REFERENCES Forma(codice),
    acquirente TEXT
      REFERENCES Acquirente(nome),
    data TEXT,
    scelta INTEGER
		CHECK(scelta BETWEEN 1 AND 2),
    stagionatura INTEGER
		CHECK(stagionatura in (
				12,
				24,
				30,
				36))
);

--!
--! Vincolo di unicità del progressivo della forma
--!
CREATE  TRIGGER valida_progressivo
BEFORE  INSERT  ON Forma
BEGIN
	SELECT RAISE(ABORT, "Violazione del vincolo di unicità del codice della forma")
	WHERE EXISTS(SELECT * FROM Forma WHERE codiceCaseificio || substr(data,1, 4) || substr(data, 6, 2) || progressivo = NEW.codiceCaseificio || substr(NEW.data,1, 4) || substr(NEW.data, 6, 2) || NEW.progressivo);
END;

COMMIT;

--
-- END
--

