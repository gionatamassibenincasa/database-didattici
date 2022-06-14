CREATE TABLE Publication (
  ID INTEGER PRIMARY KEY,
  type CHAR(18) NOT NULL
);

CREATE TABLE Person (
  ID INTEGER PRIMARY KEY,
  surname CHAR(32) NOT NULL,
  given_names CHAR(32) NOT NULL
);

CREATE TABLE Author (
  publicationID INTEGER REFERENCES Publication(ID),
  personID INTEGER REFERENCES Person(ID),
  PRIMARY KEY (publicationID, personID)
);

CREATE TABLE Editor (
  publicationID INTEGER REFERENCES Publication(ID),
  personID INTEGER REFERENCES Person(ID),
  PRIMARY KEY (publicationID, personID)
);

CREATE TABLE Institution (
  ID INTEGER PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  street VARCHAR(32),
  city VARCHAR(32),
  province VARCHAR(32),
  postal_code CHAR(10),
  country VARCHAR(32)
);

CREATE TABLE Publisher (
  ID INTEGER PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  street VARCHAR(32),
  city VARCHAR(32),
  province VARCHAR(32),
  postal_code CHAR(10),
  country VARCHAR(32)
);

CREATE TABLE Book (
  ID INTEGER PRIMARY KEY REFERENCES Publication(ID),
  title VARCHAR(160) NOT NULL,
  publisher INTEGER NOT NULL REFERENCES Publisher(ID),
  volume VARCHAR(16),
  series VARCHAR(160),
  edition VARCHAR(16),
  pub_month CHAR(3),
  pub_year INTEGER NOT NULL,
  note VARCHAR(255)
);

CREATE TABLE InBook (
  ID INTEGER PRIMARY KEY REFERENCES Publication(ID),
  bookID INTEGER NOT NULL REFERENCES Book(ID),
  title VARCHAR(160),
  chapter SMALLINT,
  pages VARCHAR(32),
  type VARCHAR(64),
  note VARCHAR(255)
);

CREATE TABLE Proceedings (
  ID INTEGER PRIMARY KEY REFERENCES Publication(ID),
  title VARCHAR(160) NOT NULL,
  publisher INTEGER REFERENCES Publisher(ID),
  volume VARCHAR(16),
  series VARCHAR(160),
  organization INTEGER REFERENCES Institution(ID),
  pub_month CHAR(3),
  pub_year INTEGER NOT NULL,
  note VARCHAR(255)
);

CREATE TABLE InProceedings (
  ID INTEGER PRIMARY KEY REFERENCES Publication(ID),
  proceedingsID INTEGER NOT NULL REFERENCES Proceedings(ID),
  title VARCHAR(160) NOT NULL,
  pages VARCHAR(32),
  type VARCHAR(64),
  note VARCHAR(255)
);

CREATE TABLE Article (
  ID INTEGER PRIMARY KEY REFERENCES Publication(ID),
  title VARCHAR(160) NOT NULL,
  journal VARCHAR(160) NOT NULL,
  volume VARCHAR(16),
  number SMALLINT,
  pages VARCHAR(32),
  pub_month CHAR(3),
  pub_year INTEGER NOT NULL,
  note VARCHAR(255)
);

CREATE TABLE Techreport (
  ID INTEGER PRIMARY KEY REFERENCES Publication(ID),
  title VARCHAR(160) NOT NULL,
  institution INTEGER NOT NULL REFERENCES Institution(ID),
  type VARCHAR(64),
  number VARCHAR(16),
  pub_month CHAR(3),
  pub_year INTEGER NOT NULL,
  note VARCHAR(255)
);

CREATE TABLE Manual (
  ID INTEGER PRIMARY KEY REFERENCES Publication(ID),
  title VARCHAR(160) NOT NULL,
  organization INTEGER REFERENCES Institution(ID),
  edition VARCHAR(16),
  pub_month CHAR(3),
  pub_year INTEGER,
  note VARCHAR(255)
);

CREATE TABLE Thesis (
  ID INTEGER PRIMARY KEY REFERENCES Publication(ID),
  title VARCHAR(160) NOT NULL,
  school INTEGER NOT NULL REFERENCES Institution(ID),
  type VARCHAR(64),
  pub_month CHAR(3),
  pub_year INTEGER NOT NULL,
  note VARCHAR(255)
);

CREATE TABLE Misc (
  ID INTEGER PRIMARY KEY REFERENCES Publication(ID),
  title VARCHAR(160) NOT NULL,
  address VARCHAR(160),
  howpublished VARCHAR(160),
  pub_month CHAR(3),
  pub_year INTEGER NOT NULL,
  note VARCHAR(255)
);
