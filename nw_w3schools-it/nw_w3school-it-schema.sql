PRAGMA encoding = 'UTF-8';
BEGIN;
CREATE TABLE Categoria(
    id_categoria INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    descrizione TEXT
);

CREATE TABLE Cliente (
    id_cliente INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    azienda TEXT,
    referente TEXT,
    indirizzo TEXT,
    citta TEXT,
    cap TEXT,
    nazione TEXT
);

CREATE TABLE Venditore (
    id_venditore INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    cognome TEXT,
    nome TEXT,
    data TEXT,
    foto TEXT,
    note TEXT
);

CREATE TABLE Spedizioniere(
    id_spedizioniere INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    telefono TEXT
);

CREATE TABLE Ordine (
    id_ordine INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL REFERENCES Cliente(id_cliente),
    id_venditore INTEGER NOT NULL REFERENCES Venditore(id_venditore),
    data_ordine TEXT,
    id_spedizioniere INTEGER NOT NULL REFERENCES Spedizioniere(id_spedizioniere)
);

CREATE TABLE Composizione (
    id_ordine INTEGER NOT NULL REFERENCES Ordine(id_ordine),
    id_prodotto INTEGER NOT NULL REFERENCES Prodotto(id_prodotto),
    quantita INTEGER);


CREATE TABLE Fornitore(
    id_fornitore INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    azienda TEXT,
    referente TEXT,
    indirizzo TEXT,
    citta TEXT,
    cap TEXT,
    nazione TEXT,
    telefono TEXT
);

CREATE TABLE Prodotto (
    id_prodotto INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    id_fornitore INTEGER NOT NULL REFERENCES Fornitore(id_fornitore),
    id_categoria INTEGER NOT NULL REFERENCES Categoria(id_categoria),
    formato TEXT,
    prezzo REAL
);
COMMIT;

PRAGMA foreign_keys = ON;