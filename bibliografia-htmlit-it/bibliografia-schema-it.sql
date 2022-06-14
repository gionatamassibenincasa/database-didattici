CREATE TABLE Pubblicazione (
  ID INTEGER PRIMARY KEY,
  tipo CHAR(18) NOT NULL
);

CREATE TABLE Persona (
  ID INTEGER PRIMARY KEY,
  cognome CHAR(32) NOT NULL,
  nome CHAR(32) NOT NULL
);

CREATE TABLE Autore (
  id_pubblicazione INTEGER REFERENCES Pubblicazione(ID),
  id_persona INTEGER REFERENCES Persona(ID),
  PRIMARY KEY (id_pubblicazione, id_persona)
);

CREATE TABLE Curatore (
  id_pubblicazione INTEGER REFERENCES Pubblicazione(ID),
  id_persona INTEGER REFERENCES Persona(ID),
  PRIMARY KEY (id_pubblicazione, id_persona)
);

CREATE TABLE Istituzione (
  ID INTEGER PRIMARY KEY,
  nome VARCHAR(64) NOT NULL,
  via VARCHAR(32),
  citta VARCHAR(32),
  provincia VARCHAR(32),
  codice_postale CHAR(10),
  nazione VARCHAR(32)
);

CREATE TABLE Editore (
  ID INTEGER PRIMARY KEY,
  nome VARCHAR(64) NOT NULL,
  via VARCHAR(32),
  citta VARCHAR(32),
  provincia VARCHAR(32),
  codice_postale CHAR(10),
  nazione VARCHAR(32)
);

CREATE TABLE Libro (
  ID INTEGER PRIMARY KEY REFERENCES Pubblicazione(ID),
  titolo VARCHAR(160) NOT NULL,
  id_editore INTEGER NOT NULL REFERENCES Editore(ID),
  volume VARCHAR(16),
  collana VARCHAR(160),
  edizione VARCHAR(16),
  mese_pubblicazione CHAR(3),
  anno_pubblicazione INTEGER NOT NULL,
  note VARCHAR(255)
);

CREATE TABLE ParteDiLibro (
  ID INTEGER PRIMARY KEY REFERENCES Pubblicazione(ID),
  id_libro INTEGER NOT NULL REFERENCES Libro(ID),
  titolo VARCHAR(160),
  capitolo SMALLINT,
  pagine VARCHAR(32),
  tipo VARCHAR(64),
  note VARCHAR(255)
);

CREATE TABLE AttiDiConvegno (
  ID INTEGER PRIMARY KEY REFERENCES Pubblicazione(ID),
  titolo VARCHAR(160) NOT NULL,
  id_editore INTEGER REFERENCES Editore(ID),
  volume VARCHAR(16),
  collana VARCHAR(160),
  id_organizzazione INTEGER REFERENCES Istituzione(ID),
  mese_pubblicazione CHAR(3),
  anno_pubblicazione INTEGER NOT NULL,
  note VARCHAR(255)
);

CREATE TABLE ArticoliInAttiDiConvegno (
  ID INTEGER PRIMARY KEY REFERENCES Pubblicazione(ID),
  id_atti INTEGER NOT NULL REFERENCES AttiDiConvegno(ID),
  titolo VARCHAR(160) NOT NULL,
  pagine VARCHAR(32),
  tipo VARCHAR(64),
  note VARCHAR(255)
);

CREATE TABLE Articolo (
  ID INTEGER PRIMARY KEY REFERENCES Pubblicazione(ID),
  titolo VARCHAR(160) NOT NULL,
  rivista VARCHAR(160) NOT NULL,
  volume VARCHAR(16),
  numero SMALLINT,
  pagine VARCHAR(32),
  mese_pubblicazione CHAR(3),
  anno_pubblicazione INTEGER NOT NULL,
  note VARCHAR(255)
);

CREATE TABLE Relazione (
  ID INTEGER PRIMARY KEY REFERENCES Pubblicazione(ID),
  titolo VARCHAR(160) NOT NULL,
  id_istituzione INTEGER NOT NULL REFERENCES Istituzione(ID),
  tipo VARCHAR(64),
  numero VARCHAR(16),
  mese_pubblicazione CHAR(3),
  anno_pubblicazione INTEGER NOT NULL,
  note VARCHAR(255)
);

CREATE TABLE DocumentazioneTecnica (
  ID INTEGER PRIMARY KEY REFERENCES Pubblicazione(ID),
  titolo VARCHAR(160) NOT NULL,
  id_organizzazione INTEGER REFERENCES Istituzione(ID),
  edizione VARCHAR(16),
  mese_pubblicazione CHAR(3),
  anno_pubblicazione INTEGER,
  note VARCHAR(255)
);

CREATE TABLE Tesi (
  ID INTEGER PRIMARY KEY REFERENCES Pubblicazione(ID),
  titolo VARCHAR(160) NOT NULL,
  id_istituzione INTEGER NOT NULL REFERENCES Istituzione(ID),
  tipo VARCHAR(64),
  mese_pubblicazione CHAR(3),
  anno_pubblicazione INTEGER NOT NULL,
  note VARCHAR(255)
);

CREATE TABLE Misc (
  ID INTEGER PRIMARY KEY REFERENCES Pubblicazione(ID),
  titolo VARCHAR(160) NOT NULL,
  indirizzo VARCHAR(160),
  genere VARCHAR(160),
  mese_pubblicazione CHAR(3),
  anno_pubblicazione INTEGER NOT NULL,
  note VARCHAR(255)
);
