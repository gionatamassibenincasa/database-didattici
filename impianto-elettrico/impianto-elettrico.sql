--% dbcon: {"dbfile" : "impianto-elettrico.sqlite"}

DROP TABLE IF EXISTS TipoCavo;

CREATE TABLE TipoCavo (
    tipoCavoId  INTEGER PRIMARY KEY,
    cavo    TEXT,
    colore  TEXT,
    sezione REAL
);

INSERT INTO TipoCavo (tipoCavoId, cavo, colore, sezione) VALUES
  (125, 'Fase FEM 25', 'marrone', 25.0)
, (225, 'Neutro FEM 25', 'giallo-verde', 25.0)
, (325, 'Neutro FEM 25', 'azzurro', 25.0)
, (415, 'Fase LUCE', 'nero', 15.0)
, (515, 'Ritorno LUCE', 'azzurro', 15.0)
, (615, 'Linea 1 deviatore', 'grigio', 15.0)
, (715, 'Linea 2 deviatore', 'grigio', 15.0);

DROP TABLE IF EXISTS TipoFrutto;

CREATE TABLE TipoFrutto (
    tipoFruttoId INTEGER PRIMARY KEY,
    frutto   TEXT,
    note     TEXT
);

INSERT INTO TipoFrutto (tipoFruttoId, frutto, note) VALUES
  (1, 'Interruttore', 'Senza LED')
, (2, 'Interruttore', 'Con LED')
, (3, 'Deviatore', NULL)
, (4, 'Presa 10+16 A', NULL)
, (5, 'Presa schuko', NULL);


-- Table: Parete
DROP TABLE IF EXISTS Parete;

CREATE TABLE Parete (
    pareteId INTEGER PRIMARY KEY,
    parete   TEXT    NOT NULL
);

INSERT INTO Parete (pareteId, parete) VALUES
  (1, 'piano cottura')
, (2, 'lavello')
, (3, 'forni')
, (4, 'tv')
, (5, 'portafinestra');


-- Table: TipoScatola
DROP TABLE IF EXISTS TipoScatola;

CREATE TABLE TipoScatola (
    TipoScatolaId INTEGER PRIMARY KEY,
    tipoScatola TEXT,
    lunghezza  REAL,
    larghezza REAL,
    profondita REAL,
    moduli    INTEGER,
    descrizione TEXT
);

INSERT INTO TipoScatola (TipoScatolaId, tipoScatola, lunghezza, larghezza, profondita, moduli, descrizione) VALUES
  (1, '502E', 70.8, 71, 52.7, 2, 'Scatola portafrutti 2 moduli')
, (2, '503E', 107, 74, 53.3, 3,  'Scatola portafrutti 3 moduli')
, (3, '504E', 132, 74, 53.3, 4,  'Scatola portafrutti 4 moduli')
, (12, '503E', 107, 74, 53.3, 3,  'Scatola di derivazione adattata da 503E')
, (13, '504E', 132, 74, 53.3, 4,  'Scatola di derivazione adattata da 504E')
;


-- Table: Scatola
DROP TABLE IF EXISTS Scatola;

CREATE TABLE Scatola (
    scatolaId       INTEGER PRIMARY KEY,
    tipoScatolaId   INTEGER REFERENCES TipoScatola (TipoScatolaId),
    pareteId        INTEGER REFERENCES Parete (pareteId),
    spigolo         INTEGER REFERENCES Parete (pareteId),
    distanzaSpigolo INTEGER,
    altezzaTerra    INTEGER,
    tipo            TEXT    CHECK (tipo IN ('esistente', 'da realizzare', 'da trasformare in derivazione', 'da murare', 'altro') ),
    descrizione     TEXT
);

INSERT INTO Scatola (scatolaId, tipoScatolaId, pareteId, distanzaSpigolo, altezzaTerra, tipo, descrizione, spigolo) VALUES
  (1, 2, 1, 15, 100, 'da realizzare', 'In alto comando luce balcone, deviatore luce diffusa, controllo tapparella', 5)
, (2, 2, 1, 15, 30, 'da realizzare', 'In basso, una presa 10+16 A per Bimby, 1 presa shucko', 5)
, (3, 1, 2, 220, 100, 'da realizzare', 'In alto, interruttore luce centrare e deviatore luce diffusa', 1)
, (4, 3, 3, 235, 135, 'da realizzare', 'Presa per micronde', 4)
, (5, 2, 3, 235, 135, 'da realizzare', 'Presa per forno', 4)
, (11, 12, 1, 45, 100, 'da trasformare in derivazione', 'Esistente luce balcone e deviatore', 5)
, (12, 12, 1, 45, 30, 'da trasformare in derivazione', 'Esistente con una presa 10+16 A per Bimby', 5)
, (13, 12, 2, 220, 100, 'da trasformare in derivazione', 'Esistente con interrutore e deviatore', 1)
, (14, 13, 3, 235, 135, 'da trasformare in derivazione', 'Esistente con tre prese per forni', 4)
;

DROP TABLE IF EXISTS Canalizzazione;

CREATE TABLE Canalizzazione (
    canalizzazioneId INTEGER PRIMARY KEY,
    scatolaOrigineId INTEGER REFERENCES Scatola(scatolaId),
    scatolaDestinazioneId INTEGER REFERENCES Scatola(scatolaId),
    diametro INTEGER,
    lunghezza INTEGER,
    descrizione TEXT,
    cavi INTEGER
);

INSERT INTO Canalizzazione (canalizzazioneId, scatolaOrigineId, scatolaDestinazioneId, diametro, lunghezza, descrizione, cavi) VALUES
  (1, 11, 1, 20,  35, 'linea luce balcone, neutro per LED, cavi 1 e 2 deviatori e linea luci diffuse', 6)
, (2, 11, 1, 20,  35, 'cavi passanti per motorizzazione tapparella', 3)
, (3, 12, 2, 20,  35, 'fase, neutro e terra da 2,5 mm^2', 3)
, (4, 13, 3, 20,   5, 'fase lampadario e deviatore, ritorno e cavi 1 e 2', 4)
, (5, 14, 4, 20,  75, 'fase, neutro e terra da 2,5 mm^2', 3)
, (6, 14, 5, 20, 105, 'fase, neutro e terra da 2,5 mm^2', 3)
;

DROP TABLE IF EXISTS Linea;

CREATE TABLE Linea (
    lineaId INTEGER PRIMARY KEY,
    linea TEXT
);

INSERT INTO Linea (lineaId, linea) VALUES
  (1, 'Fase Luce reparto giorno')
, (2, 'Neutro Luce reparto giorno')
, (3, 'Linea 1 deviatore')
, (4, 'Linea 2 deviatore')
, (5, 'Fase Prese zona cottura')
, (6, 'Neutro Prese zona cottura')
, (7, 'Fase prese reparto giorno')
, (8, 'Neutro prese reparto giorno')
;

DROP TABLE IF EXISTS Cavo;

CREATE TABLE Cavo (
    cavoId INTEGER PRIMARY KEY,
    tipoCavoId INTEGER REFERENCES TipoCavo(tipoCavoId),
    lineaId INTEGER REFERENCES Linea(lineaId),
    canalizzazioneId INTEGER REFERENCES Canalizzazione(canalizzazioneId)
);

-- Inserire i cavi

DROP TABLE IF EXISTS Frutto;

CREATE TABLE Frutto (
    fruttoId INTEGER PRIMARY KEY,
    tipoFruttoId INTEGER REFERENCES TipoFrutto(tipoFruttoId),
    scatolaId INTEGER REFERENCES Scatola(scatolaId),
    posizione INTEGER,
    UNIQUE(scatolaId, posizione)
);

INSERT INTO Frutto (fruttoId, tipoFruttoId, scatolaId, posizione) VALUES
  (1, 2, 1, 1)
, (2, 3, 1, 3)
, (3, 5, 2, 1)
, (4, 4, 2, 3)
, (5, 1, 3, 1)
, (6, 3, 3, 3)
, (7, 5, 4, 1)
, (8, 5, 5, 1)
;

DROP TABLE ID EXISTS TipoMorsetto;

CREATE TABLE TipoMorsetto (
    tipoMorsettoId INTEGER PRIMARY KEY,
    tipo TEXT,
    diametro INTEGER
);

-- Inserisci TipoMorsetto

DROP TABLE IF EXISTS Connessione;

CRATE TABLE Connessione (
    -- scatolaId INTEGER REFERENCES Scatola(scatolaId),
    cavoOrigineId INTEGER REFERENCES Cavo(cavoId),
    cavoDestinazioneId INTEGER REFERENCES Cavo(cavoId),
    tipoMorsettoId REFERENCES TipoMorsetto(tipoMorsettoId),
    PRIMARY KEY(cavoOrigineId, cavoDestinazioneId)
);

-- INSERT Connessione

CREATE VIEW view_Prospetto_scatole AS
SELECT
    SC.scatolaId,
    P.parete parete,
    T.descrizione,
    tipoScatola,
    lunghezza,
    larghezza,
    SP.parete spigolo,
    distanzaSpigolo,
    altezzaTerra
FROM Scatola SC
        INNER JOIN Parete P USING (pareteId)
		INNER JOIN Parete SP ON (SC.spigolo = SP.pareteId)
		INNER JOIN TipoScatola T USING(tipoScatolaId);

CREATE VIEW view_Prospetto_canalizzazioni AS
SELECT 
    canalizzazioneId,
    diametro,
    lunghezza,
    C.descrizione,
    cavi,
    O.descrizione origine,
    D.descrizione destinazione
FROM
    Canalizzazione C
        INNER JOIN Scatola O ON (C.scatolaOrigineId = O.scatolaId)
        INNER JOIN Scatola D ON (C.scatolaDestinazioneId = D.scatolaId)

CREATE VIEW view_Prospetto_frutti AS
SELECT
    F.fruttoId,  F.posizione, T.frutto, S.scatolaId, S.descrizione
FROM
    FRUTTO F
        INNER JOIN TipoFrutto T USING (tipoFruttoId)
        INNER JOIN Scatola S USING (scatolaId)
