-- ***************************************************
-- * $Id: popolate_biblio.sql,v 1.2 2000/02/20 13:27:31 lucio Exp $
-- * $Author: lucio $
-- *
-- * Insert some data into the bibliographic database.
-- ***************************************************

-- ***************************************************
-- * List of bibliographic information
-- ***************************************************
-- M. Agosti, L. Benfante, M. Melucci. OFAHIR: "On-the-Fly" Automatic Authoring of Hypertexts for Information Retrieval. In S. Spaccapietra, F. Maryansky (Eds), Searching for Semantics: Data Mining, Reverse Engineering. Proc. of the 7th IFIP 2.6 Working Conference on Database Semantics (DS-7), Leysin, Switzerland, October 1997, 129-154.
-- Batini, C., de Petra, G., Lanzerini, M., and Santucci, G. (1993). La progettazione concettuale dei dati. Scienza e tecnologie informatiche. Franco Angeli. Milano.
-- Carey, M. J., DeWitt, D. J., Richardson, J. E., and Shekita, E. J. (1989). Storage management for objects in Exodus. In Kim, W. and Cochowsky, F. A., editors, Object Oriented Concepts, Databases,and Applications, chapter 14, pages 341-369. ACM press.
-- Bayer, R. and McCreight, E. (1972). Organization and maintenance of large ordered indexes. Acta Informatica, 1(3):173-189.
-- Kim, W. (1990). Introduction to Object-Oriented Databases. The MIT Press. Cambridge.
-- Knuth, D. E. (1968). The Art of Computer Programming, volume 1. Addison-Wesley.
-- Knuth, D. E. (1973). The Art of Computer Programming, volume 3. Addison-Wesley.
-- The E Reference Manual. Computer Sciences Department - University of Wisconsin, Madison, WI 53706. 1993. ftp://ftp.cs.wisc.edu/exodus/E_lang_doc/gnu_E_ref.ps.Z
-- Melucci, M. (1996). Costruzione automatica di ipertesti. PhD thesis. Universita' degli Studi di Padova.
-- Salton, G., and McGill, M. J. (1983). Introduction to modern information retrieval. McGraw-Hill, New-York.
-- ***************************************************

-- INSERT INTO Person

INSERT INTO Person VALUES ( 1, 'Agosti', 'Maristella' );
INSERT INTO Person VALUES ( 2, 'Benfante', 'Lucio' );
INSERT INTO Person VALUES ( 3, 'Melucci', 'Massimo' );
INSERT INTO Person VALUES ( 4, 'Spaccapietra', 'S.' );
INSERT INTO Person VALUES ( 5, 'Maryansky', 'F.' );
INSERT INTO Person VALUES ( 6, 'Batini', 'Carlo' );
INSERT INTO Person VALUES ( 7, 'de Petra', 'Giulio' );
INSERT INTO Person VALUES ( 8, 'Lenzerini', 'Maurizio' );
INSERT INTO Person VALUES ( 9, 'Santucci', 'Gaetano' );
INSERT INTO Person VALUES ( 10, 'Carey', 'Michael J.' );
INSERT INTO Person VALUES ( 11, 'DeWitt', 'David J.' );
INSERT INTO Person VALUES ( 12, 'Richardson', 'Joel E.' );
INSERT INTO Person VALUES ( 13, 'Shekita', 'Eugene J.' );
INSERT INTO Person VALUES ( 14, 'Kim', 'Won' );
INSERT INTO Person VALUES ( 15, 'Cochowsky', 'Frederick A.' );
INSERT INTO Person VALUES ( 16, 'Bayer', 'R.' );
INSERT INTO Person VALUES ( 17, 'McCreight', 'E.' );
INSERT INTO Person VALUES ( 18, 'Knuth', 'Donald E.' );
INSERT INTO Person VALUES ( 19, 'Salton', 'Gerard' );
INSERT INTO Person VALUES ( 20, 'McGill', 'Michael J.' );

-- INSERT INTO Publisher

INSERT INTO Publisher ( ID, name, city )
  VALUES ( 1, 'Franco Angeli', 'Milano' );
INSERT INTO Publisher ( ID, name )
  VALUES ( 2, 'ACM Press' );
INSERT INTO Publisher ( ID, name, city )
  VALUES ( 3, 'The MIT Press', 'Cambridge' );
INSERT INTO Publisher ( ID, name )
  VALUES ( 4, 'Addison-Wesley' );
INSERT INTO Publisher ( ID, name, city )
  VALUES ( 5, 'McGraw-Hill', 'New York' );

-- INSERT INTO Institution

INSERT INTO Institution ( ID, name, city, country )
  VALUES ( 1, '7th IFIP 2.6 Working Conference on Database Semantics (DS-7)',
           'Leysin', 'Switzerland' );
INSERT INTO Institution ( ID, name, city, province, postal_code )
  VALUES ( 2, 'Computer Sciences Department - University of Wisconsin',
           'Madison', 'WI', '53706' );
INSERT INTO Institution (ID, name )
  VALUES ( 3, 'Universita'' degli studi di Padova' );

-- INSERT INTO Publication

INSERT INTO Publication VALUES ( 1, 'Proceedings' );
INSERT INTO Publication VALUES ( 2, 'InProceedings' );
INSERT INTO Publication VALUES ( 3, 'Book' );
INSERT INTO Publication VALUES ( 4, 'Book' );
INSERT INTO Publication VALUES ( 5, 'InBook' );
INSERT INTO Publication VALUES ( 6, 'Article' );
INSERT INTO Publication VALUES ( 7, 'Book' );
INSERT INTO Publication VALUES ( 8, 'Book' );
INSERT INTO Publication VALUES ( 9, 'Book' );
INSERT INTO Publication VALUES ( 10, 'Manual' );
INSERT INTO Publication VALUES ( 11, 'Thesis' );
INSERT INTO Publication VALUES ( 12, 'Book' );

-- INSERT INTO Book

INSERT INTO Book ( ID, title, publisher, series, pub_year )
  VALUES ( 3, 'La progettazione concettuale dei dati', 1,
           'Scienze e tecnologie informatiche', 1993 );
INSERT INTO Book ( ID, title, publisher, pub_year )
  VALUES ( 4, 'Object Oriented Concepts, Databases, and Applications', 2, 1989 );
INSERT INTO Book ( ID, title, publisher, pub_year )
  VALUES ( 7, 'Introduction to Object-Oriented Databases', 3, 1990 );
INSERT INTO Book ( ID, title, publisher, volume, pub_year )
  VALUES ( 8, 'The Art of Computer Programming', 4, '1', 1968 );
INSERT INTO Book ( ID, title, publisher, volume, pub_year )
  VALUES ( 9, 'The Art of Computer Programming', 4, '3', 1973 );
INSERT INTO Book ( ID, title, publisher, pub_year )
  VALUES ( 12, 'Introduction to modern information retrieval', 5, 1983 );

-- INSERT INTO InBook

INSERT INTO InBook ( ID, bookID, title, chapter, pages )
  VALUES ( 5, 4, 'Storage Management for Objects in EXODUS', 14, '341-369' );

-- INSERT INTO Article

INSERT INTO Article ( ID, title, journal, volume, number, pages, pub_year )
  VALUES ( 6, 'Organization and maintenance of large ordered indexes',
           'Acta Informatica', '1', 3, '173-189', 1972 );

-- INSERT INTO Proceedings

INSERT INTO Proceedings ( ID, title, organization, pub_month, pub_year )
  VALUES ( 1, 'Searching for Semantics: Data Mining, Reverse Engineering',
           1, 'Oct', 1997 );

-- INSERT INTO InProceedings

INSERT INTO InProceedings ( ID, proceedingsID, title, pages )
  VALUES ( 2, 1, 'OFAHIR: "On-the-Fly" Automatic Authoring of Hypertexts for Information Retrieval', '129-154' );

-- INSERT INTO Manual

INSERT INTO Manual ( ID, title, organization, pub_year, note )
  VALUES ( 10, 'The E Reference Manual', 2, 1993,
           'ftp://ft.cs.wisc.edu/exodus/E_lang_doc/gnu_E_ref.ps.Z' );

-- INSERT INTO Thesis

INSERT INTO Thesis ( ID, title, school, type, pub_year )
  VALUES ( 11, 'Costruzione automatica di ipertesti', 3, 'PhD', 1996 );

-- INSERT INTO Author

INSERT INTO Author VALUES ( 2, 1 );
INSERT INTO Author VALUES ( 2, 2 );
INSERT INTO Author VALUES ( 2, 3 );
INSERT INTO Author VALUES ( 3, 6 );
INSERT INTO Author VALUES ( 3, 7 );
INSERT INTO Author VALUES ( 3, 8 );
INSERT INTO Author VALUES ( 3, 9 );
INSERT INTO Author VALUES ( 5, 10 );
INSERT INTO Author VALUES ( 5, 11 );
INSERT INTO Author VALUES ( 5, 12 );
INSERT INTO Author VALUES ( 5, 13 );
INSERT INTO Author VALUES ( 6, 16 );
INSERT INTO Author VALUES ( 6, 17 );
INSERT INTO Author VALUES ( 7, 14 );
INSERT INTO Author VALUES ( 8, 18 );
INSERT INTO Author VALUES ( 9, 18 );
INSERT INTO Author VALUES ( 11, 3 );
INSERT INTO Author VALUES ( 12, 19 );
INSERT INTO Author VALUES ( 12, 20 );

-- INSERT INTO Editor

INSERT INTO Editor VALUES ( 1, 4 );
INSERT INTO Editor VALUES ( 1, 5 );
INSERT INTO Editor VALUES ( 4, 14 );
INSERT INTO Editor VALUES ( 4, 15 );
