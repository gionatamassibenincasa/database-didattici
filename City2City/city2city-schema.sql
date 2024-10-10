CREATE TABLE IF NOT EXISTS Collegamento (
  idCollegamento INTEGER PRIMARY KEY, 
  destinazione TEXT NOT NULL, 
  andata TEXT NOT NULL CHECK (
    andata IN ('S', 'N')
  ), 
  giorno TEXT CHECK (
    giorno IN (
      'LUN', 'MAR', 'MER', 'GIO', 'VEN', 'SAB', 
      'DOM'
    )
  ), 
  oraPartenza INTEGER CHECK(
    oraPartenza BETWEEN 0 
    AND 24 * 60 * 60
  ), 
  oraArrivo INTEGER CHECK(
    oraArrivo BETWEEN 0 
    AND 24 * 60 * 60
  )
);
CREATE TABLE IF NOT EXISTS Autobus (
  targa TEXT PRIMARY KEY CHECK (
    length(targa) = 7 
    AND substr(targa, 1, 2) BETWEEN 'AA' 
    AND 'ZZ' 
    AND substr(targa, 6, 2) BETWEEN 'AA' 
    AND 'ZZ' 
    AND substr(targa, 3, 3) BETWEEN '000' 
    AND '999'
  ), 
  livello TEXT CHECK (
    livello IN (
      'STANDARD', 'PREMIUM', 'BUSINESS', 
      'EXECUTIVE'
    )
  ), 
  posti INTEGER CHECK (
    posti BETWEEN 7 
    AND 64
  ), 
  WiFi TEXT CHECK (
    WiFi IN ('S', 'N')
  ), 
  motorizzazione TEXT CHECK (
    motorizzazione IN (
      'Diesel', 'GPL', 'ibrido', 'elettrico'
    )
  )
);
CREATE TABLE IF NOT EXISTS Personale (
  idPersonale INTEGER PRIMARY KEY, cognome TEXT NOT NULL, 
  nome TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Cliente (
  numeroTessera INTEGER PRIMARY KEY, 
  username TEXT NOT NULL UNIQUE, cognome TEXT NOT NULL, 
  nome TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Manutenzione (
  targa TEXT REFERENCES Autobus(targa), 
  data TEXT CHECK (
    data IS date(data, '+0 days')
  ), 
  ditta TEXT NOT NULL, 
  descrizione TEXT NOT NULL, 
  fattura TEXT DEFAULT NULL, 
  PRIMARY KEY (targa, data)
);
CREATE TABLE IF NOT EXISTS Viaggio (
  idViaggio INTEGER PRIMARY KEY, 
  idCollegamento INTEGER NOT NULL REFERENCES Collegamento(idCollegamento), 
  data TEXT CHECK (
    data IS date(data, '+0 days')
  ), 
  oraPartenza INTEGER CHECK(
    oraPartenza BETWEEN 0 
    AND 24 * 60 * 60
  ), 
  oraArrivo INTEGER CHECK(
    oraArrivo BETWEEN 0 
    AND 24 * 60 * 60
  ), 
  numeroPasseggeri INTEGER
);
CREATE TABLE IF NOT EXISTS Ruolo (
  idViaggio INTEGER REFERENCES Viaggio(idViaggio), 
  idPersonale INTEGER REFERENCES Personale(idPersonale), 
  mansione TEXT CHECK (
    mansione IN (
      'primo autista', 'secondo autista', 'assistente'
    )
  ), 
  PRIMARY KEY (idViaggio, idPersonale)
);
CREATE TABLE IF NOT EXISTS ViaggioCliente (
  idViaggio INTEGER REFERENCES Viaggio(idViaggio), 
  numeroTessera INTEGER REFERENCES Cliente(numeroTessera), 
  PRIMARY KEY (idViaggio, numeroTessera)
);
