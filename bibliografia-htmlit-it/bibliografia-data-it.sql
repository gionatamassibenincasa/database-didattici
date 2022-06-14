-- ***************************************************
-- * $Id: popolate_biblio.sql,v 1.2 2000/02/20 13:27:31 lucio Exp $
-- * $Autore: lucio $
-- *
-- * Insert some data into the bibliographic database.
-- ***************************************************

-- ***************************************************
-- * List of bibliographic information
-- ***************************************************
-- M. Agosti, L. Benfante, M. Melucci. OFAHIR: "On-the-Fly" Automatic Autoreing of Hypertexts for Information Retrieval. In S. Spaccapietra, F. Maryansky (Eds), Searching for Semantics: Data Mining, Reverse Engineering. Proc. of the 7th IFIP 2.6 Working Conference on Database Semantics (DS-7), Leysin, Switzerland, October 1997, 129-154.
-- Batini, C., de Petra, G., Lanzerini, M., and Santucci, G. (1993). La progettazione concettuale dei dati. Scienza e tecnologie informatiche. Franco Angeli. Milano.
-- Carey, M. J., DeWitt, D. J., Richardson, J. E., and Shekita, E. J. (1989). Storage management for objects in Exodus. In Kim, W. and Cochowsky, F. A., editors, Object Oriented Concepts, Databases,and Applications, capitolo 14, pagine 341-369. ACM press.
-- Bayer, R. and McCreight, E. (1972). Organization and maintenance of large ordered indexes. Acta Informatica, 1(3):173-189.
-- Kim, W. (1990). Introduction to Object-Oriented Databases. The MIT Press. Cambridge.
-- Knuth, D. E. (1968). The Art of Computer Programming, volume 1. Addison-Wesley.
-- Knuth, D. E. (1973). The Art of Computer Programming, volume 3. Addison-Wesley.
-- The E Reference Manual. Computer Sciences Department - University of Wisconsin, Madison, WI 53706. 1993. ftp://ftp.cs.wisc.edu/exodus/E_lang_doc/gnu_E_ref.ps.Z
-- Melucci, M. (1996). Costruzione automatica di ipertesti. PhD thesis. Universita' degli Studi di Padova.
-- Salton, G., and McGill, M. J. (1983). Introduction to modern information retrieval. McGraw-Hill, New-York.
-- ***************************************************

-- INSERT INTO Persona

INSERT INTO Persona VALUES ( 1, 'Agosti', 'Maristella' );
INSERT INTO Persona VALUES ( 2, 'Benfante', 'Lucio' );
INSERT INTO Persona VALUES ( 3, 'Melucci', 'Massimo' );
INSERT INTO Persona VALUES ( 4, 'Spaccapietra', 'S.' );
INSERT INTO Persona VALUES ( 5, 'Maryansky', 'F.' );
INSERT INTO Persona VALUES ( 6, 'Batini', 'Carlo' );
INSERT INTO Persona VALUES ( 7, 'de Petra', 'Giulio' );
INSERT INTO Persona VALUES ( 8, 'Lenzerini', 'Maurizio' );
INSERT INTO Persona VALUES ( 9, 'Santucci', 'Gaetano' );
INSERT INTO Persona VALUES ( 10, 'Carey', 'Michael J.' );
INSERT INTO Persona VALUES ( 11, 'DeWitt', 'David J.' );
INSERT INTO Persona VALUES ( 12, 'Richardson', 'Joel E.' );
INSERT INTO Persona VALUES ( 13, 'Shekita', 'Eugene J.' );
INSERT INTO Persona VALUES ( 14, 'Kim', 'Won' );
INSERT INTO Persona VALUES ( 15, 'Cochowsky', 'Frederick A.' );
INSERT INTO Persona VALUES ( 16, 'Bayer', 'R.' );
INSERT INTO Persona VALUES ( 17, 'McCreight', 'E.' );
INSERT INTO Persona VALUES ( 18, 'Knuth', 'Donald E.' );
INSERT INTO Persona VALUES ( 19, 'Salton', 'Gerard' );
INSERT INTO Persona VALUES ( 20, 'McGill', 'Michael J.' );

-- INSERT INTO Editore

INSERT INTO Editore ( ID, nome, citta )
  VALUES ( 1, 'Franco Angeli', 'Milano' );
INSERT INTO Editore ( ID, nome )
  VALUES ( 2, 'ACM Press' );
INSERT INTO Editore ( ID, nome, citta )
  VALUES ( 3, 'The MIT Press', 'Cambridge' );
INSERT INTO Editore ( ID, nome )
  VALUES ( 4, 'Addison-Wesley' );
INSERT INTO Editore ( ID, nome, citta )
  VALUES ( 5, 'McGraw-Hill', 'New York' );

-- INSERT INTO Istituzione

INSERT INTO Istituzione ( ID, nome, citta, nazione )
  VALUES ( 1, '7th IFIP 2.6 Working Conference on Database Semantics (DS-7)',
           'Leysin', 'Switzerland' );
INSERT INTO Istituzione ( ID, nome, citta, provincia, codice_postale )
  VALUES ( 2, 'Computer Sciences Department - University of Wisconsin',
           'Madison', 'WI', '53706' );
INSERT INTO Istituzione (ID, nome )
  VALUES ( 3, 'Universita'' degli studi di Padova' );

-- INSERT INTO Pubblicazione

INSERT INTO Pubblicazione VALUES ( 1, 'AttiDiConvegno' );
INSERT INTO Pubblicazione VALUES ( 2, 'ArticoliInAttiDiConvegno' );
INSERT INTO Pubblicazione VALUES ( 3, 'Libro' );
INSERT INTO Pubblicazione VALUES ( 4, 'Libro' );
INSERT INTO Pubblicazione VALUES ( 5, 'ParteDiLibro' );
INSERT INTO Pubblicazione VALUES ( 6, 'Articolo' );
INSERT INTO Pubblicazione VALUES ( 7, 'Libro' );
INSERT INTO Pubblicazione VALUES ( 8, 'Libro' );
INSERT INTO Pubblicazione VALUES ( 9, 'Libro' );
INSERT INTO Pubblicazione VALUES ( 10, 'DocumentazioneTecnica' );
INSERT INTO Pubblicazione VALUES ( 11, 'Tesi' );
INSERT INTO Pubblicazione VALUES ( 12, 'Libro' );

-- INSERT INTO Libro

INSERT INTO Libro ( ID, titolo, id_editore, collana, anno_pubblicazione )
  VALUES ( 3, 'La progettazione concettuale dei dati', 1,
           'Scienze e tecnologie informatiche', 1993 );
INSERT INTO Libro ( ID, titolo, id_editore, anno_pubblicazione )
  VALUES ( 4, 'Object Oriented Concepts, Databases, and Applications', 2, 1989 );
INSERT INTO Libro ( ID, titolo, id_editore, anno_pubblicazione )
  VALUES ( 7, 'Introduction to Object-Oriented Databases', 3, 1990 );
INSERT INTO Libro ( ID, titolo, id_editore, volume, anno_pubblicazione )
  VALUES ( 8, 'The Art of Computer Programming', 4, '1', 1968 );
INSERT INTO Libro ( ID, titolo, id_editore, volume, anno_pubblicazione )
  VALUES ( 9, 'The Art of Computer Programming', 4, '3', 1973 );
INSERT INTO Libro ( ID, titolo, id_editore, anno_pubblicazione )
  VALUES ( 12, 'Introduction to modern information retrieval', 5, 1983 );

-- INSERT INTO ParteDiLibro

INSERT INTO ParteDiLibro ( ID, id_libro, titolo, capitolo, pagine )
  VALUES ( 5, 4, 'Storage Management for Objects in EXODUS', 14, '341-369' );

-- INSERT INTO Articolo

INSERT INTO Articolo ( ID, titolo, rivista, volume, numero, pagine, anno_pubblicazione )
  VALUES ( 6, 'Organization and maintenance of large ordered indexes',
           'Acta Informatica', '1', 3, '173-189', 1972 );

-- INSERT INTO AttiDiConvegno

INSERT INTO AttiDiConvegno ( ID, titolo, id_organizzazione, mese_pubblicazione, anno_pubblicazione )
  VALUES ( 1, 'Searching for Semantics: Data Mining, Reverse Engineering',
           1, 'Oct', 1997 );

-- INSERT INTO ArticoliInAttiDiConvegno

INSERT INTO ArticoliInAttiDiConvegno ( ID, id_atti, titolo, pagine )
  VALUES ( 2, 1, 'OFAHIR: "On-the-Fly" Automatic Autoreing of Hypertexts for Information Retrieval', '129-154' );

-- INSERT INTO DocumentazioneTecnica

INSERT INTO DocumentazioneTecnica ( ID, titolo, id_organizzazione, anno_pubblicazione, note )
  VALUES ( 10, 'The E Reference Manual', 2, 1993,
           'ftp://ft.cs.wisc.edu/exodus/E_lang_doc/gnu_E_ref.ps.Z' );

-- INSERT INTO Tesi

INSERT INTO Tesi ( ID, titolo, id_istituzione, tipo, anno_pubblicazione )
  VALUES ( 11, 'Costruzione automatica di ipertesti', 3, 'PhD', 1996 );

-- INSERT INTO Autore

INSERT INTO Autore VALUES ( 2, 1 );
INSERT INTO Autore VALUES ( 2, 2 );
INSERT INTO Autore VALUES ( 2, 3 );
INSERT INTO Autore VALUES ( 3, 6 );
INSERT INTO Autore VALUES ( 3, 7 );
INSERT INTO Autore VALUES ( 3, 8 );
INSERT INTO Autore VALUES ( 3, 9 );
INSERT INTO Autore VALUES ( 5, 10 );
INSERT INTO Autore VALUES ( 5, 11 );
INSERT INTO Autore VALUES ( 5, 12 );
INSERT INTO Autore VALUES ( 5, 13 );
INSERT INTO Autore VALUES ( 6, 16 );
INSERT INTO Autore VALUES ( 6, 17 );
INSERT INTO Autore VALUES ( 7, 14 );
INSERT INTO Autore VALUES ( 8, 18 );
INSERT INTO Autore VALUES ( 9, 18 );
INSERT INTO Autore VALUES ( 11, 3 );
INSERT INTO Autore VALUES ( 12, 19 );
INSERT INTO Autore VALUES ( 12, 20 );

-- INSERT INTO Curatore

INSERT INTO Curatore VALUES ( 1, 4 );
INSERT INTO Curatore VALUES ( 1, 5 );
INSERT INTO Curatore VALUES ( 4, 14 );
INSERT INTO Curatore VALUES ( 4, 15 );
