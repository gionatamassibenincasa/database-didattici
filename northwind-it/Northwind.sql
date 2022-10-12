BEGIN TRANSACTION;
DROP TABLE IF EXISTS "Clienti";
CREATE TABLE IF NOT EXISTS "Clienti" (
	"ID"	INTEGER NOT NULL,
	"Società"	VARCHAR(50),
	"Cognome"	VARCHAR(50),
	"Nome"	VARCHAR(50),
	"Indirizzo_di_posta_elettronica"	VARCHAR(50),
	"Posizione"	VARCHAR(50),
	"Telefono__uff_"	VARCHAR(25),
	"Telefono_domicilio"	VARCHAR(25),
	"Tel_cellulare"	VARCHAR(25),
	"Fax"	VARCHAR(25),
	"Indirizzo"	TEXT,
	"Città"	VARCHAR(50),
	"Stato_Provincia"	VARCHAR(50),
	"CAP"	VARCHAR(15),
	"Paese"	VARCHAR(50),
	"Pagina_Web"	TEXT,
	"Note"	TEXT,
	"Allegati"	TEXT,
	CONSTRAINT "pk_Clienti" PRIMARY KEY("ID")
);
DROP TABLE IF EXISTS "Corrieri";
CREATE TABLE IF NOT EXISTS "Corrieri" (
	"ID"	INTEGER NOT NULL,
	"Società"	VARCHAR(50),
	"Cognome"	VARCHAR(50),
	"Nome"	VARCHAR(50),
	"Indirizzo_di_posta_elettronica"	VARCHAR(50),
	"Posizione"	VARCHAR(50),
	"Telefono__uff_"	VARCHAR(25),
	"Telefono_domicilio"	VARCHAR(25),
	"Tel_cellulare"	VARCHAR(25),
	"Fax"	VARCHAR(25),
	"Indirizzo"	TEXT,
	"Città"	VARCHAR(50),
	"Stato_Provincia"	VARCHAR(50),
	"CAP"	VARCHAR(15),
	"Paese"	VARCHAR(50),
	"Pagina_Web"	TEXT,
	"Note"	TEXT,
	"Allegati"	TEXT,
	CONSTRAINT "pk_Corrieri" PRIMARY KEY("ID")
);
DROP TABLE IF EXISTS "Dettagli_ordini_di_acquisto";
CREATE TABLE IF NOT EXISTS "Dettagli_ordini_di_acquisto" (
	"ID"	INTEGER NOT NULL,
	"ID_ordine_acquisto"	INTEGER NOT NULL,
	"ID_prodotto"	INTEGER,
	"Quantità"	NUMERIC(18, 4) NOT NULL,
	"Costo_unitario"	REAL NOT NULL,
	"Data_ricezione"	DATETIME,
	"Inserito_in_inventario"	BOOL NOT NULL DEFAULT FALSE,
	"ID_inventario"	INTEGER,
	CONSTRAINT "pk_Dettagli_ordini_di_acquisto" PRIMARY KEY("ID"),
	CONSTRAINT "New_InventoryTransactionsOnPurchaseOrders" FOREIGN KEY("ID_inventario") REFERENCES "Operazioni_di_magazzino"("ID_transazione") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_ProductOnPurchaseOrderDetails" FOREIGN KEY("ID_prodotto") REFERENCES "Prodotti"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_PurchaseOrderDeatilsOnPurchaseOrder" FOREIGN KEY("ID_ordine_acquisto") REFERENCES "Ordini_di_acquisto"("ID_ordine_acquisto") ON UPDATE NO ACTION ON DELETE CASCADE
);
DROP TABLE IF EXISTS "Dettagli_sugli_ordini";
CREATE TABLE IF NOT EXISTS "Dettagli_sugli_ordini" (
	"ID"	INTEGER NOT NULL,
	"ID_ordine"	INTEGER NOT NULL,
	"ID_prodotto"	INTEGER,
	"Quantità"	NUMERIC(18, 4) NOT NULL DEFAULT 0,
	"Prezzo_unitario"	REAL DEFAULT 0,
	"Sconto"	REAL NOT NULL DEFAULT 0,
	"ID_stato"	INTEGER,
	"Data_assegnazione"	DATETIME,
	"ID_ordine_acquisto"	INTEGER,
	"ID_inventario"	INTEGER,
	CONSTRAINT "pk_Dettagli_sugli_ordini" PRIMARY KEY("ID"),
	CONSTRAINT "New_OrderDetails" FOREIGN KEY("ID_ordine") REFERENCES "Ordini"("ID_ordine") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "New_OrderStatusLookup" FOREIGN KEY("ID_stato") REFERENCES "Stato_dettagli_ordini"("ID_stato") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_ProductsOnOrders" FOREIGN KEY("ID_prodotto") REFERENCES "Prodotti"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION
);
DROP TABLE IF EXISTS "Dipendenti";
CREATE TABLE IF NOT EXISTS "Dipendenti" (
	"ID"	INTEGER NOT NULL,
	"Società"	VARCHAR(50),
	"Cognome"	VARCHAR(50),
	"Nome"	VARCHAR(50),
	"Indirizzo_di_posta_elettronica"	VARCHAR(50),
	"Posizione"	VARCHAR(50),
	"Telefono__uff_"	VARCHAR(25),
	"Telefono_domicilio"	VARCHAR(25),
	"Tel_cellulare"	VARCHAR(25),
	"Fax"	VARCHAR(25),
	"Indirizzo"	TEXT,
	"Città"	VARCHAR(50),
	"Stato_Provincia"	VARCHAR(50),
	"CAP"	VARCHAR(15),
	"Paese"	VARCHAR(50),
	"Pagina_Web"	TEXT,
	"Note"	TEXT,
	"Allegati"	TEXT,
	CONSTRAINT "pk_Dipendenti" PRIMARY KEY("ID")
);
DROP TABLE IF EXISTS "Fatture";
CREATE TABLE IF NOT EXISTS "Fatture" (
	"ID_fattura"	INTEGER NOT NULL,
	"ID_ordine"	INTEGER,
	"Data_fattura"	DATETIME,
	"Scadenza"	DATETIME,
	"Imposta"	REAL DEFAULT 0,
	"Spedizione"	REAL DEFAULT 0,
	"Importo_dovuto"	REAL DEFAULT 0,
	CONSTRAINT "pk_Fatture" PRIMARY KEY("ID_fattura"),
	CONSTRAINT "New_OrderInvoice" FOREIGN KEY("ID_ordine") REFERENCES "Ordini"("ID_ordine") ON UPDATE NO ACTION ON DELETE CASCADE
);
DROP TABLE IF EXISTS "Fornitori";
CREATE TABLE IF NOT EXISTS "Fornitori" (
	"ID"	INTEGER NOT NULL,
	"Società"	VARCHAR(50),
	"Cognome"	VARCHAR(50),
	"Nome"	VARCHAR(50),
	"Indirizzo_di_posta_elettronica"	VARCHAR(50),
	"Posizione"	VARCHAR(50),
	"Telefono__uff_"	VARCHAR(25),
	"Telefono_domicilio"	VARCHAR(25),
	"Tel_cellulare"	VARCHAR(25),
	"Fax"	VARCHAR(25),
	"Indirizzo"	TEXT,
	"Città"	VARCHAR(50),
	"Stato_Provincia"	VARCHAR(50),
	"CAP"	VARCHAR(15),
	"Paese"	VARCHAR(50),
	"Pagina_Web"	TEXT,
	"Note"	TEXT,
	"Allegati"	TEXT,
	CONSTRAINT "pk_Fornitori" PRIMARY KEY("ID")
);
DROP TABLE IF EXISTS "Operazioni_di_magazzino";
CREATE TABLE IF NOT EXISTS "Operazioni_di_magazzino" (
	"ID_transazione"	INTEGER NOT NULL,
	"Tipo_transazione"	TINYINT NOT NULL,
	"Data_creazione_transazione"	DATETIME,
	"Data_modifica_transazione"	DATETIME,
	"ID_prodotto"	INTEGER NOT NULL,
	"Quantità"	INTEGER NOT NULL,
	"ID_ordine_acquisto"	INTEGER,
	"ID_ordine_cliente"	INTEGER,
	"Commenti"	VARCHAR(255),
	CONSTRAINT "pk_Operazioni_di_magazzino" PRIMARY KEY("ID_transazione"),
	CONSTRAINT "New_OrdersOnInventoryTransactions" FOREIGN KEY("ID_ordine_cliente") REFERENCES "Ordini"("ID_ordine") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_ProductOnInventoryTransaction" FOREIGN KEY("ID_prodotto") REFERENCES "Prodotti"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_PuchaseOrdersonInventoryTransactions" FOREIGN KEY("ID_ordine_acquisto") REFERENCES "Ordini_di_acquisto"("ID_ordine_acquisto") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_TransactionTypesOnInventoryTransactiosn" FOREIGN KEY("Tipo_transazione") REFERENCES "Tipi_di_operazioni_di_magazzino"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION
);
DROP TABLE IF EXISTS "Ordini";
CREATE TABLE IF NOT EXISTS "Ordini" (
	"ID_ordine"	INTEGER NOT NULL,
	"ID_dipendente"	INTEGER,
	"ID_cliente"	INTEGER,
	"Data_ordine"	DATETIME,
	"Data_spedizione"	DATETIME,
	"ID_corriere"	INTEGER,
	"Nome_spedizione"	VARCHAR(50),
	"Indirizzo_di_spedizione"	TEXT,
	"Città_destinatario"	VARCHAR(50),
	"Stato_Prov_dest"	VARCHAR(50),
	"CAP_spedizione"	VARCHAR(50),
	"Paese_spedizione"	VARCHAR(50),
	"Costi_di_spedizione"	REAL DEFAULT 0,
	"Imposte"	REAL DEFAULT 0,
	"Tipo_pagamento"	VARCHAR(50),
	"Data_pagamento"	DATETIME,
	"Note"	TEXT,
	"Aliquota_d_imposta"	REAL DEFAULT 0,
	"Stato_imposta"	TINYINT,
	"ID_stato"	TINYINT DEFAULT 0,
	CONSTRAINT "pk_Ordini" PRIMARY KEY("ID_ordine"),
	CONSTRAINT "New_CustomerOnOrders" FOREIGN KEY("ID_cliente") REFERENCES "Clienti"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_EmployeesOnOrders" FOREIGN KEY("ID_Dipendente") REFERENCES "Dipendenti"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_OrderStatus" FOREIGN KEY("ID_stato") REFERENCES "Stato_ordini"("ID_stato") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_ShipperOnOrder" FOREIGN KEY("ID_corriere") REFERENCES "Corrieri"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_TaxStatusOnOrders" FOREIGN KEY("Stato_imposta") REFERENCES "Stato_imposta_ordini"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION
);
DROP TABLE IF EXISTS "Ordini_di_acquisto";
CREATE TABLE IF NOT EXISTS "Ordini_di_acquisto" (
	"ID_ordine_acquisto"	INTEGER NOT NULL,
	"ID_fornitore"	INTEGER,
	"Creato_da"	INTEGER,
	"Data_invio"	DATETIME,
	"Data_creazione"	DATETIME,
	"ID_stato"	INTEGER DEFAULT 0,
	"Data_prevista"	DATETIME,
	"Costi_di_spedizione"	REAL NOT NULL DEFAULT 0,
	"Imposte"	REAL NOT NULL DEFAULT 0,
	"Data_pagamento"	DATETIME,
	"Importo_pagam"	REAL DEFAULT 0,
	"Modalità_pag"	VARCHAR(50),
	"Note"	TEXT,
	"Approvato_da"	INTEGER,
	"Data_approvazione"	DATETIME,
	"Inserito_da"	INTEGER,
	CONSTRAINT "pk_Ordini_di_acquisto" PRIMARY KEY("ID_ordine_acquisto"),
	CONSTRAINT "New_EmployeesOnPurchaseOrder" FOREIGN KEY("Creato_da") REFERENCES "Dipendenti"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_PurchaseOrderStatusLookup" FOREIGN KEY("ID_stato") REFERENCES "Stato_ordine_di_acquisto"("ID_stato") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_SuppliersOnPurchaseOrder" FOREIGN KEY("ID_fornitore") REFERENCES "Fornitori"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION
);
DROP TABLE IF EXISTS "Privilegi";
CREATE TABLE IF NOT EXISTS "Privilegi" (
	"ID_privilegio"	INTEGER NOT NULL,
	"Nome_privilegio"	VARCHAR(50),
	CONSTRAINT "pk_Privilegi" PRIMARY KEY("ID_privilegio")
);
DROP TABLE IF EXISTS "Privilegi_dipendente";
CREATE TABLE IF NOT EXISTS "Privilegi_dipendente" (
	"ID_dipendente"	INTEGER NOT NULL,
	"ID_privilegio"	INTEGER NOT NULL,
	CONSTRAINT "pk_Privilegi_dipendente" PRIMARY KEY("ID_dipendente","ID_privilegio"),
	CONSTRAINT "New_EmployeePriviligesforEmployees" FOREIGN KEY("ID_dipendente") REFERENCES "Dipendenti"("ID") ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "New_EmployeePriviligesLookup" FOREIGN KEY("ID_privilegio") REFERENCES "Privilegi"("ID_privilegio") ON UPDATE NO ACTION ON DELETE NO ACTION
);
DROP TABLE IF EXISTS "Prodotti";
CREATE TABLE IF NOT EXISTS "Prodotti" (
	"ID_fornitori"	TEXT,
	"ID"	INTEGER NOT NULL,
	"Codice_prodotto"	VARCHAR(25),
	"Nome_prodotto"	VARCHAR(50),
	"Descrizione"	TEXT,
	"Costo_standard"	REAL DEFAULT 0,
	"Prezzo_di_listino"	REAL NOT NULL DEFAULT 0,
	"Livello_di_riordino"	SMALLINT,
	"Livello_stabilito"	INTEGER,
	"Quantità_per_unità"	VARCHAR(50),
	"Sospeso"	BOOL NOT NULL DEFAULT FALSE,
	"Quantità_di_riordino_minima"	SMALLINT,
	"Categoria"	VARCHAR(50),
	"Allegati"	TEXT,
	CONSTRAINT "pk_Prodotti" PRIMARY KEY("ID")
);
DROP TABLE IF EXISTS "Stato_dettagli_ordini";
CREATE TABLE IF NOT EXISTS "Stato_dettagli_ordini" (
	"ID_stato"	INTEGER NOT NULL,
	"Nome_stato"	VARCHAR(50) NOT NULL,
	CONSTRAINT "pk_Stato_dettagli_ordini" PRIMARY KEY("ID_stato")
);
DROP TABLE IF EXISTS "Stato_imposta_ordini";
CREATE TABLE IF NOT EXISTS "Stato_imposta_ordini" (
	"ID"	TINYINT NOT NULL,
	"Nome_stato_imposta"	VARCHAR(50) NOT NULL,
	CONSTRAINT "pk_Stato_imposta_ordini" PRIMARY KEY("ID")
);
DROP TABLE IF EXISTS "Stato_ordine_di_acquisto";
CREATE TABLE IF NOT EXISTS "Stato_ordine_di_acquisto" (
	"ID_stato"	INTEGER NOT NULL,
	"Stato"	VARCHAR(50),
	CONSTRAINT "pk_Stato_ordine_di_acquisto" PRIMARY KEY("ID_stato")
);
DROP TABLE IF EXISTS "Stato_ordini";
CREATE TABLE IF NOT EXISTS "Stato_ordini" (
	"ID_stato"	TINYINT NOT NULL,
	"Nome_stato"	VARCHAR(50) NOT NULL,
	CONSTRAINT "pk_Stato_ordini" PRIMARY KEY("ID_stato")
);
DROP TABLE IF EXISTS "Stringhe";
CREATE TABLE IF NOT EXISTS "Stringhe" (
	"ID_stringa"	INTEGER NOT NULL,
	"Dati_stringa"	VARCHAR(255),
	CONSTRAINT "pk_Stringhe" PRIMARY KEY("ID_stringa")
);
DROP TABLE IF EXISTS "Tipi_di_operazioni_di_magazzino";
CREATE TABLE IF NOT EXISTS "Tipi_di_operazioni_di_magazzino" (
	"ID"	TINYINT NOT NULL,
	"Nome_tipo"	VARCHAR(50) NOT NULL,
	CONSTRAINT "pk_Tipi_di_operazioni_di_magazzino" PRIMARY KEY("ID")
);
INSERT INTO "Clienti" ("ID","Società","Cognome","Nome","Indirizzo_di_posta_elettronica","Posizione","Telefono__uff_","Telefono_domicilio","Tel_cellulare","Fax","Indirizzo","Città","Stato_Provincia","CAP","Paese","Pagina_Web","Note","Allegati") VALUES (1,'Società A','Barbariol','Angela',NULL,'Titolare','012 34 56 78',NULL,NULL,'012 45 67 89','Via I 123','Roma','RM','99999','Italia',NULL,NULL,''),
 (2,'Società B','Alboni','Ezio',NULL,'Titolare','012 34 56 78',NULL,NULL,'012 45 67 89','Via II 123','Napoli','NA','99999','Italia',NULL,NULL,''),
 (3,'Società C','Caro','Fernando',NULL,'Responsabile acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via III 123','Cagliari','CA','99999','Italia',NULL,NULL,''),
 (4,'Società D','Bonaldi','Raffaella',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via IV 123','Reggio Emilia','RE','99999','Italia',NULL,NULL,''),
 (5,'Società E','Cavaglieri','Giorgio',NULL,'Titolare','012 34 56 78',NULL,NULL,'012 45 67 89','Via V 123','Bari','BA','99999','Italia',NULL,NULL,''),
 (6,'Società F','Dellamore','Luca',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via VI 123','Firenze','FI','99999','Italia',NULL,NULL,''),
 (7,'Società G','Cazzaniga','Luisa',NULL,'Titolare','012 34 56 78',NULL,NULL,'012 45 67 89','Via VII 123','Trieste','TS','99999','Italia',NULL,NULL,''),
 (8,'Società H','Ciccu','Alice',NULL,'Responsabile acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via VIII 123','Torino','TO','99999','Italia',NULL,NULL,''),
 (9,'Società I','Garghentini','Davide',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via IX 123','Perugia','PG','99999','Italia',NULL,NULL,''),
 (10,'Società J','Iallo','Lucio',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via X 123','Messina','ME','99999','Italia',NULL,NULL,''),
 (11,'Società K','Leoni','Alessandro',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XI 123','Ancona','AN','99999','Italia',NULL,NULL,''),
 (12,'Società L','Argentiero','Luca',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XII 123','Bologna','BO','99999','Italia',NULL,NULL,''),
 (13,'Società M','Macagno','Maurizio',NULL,'Responsabile acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XIII 456','Caserta','CE','99999','Italia',NULL,NULL,''),
 (14,'Società N','Martino','Agostino',NULL,'Responsabile acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XIV 123','Asti','AT','99999','Italia',NULL,NULL,''),
 (15,'Società O','Giorgi','Adriana',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XV 456','Trento','TN','99999','Italia',NULL,NULL,''),
 (16,'Società P','Monaco','Massimiliano',NULL,'Responsabile acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XVI 456','Ravenna','RA','99999','Italia',NULL,NULL,''),
 (17,'Società Q','Neri','Indro',NULL,'Titolare','012 34 56 78',NULL,NULL,'012 45 67 89','Via XVII 456','Roma','RM','99999','Italia',NULL,NULL,''),
 (18,'Società R','Guaita','Daniela',NULL,'Responsabile acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XVIII 456','Napoli','NA','99999','Italia',NULL,NULL,''),
 (19,'Società S','Olivotto','Nino',NULL,'Funzionario amministrativo','012 34 56 78',NULL,NULL,'012 45 67 89','Via XIX 456','Cagliari','CA','99999','Italia',NULL,NULL,''),
 (20,'Società T','Pica','Guido',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XX 789','Reggio Emilia','RE','99999','Italia',NULL,NULL,''),
 (21,'Società U','Ruspini','Davide',NULL,'Direttore amministrativo','012 34 56 78',NULL,NULL,'012 45 67 89','Via XXI 789','Bari','BA','99999','Italia',NULL,NULL,''),
 (22,'Società V','Nicolella','Elena',NULL,'Assistente agli acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XXII 789','Firenze','FI','99999','Italia',NULL,NULL,''),
 (23,'Società W','Russo','Giuseppe',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XXIII 789','Torino','TO','99999','Italia',NULL,NULL,''),
 (24,'Società X','Tamburello','Roberto',NULL,'Titolare','012 34 56 78',NULL,NULL,'012 45 67 89','Via XXIV 789','Perugia','PG','99999','Italia',NULL,NULL,''),
 (25,'Società Y','Tanara','Marco',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XXV 789','Messina','ME','99999','Italia',NULL,NULL,''),
 (26,'Società Z','Scotti','Elisabetta',NULL,'Funzionario amministrativo','012 34 56 78',NULL,NULL,'012 45 67 89','Via XXVI 789','Ancona','AN','99999','Italia',NULL,NULL,''),
 (27,'Società AA','Valverde','Eva',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XXVII 789','Bologna','BO','99999','Italia',NULL,NULL,''),
 (28,'Società BB','Rossi','Giuseppe',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via XXVIII 789','Caserta','CE','99999','Italia',NULL,NULL,''),
 (29,'Società CC','Zighetti','Barbara',NULL,'Direttore acquisti','012 34 56 78',NULL,NULL,'012 45 67 89','Via IXXX 789','Asti','AT','99999','Italia',NULL,NULL,'');
INSERT INTO "Corrieri" ("ID","Società","Cognome","Nome","Indirizzo_di_posta_elettronica","Posizione","Telefono__uff_","Telefono_domicilio","Tel_cellulare","Fax","Indirizzo","Città","Stato_Provincia","CAP","Paese","Pagina_Web","Note","Allegati") VALUES (1,'Spedizioniere A',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Via Lunedì 123','Caserta','CE','99999','Italia',NULL,NULL,''),
 (2,'Spedizioniere B',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Via Lunedì 123','Caserta','CE','99999','USA',NULL,NULL,''),
 (3,'Spedizioniere C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Via Lunedì 123','Caserta','CE','99999','Italia',NULL,NULL,'');
INSERT INTO "Dettagli_ordini_di_acquisto" ("ID","ID_ordine_acquisto","ID_prodotto","Quantità","Costo_unitario","Data_ricezione","Inserito_in_inventario","ID_inventario") VALUES (238,90,1,40,14.0,'2006-01-22',-1,59),
 (239,91,3,100,8.0,'2006-01-22',-1,54),
 (240,91,4,40,16.0,'2006-01-22',-1,55),
 (241,91,5,40,16.0,'2006-01-22',-1,56),
 (242,92,6,100,19.0,'2006-01-22',-1,40),
 (243,92,7,40,22.0,'2006-01-22',-1,41),
 (244,92,8,40,30.0,'2006-01-22',-1,42),
 (245,92,14,40,17.0,'2006-01-22',-1,43),
 (246,92,17,40,29.0,'2006-01-22',-1,44),
 (247,92,19,20,7.0,'2006-01-22',-1,45),
 (248,92,20,40,61.0,'2006-01-22',-1,46),
 (249,92,21,20,8.0,'2006-01-22',-1,47),
 (250,90,34,60,10.0,'2006-01-22',-1,60),
 (251,92,40,120,14.0,'2006-01-22',-1,48),
 (252,92,41,40,7.0,'2006-01-22',-1,49),
 (253,90,43,100,34.0,'2006-01-22',-1,61),
 (254,92,48,100,10.0,'2006-01-22',-1,50),
 (255,92,51,40,40.0,'2006-01-22',-1,51),
 (256,93,52,100,5.0,'2006-01-22',-1,37),
 (257,93,56,120,28.0,'2006-01-22',-1,38),
 (258,93,57,80,15.0,'2006-01-22',-1,39),
 (259,91,65,40,16.0,'2006-01-22',-1,57),
 (260,91,66,80,13.0,'2006-01-22',-1,58),
 (261,94,72,40,26.0,'2006-01-22',-1,36),
 (262,92,74,20,8.0,'2006-01-22',-1,52),
 (263,92,77,60,10.0,'2006-01-22',-1,53),
 (264,95,80,75,3.0,'2006-01-22',-1,35),
 (265,90,81,125,2.0,'2006-01-22',-1,62),
 (266,96,34,100,10.0,'2006-01-22',-1,82),
 (267,97,19,30,7.0,'2006-01-22',-1,80),
 (268,98,41,200,7.0,'2006-01-22',-1,78),
 (269,99,43,300,34.0,'2006-01-22',-1,76),
 (270,100,48,100,10.0,'2006-01-22',-1,74),
 (271,101,81,200,2.0,'2006-01-22',-1,72),
 (272,102,43,300,34.0,NULL,0,NULL),
 (273,103,19,10,7.0,'2006-04-17',-1,111),
 (274,104,41,50,7.0,'2006-04-06',-1,115),
 (275,105,57,100,15.0,'2006-04-05',-1,100),
 (276,106,72,50,26.0,'2006-04-05',-1,113),
 (277,107,34,300,10.0,'2006-04-05',-1,107),
 (278,108,8,25,30.0,'2006-04-05',-1,105),
 (279,109,19,25,7.0,'2006-04-05',-1,109),
 (280,110,43,250,34.0,'2006-04-10',-1,103),
 (281,90,1,40,14.0,NULL,0,NULL),
 (282,92,19,20,7.0,NULL,0,NULL),
 (283,111,34,50,10.0,'2006-04-04',-1,102),
 (285,91,3,50,8.0,NULL,0,NULL),
 (286,91,4,40,16.0,NULL,0,NULL),
 (288,140,85,10,9.0,NULL,0,NULL),
 (289,141,6,10,18.75,NULL,0,NULL),
 (290,142,1,1,13.5,NULL,0,NULL),
 (292,146,20,40,60.0,NULL,0,NULL),
 (293,146,51,40,39.0,NULL,0,NULL),
 (294,147,40,120,13.0,NULL,0,NULL),
 (295,148,72,40,26.0,NULL,0,NULL);
INSERT INTO "Dettagli_sugli_ordini" ("ID","ID_ordine","ID_prodotto","Quantità","Prezzo_unitario","Sconto","ID_stato","Data_assegnazione","ID_ordine_acquisto","ID_inventario") VALUES (27,30,34,100,14.0,0.0,2,NULL,96,83),
 (28,30,80,30,3.5,0.0,2,NULL,NULL,63),
 (29,31,7,10,30.0,0.0,2,NULL,NULL,64),
 (30,31,51,10,53.0,0.0,2,NULL,NULL,65),
 (31,31,80,10,3.5,0.0,2,NULL,NULL,66),
 (32,32,1,15,18.0,0.0,2,NULL,NULL,67),
 (33,32,43,20,46.0,0.0,2,NULL,NULL,68),
 (34,33,19,30,9.2,0.0,2,NULL,97,81),
 (35,34,19,20,9.2,0.0,2,NULL,NULL,69),
 (36,35,48,10,12.75,0.0,2,NULL,NULL,70),
 (37,36,41,200,9.65,0.0,2,NULL,98,79),
 (38,37,8,17,40.0,0.0,2,NULL,NULL,71),
 (39,38,43,300,46.0,0.0,2,NULL,99,77),
 (40,39,48,100,12.75,0.0,2,NULL,100,75),
 (41,40,81,200,2.99,0.0,2,NULL,101,73),
 (42,41,43,300,46.0,0.0,1,NULL,102,104),
 (43,42,6,10,25.0,0.0,2,NULL,NULL,84),
 (44,42,4,10,22.0,0.0,2,NULL,NULL,85),
 (45,42,19,10,9.2,0.0,2,NULL,103,110),
 (46,43,80,20,3.5,0.0,1,NULL,NULL,86),
 (47,43,81,50,2.99,0.0,1,NULL,NULL,87),
 (48,44,1,25,18.0,0.0,1,NULL,NULL,88),
 (49,44,43,25,46.0,0.0,1,NULL,NULL,89),
 (50,44,81,25,2.99,0.0,1,NULL,NULL,90),
 (51,45,41,50,9.65,0.0,2,NULL,104,116),
 (52,45,40,50,18.4,0.0,2,NULL,NULL,91),
 (53,46,57,100,19.5,0.0,2,NULL,105,101),
 (54,46,72,50,34.8,0.0,2,NULL,106,114),
 (55,47,34,300,14.0,0.0,2,NULL,107,108),
 (56,48,8,25,40.0,0.0,2,NULL,108,106),
 (57,48,19,25,9.2,0.0,2,NULL,109,112),
 (59,50,21,20,10.0,0.0,2,NULL,NULL,92),
 (60,51,5,25,21.35,0.0,2,NULL,NULL,93),
 (61,51,41,30,9.65,0.0,2,NULL,NULL,94),
 (62,51,40,30,18.4,0.0,2,NULL,NULL,95),
 (66,56,48,10,12.75,0.0,2,NULL,111,99),
 (67,55,34,87,14.0,0.0,2,NULL,NULL,117),
 (68,79,7,30,30.0,0.0,2,NULL,NULL,119),
 (69,79,51,30,53.0,0.0,2,NULL,NULL,118),
 (70,78,17,40,39.0,0.0,2,NULL,NULL,120),
 (71,77,6,90,25.0,0.0,2,NULL,NULL,121),
 (72,76,4,30,22.0,0.0,2,NULL,NULL,122),
 (73,75,48,40,12.75,0.0,2,NULL,NULL,123),
 (74,74,48,40,12.75,0.0,2,NULL,NULL,124),
 (75,73,41,10,9.65,0.0,2,NULL,NULL,125),
 (76,72,43,5,46.0,0.0,2,NULL,NULL,126),
 (77,71,40,40,18.4,0.0,2,NULL,NULL,127),
 (78,70,8,20,40.0,0.0,2,NULL,NULL,128),
 (79,69,80,15,3.5,0.0,2,NULL,NULL,129),
 (80,67,74,20,10.0,0.0,2,NULL,NULL,130),
 (81,60,72,40,34.8,0.0,2,NULL,NULL,131),
 (82,63,3,50,10.0,0.0,2,NULL,NULL,132),
 (83,63,8,3,40.0,0.0,2,NULL,NULL,133),
 (84,58,20,40,81.0,0.0,2,NULL,NULL,134),
 (85,58,52,40,7.0,0.0,2,NULL,NULL,135),
 (86,80,56,10,38.0,0.0,1,NULL,NULL,136),
 (90,81,81,0,2.99,0.0,5,NULL,NULL,NULL),
 (91,81,56,0,38.0,0.0,0,NULL,NULL,NULL);
INSERT INTO "Dipendenti" ("ID","Società","Cognome","Nome","Indirizzo_di_posta_elettronica","Posizione","Telefono__uff_","Telefono_domicilio","Tel_cellulare","Fax","Indirizzo","Città","Stato_Provincia","CAP","Paese","Pagina_Web","Note","Allegati") VALUES (1,'Northwind Traders','Leonetti','Francesca','leonetti@northwindtraders.com','Venditore','012 34 56 78','012 56 78 90',NULL,'012 67 89 01','Viale I 123','Roma','RM','99999','Italia','#http://northwindtraders.com#',NULL,''),
 (2,'Northwind Traders','Antonio','Esposito','esposito@northwindtraders.com','Vicepresidente, Vendite','012 34 56 78','012 56 78 90',NULL,'012 67 89 01','Viale II 123','Latina','LT','99999','Italia','http://northwindtraders.com#http://northwindtraders.com/#','Ha collaborato inizialmente come rappresentante, quindi ha assunto la carica di direttore vendite. Attualmente ricopre la carica di vicepresidente sempre nel settore vendite.',''),
 (3,'Northwind Traders','Bianchi','Giovanni','bianchi@northwindtraders.com','Venditore','012 34 56 78','012 56 78 90',NULL,'012 67 89 01','Viale III 123','Frascati','RM','99999','Italia','http://northwindtraders.com#http://northwindtraders.com/#','È stato assunto inizialmente come assistente alle vendite, quindi è stato promosso alla carica di rappresentante.',''),
 (4,'Northwind Traders','Ferraro','Anna','ferraro@northwindtraders.com','Venditore','012 34 56 78','012 56 78 90',NULL,'012 67 89 01','Viale IV 123','Latina','LT','99999','Italia','http://northwindtraders.com#http://northwindtraders.com/#',NULL,''),
 (5,'Northwind Traders','Colombo','Antonio','colombo@northwindtraders.com','Direttore vendite','012 34 56 78','012 56 78 90',NULL,'012 67 89 01','Viale V 123','Roma','RM','99999','Italia','http://northwindtraders.com#http://northwindtraders.com/#','Ha collaborato inizialmente come rappresentante, quindi ha assunto la carica di direttore vendite. Parla correntemente il francese.',''),
 (6,'Northwind Traders','Greco','Mario','greco@northwindtraders.com','Venditore','012 34 56 78','012 56 78 90',NULL,'012 67 89 01','Viale VI 123','Frascati','RM','99999','Italia','http://northwindtraders.com#http://northwindtraders.com/#','Parla correntemente il giapponese, legge e scrive francese, portoghese e spagnolo.',''),
 (7,'Northwind Traders','Bruno','Luigi','bruno@northwindtraders.com','Venditore','012 34 56 78','012 56 78 90',NULL,'012 67 89 01','Viale VII 123','Roma','RM','99999','Italia','http://northwindtraders.com#http://northwindtraders.com/#',NULL,''),
 (8,'Northwind Traders','Giussani','Laura','giussani@northwindtraders.com','Coordinatore vendite','012 34 56 78','012 56 78 90',NULL,'012 67 89 01','Viale VIII 123','Frascati','RM','99999','Italia','http://northwindtraders.com#http://northwindtraders.com/#','Legge e scrive in francese.',''),
 (9,'Northwind Traders','Ferrari','Maria','ferrari@northwindtraders.com','Venditore','012 34 56 78','012 56 78 90',NULL,'012 67 89 01','Viale IX 123','Roma','RM','99999','Italia','http://northwindtraders.com#http://northwindtraders.com/#','Parla correntemente francese e tedesco.','');
INSERT INTO "Fatture" ("ID_fattura","ID_ordine","Data_fattura","Scadenza","Imposta","Spedizione","Importo_dovuto") VALUES (5,31,'2006-03-22 16:08:59',NULL,0.0,0.0,0.0),
 (6,32,'2006-03-22 16:10:27',NULL,0.0,0.0,0.0),
 (7,40,'2006-03-24 10:41:41',NULL,0.0,0.0,0.0),
 (8,39,'2006-03-24 10:55:46',NULL,0.0,0.0,0.0),
 (9,38,'2006-03-24 10:56:57',NULL,0.0,0.0,0.0),
 (10,37,'2006-03-24 10:57:38',NULL,0.0,0.0,0.0),
 (11,36,'2006-03-24 10:58:40',NULL,0.0,0.0,0.0),
 (12,35,'2006-03-24 10:59:41',NULL,0.0,0.0,0.0),
 (13,34,'2006-03-24 11:00:55',NULL,0.0,0.0,0.0),
 (14,33,'2006-03-24 11:02:02',NULL,0.0,0.0,0.0),
 (15,30,'2006-03-24 11:03:00',NULL,0.0,0.0,0.0),
 (16,56,'2006-04-03 13:50:15',NULL,0.0,0.0,0.0),
 (17,55,'2006-04-04 11:05:04',NULL,0.0,0.0,0.0),
 (18,51,'2006-04-04 11:06:13',NULL,0.0,0.0,0.0),
 (19,50,'2006-04-04 11:06:56',NULL,0.0,0.0,0.0),
 (20,48,'2006-04-04 11:07:37',NULL,0.0,0.0,0.0),
 (21,47,'2006-04-04 11:08:14',NULL,0.0,0.0,0.0),
 (22,46,'2006-04-04 11:08:49',NULL,0.0,0.0,0.0),
 (23,45,'2006-04-04 11:09:24',NULL,0.0,0.0,0.0),
 (24,79,'2006-04-04 11:35:54',NULL,0.0,0.0,0.0),
 (25,78,'2006-04-04 11:36:21',NULL,0.0,0.0,0.0),
 (26,77,'2006-04-04 11:36:47',NULL,0.0,0.0,0.0),
 (27,76,'2006-04-04 11:37:09',NULL,0.0,0.0,0.0),
 (28,75,'2006-04-04 11:37:49',NULL,0.0,0.0,0.0),
 (29,74,'2006-04-04 11:38:11',NULL,0.0,0.0,0.0),
 (30,73,'2006-04-04 11:38:32',NULL,0.0,0.0,0.0),
 (31,72,'2006-04-04 11:38:53',NULL,0.0,0.0,0.0),
 (32,71,'2006-04-04 11:39:29',NULL,0.0,0.0,0.0),
 (33,70,'2006-04-04 11:39:53',NULL,0.0,0.0,0.0),
 (34,69,'2006-04-04 11:40:16',NULL,0.0,0.0,0.0),
 (35,67,'2006-04-04 11:40:38',NULL,0.0,0.0,0.0),
 (36,42,'2006-04-04 11:41:14',NULL,0.0,0.0,0.0),
 (37,60,'2006-04-04 11:41:45',NULL,0.0,0.0,0.0),
 (38,63,'2006-04-04 11:42:26',NULL,0.0,0.0,0.0),
 (39,58,'2006-04-04 11:43:08',NULL,0.0,0.0,0.0);
INSERT INTO "Fornitori" ("ID","Società","Cognome","Nome","Indirizzo_di_posta_elettronica","Posizione","Telefono__uff_","Telefono_domicilio","Tel_cellulare","Fax","Indirizzo","Città","Stato_Provincia","CAP","Paese","Pagina_Web","Note","Allegati") VALUES (1,'Fornitore A','Ciccu','Alice',NULL,'Direttore vendite',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
 (2,'Fornitore B','Ricci','Giuseppina',NULL,'Direttore vendite',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
 (3,'Fornitore C','Romano','Anna',NULL,'Venditore',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
 (4,'Fornitore D','Conti','Francesco',NULL,'Direttore marketing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
 (5,'Fornitore E','Marino','Rosa',NULL,'Direttore vendite',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
 (6,'Fornitore F','Gallo','Angela',NULL,'Funzionario marketing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
 (7,'Fornitore G','De Luca','Giovanna',NULL,'Direttore marketing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
 (8,'Fornitore H','Costa','Angelo',NULL,'Venditore',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
 (9,'Fornitore I','Mancini','Vincenzo',NULL,'Direttore vendite',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
 (10,'Fornitore J','Lombardi','Pietro',NULL,'Direttore vendite',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'');
INSERT INTO "Operazioni_di_magazzino" ("ID_transazione","Tipo_transazione","Data_creazione_transazione","Data_modifica_transazione","ID_prodotto","Quantità","ID_ordine_acquisto","ID_ordine_cliente","Commenti") VALUES (35,1,'2006-03-22 16:02:28','2006-03-22 16:02:28',80,75,NULL,NULL,NULL),
 (36,1,'2006-03-22 16:02:48','2006-03-22 16:02:48',72,40,NULL,NULL,NULL),
 (37,1,'2006-03-22 16:03:04','2006-03-22 16:03:04',52,100,NULL,NULL,NULL),
 (38,1,'2006-03-22 16:03:09','2006-03-22 16:03:09',56,120,NULL,NULL,NULL),
 (39,1,'2006-03-22 16:03:14','2006-03-22 16:03:14',57,80,NULL,NULL,NULL),
 (40,1,'2006-03-22 16:03:40','2006-03-22 16:03:40',6,100,NULL,NULL,NULL),
 (41,1,'2006-03-22 16:03:47','2006-03-22 16:03:47',7,40,NULL,NULL,NULL),
 (42,1,'2006-03-22 16:03:54','2006-03-22 16:03:54',8,40,NULL,NULL,NULL),
 (43,1,'2006-03-22 16:04:02','2006-03-22 16:04:02',14,40,NULL,NULL,NULL),
 (44,1,'2006-03-22 16:04:07','2006-03-22 16:04:07',17,40,NULL,NULL,NULL),
 (45,1,'2006-03-22 16:04:12','2006-03-22 16:04:12',19,20,NULL,NULL,NULL),
 (46,1,'2006-03-22 16:04:17','2006-03-22 16:04:17',20,40,NULL,NULL,NULL),
 (47,1,'2006-03-22 16:04:20','2006-03-22 16:04:20',21,20,NULL,NULL,NULL),
 (48,1,'2006-03-22 16:04:24','2006-03-22 16:04:24',40,120,NULL,NULL,NULL),
 (49,1,'2006-03-22 16:04:28','2006-03-22 16:04:28',41,40,NULL,NULL,NULL),
 (50,1,'2006-03-22 16:04:31','2006-03-22 16:04:31',48,100,NULL,NULL,NULL),
 (51,1,'2006-03-22 16:04:38','2006-03-22 16:04:38',51,40,NULL,NULL,NULL),
 (52,1,'2006-03-22 16:04:41','2006-03-22 16:04:41',74,20,NULL,NULL,NULL),
 (53,1,'2006-03-22 16:04:45','2006-03-22 16:04:45',77,60,NULL,NULL,NULL),
 (54,1,'2006-03-22 16:05:07','2006-03-22 16:05:07',3,100,NULL,NULL,NULL),
 (55,1,'2006-03-22 16:05:11','2006-03-22 16:05:11',4,40,NULL,NULL,NULL),
 (56,1,'2006-03-22 16:05:14','2006-03-22 16:05:14',5,40,NULL,NULL,NULL),
 (57,1,'2006-03-22 16:05:26','2006-03-22 16:05:26',65,40,NULL,NULL,NULL),
 (58,1,'2006-03-22 16:05:32','2006-03-22 16:05:32',66,80,NULL,NULL,NULL),
 (59,1,'2006-03-22 16:05:47','2006-03-22 16:05:47',1,40,NULL,NULL,NULL),
 (60,1,'2006-03-22 16:05:51','2006-03-22 16:05:51',34,60,NULL,NULL,NULL),
 (61,1,'2006-03-22 16:06:00','2006-03-22 16:06:00',43,100,NULL,NULL,NULL),
 (62,1,'2006-03-22 16:06:03','2006-03-22 16:06:03',81,125,NULL,NULL,NULL),
 (63,2,'2006-03-22 16:07:56','2006-03-24 11:03:00',80,30,NULL,NULL,NULL),
 (64,2,'2006-03-22 16:08:19','2006-03-22 16:08:59',7,10,NULL,NULL,NULL),
 (65,2,'2006-03-22 16:08:29','2006-03-22 16:08:59',51,10,NULL,NULL,NULL),
 (66,2,'2006-03-22 16:08:37','2006-03-22 16:08:59',80,10,NULL,NULL,NULL),
 (67,2,'2006-03-22 16:09:46','2006-03-22 16:10:27',1,15,NULL,NULL,NULL),
 (68,2,'2006-03-22 16:10:06','2006-03-22 16:10:27',43,20,NULL,NULL,NULL),
 (69,2,'2006-03-22 16:11:39','2006-03-24 11:00:55',19,20,NULL,NULL,NULL),
 (70,2,'2006-03-22 16:11:56','2006-03-24 10:59:41',48,10,NULL,NULL,NULL),
 (71,2,'2006-03-22 16:12:29','2006-03-24 10:57:38',8,17,NULL,NULL,NULL),
 (72,1,'2006-03-24 10:41:30','2006-03-24 10:41:30',81,200,NULL,NULL,NULL),
 (73,2,'2006-03-24 10:41:33','2006-03-24 10:41:42',81,200,NULL,NULL,'Evasione fornitura arretrata, ordine n. 40'),
 (74,1,'2006-03-24 10:53:13','2006-03-24 10:53:13',48,100,NULL,NULL,NULL),
 (75,2,'2006-03-24 10:53:16','2006-03-24 10:55:46',48,100,NULL,NULL,'Evasione fornitura arretrata, ordine n. 39'),
 (76,1,'2006-03-24 10:53:36','2006-03-24 10:53:36',43,300,NULL,NULL,NULL),
 (77,2,'2006-03-24 10:53:39','2006-03-24 10:56:57',43,300,NULL,NULL,'Evasione fornitura arretrata, ordine n. 38'),
 (78,1,'2006-03-24 10:54:04','2006-03-24 10:54:04',41,200,NULL,NULL,NULL),
 (79,2,'2006-03-24 10:54:07','2006-03-24 10:58:40',41,200,NULL,NULL,'Evasione fornitura arretrata, ordine n. 36'),
 (80,1,'2006-03-24 10:54:33','2006-03-24 10:54:33',19,30,NULL,NULL,NULL),
 (81,2,'2006-03-24 10:54:35','2006-03-24 11:02:02',19,30,NULL,NULL,'Evasione fornitura arretrata, ordine n. 33'),
 (82,1,'2006-03-24 10:54:58','2006-03-24 10:54:58',34,100,NULL,NULL,NULL),
 (83,2,'2006-03-24 10:55:02','2006-03-24 11:03:00',34,100,NULL,NULL,'Evasione fornitura arretrata, ordine n. 30'),
 (84,2,'2006-03-24 14:48:15','2006-04-04 11:41:14',6,10,NULL,NULL,NULL),
 (85,2,'2006-03-24 14:48:23','2006-04-04 11:41:14',4,10,NULL,NULL,NULL),
 (86,3,'2006-03-24 14:49:16','2006-03-24 14:49:16',80,20,NULL,NULL,NULL),
 (87,3,'2006-03-24 14:49:20','2006-03-24 14:49:20',81,50,NULL,NULL,NULL),
 (88,3,'2006-03-24 14:50:09','2006-03-24 14:50:09',1,25,NULL,NULL,NULL),
 (89,3,'2006-03-24 14:50:14','2006-03-24 14:50:14',43,25,NULL,NULL,NULL),
 (90,3,'2006-03-24 14:50:18','2006-03-24 14:50:18',81,25,NULL,NULL,NULL),
 (91,2,'2006-03-24 14:51:03','2006-04-04 11:09:24',40,50,NULL,NULL,NULL),
 (92,2,'2006-03-24 14:55:03','2006-04-04 11:06:56',21,20,NULL,NULL,NULL),
 (93,2,'2006-03-24 14:55:39','2006-04-04 11:06:13',5,25,NULL,NULL,NULL),
 (94,2,'2006-03-24 14:55:52','2006-04-04 11:06:13',41,30,NULL,NULL,NULL),
 (95,2,'2006-03-24 14:56:09','2006-04-04 11:06:13',40,30,NULL,NULL,NULL),
 (96,3,'2006-03-30 16:46:34','2006-03-30 16:46:34',34,12,NULL,NULL,NULL),
 (97,3,'2006-03-30 17:23:27','2006-03-30 17:23:27',34,10,NULL,NULL,NULL),
 (98,3,'2006-03-30 17:24:33','2006-03-30 17:24:33',34,1,NULL,NULL,NULL),
 (99,2,'2006-04-03 13:50:08','2006-04-03 13:50:15',48,10,NULL,NULL,NULL),
 (100,1,'2006-04-04 11:00:54','2006-04-04 11:00:54',57,100,NULL,NULL,NULL),
 (101,2,'2006-04-04 11:00:56','2006-04-04 11:08:49',57,100,NULL,NULL,'Evasione fornitura arretrata, ordine n. 46'),
 (102,1,'2006-04-04 11:01:14','2006-04-04 11:01:14',34,50,NULL,NULL,NULL),
 (103,1,'2006-04-04 11:01:35','2006-04-04 11:01:35',43,250,NULL,NULL,NULL),
 (104,3,'2006-04-04 11:01:37','2006-04-04 11:01:37',43,300,NULL,NULL,'Evasione fornitura arretrata, ordine n. 41'),
 (105,1,'2006-04-04 11:01:55','2006-04-04 11:01:55',8,25,NULL,NULL,NULL),
 (106,2,'2006-04-04 11:01:58','2006-04-04 11:07:37',8,25,NULL,NULL,'Evasione fornitura arretrata, ordine n. 48'),
 (107,1,'2006-04-04 11:02:17','2006-04-04 11:02:17',34,300,NULL,NULL,NULL),
 (108,2,'2006-04-04 11:02:19','2006-04-04 11:08:14',34,300,NULL,NULL,'Evasione fornitura arretrata, ordine n. 47'),
 (109,1,'2006-04-04 11:02:37','2006-04-04 11:02:37',19,25,NULL,NULL,NULL),
 (110,2,'2006-04-04 11:02:39','2006-04-04 11:41:14',19,10,NULL,NULL,'Evasione fornitura arretrata, ordine n. 42'),
 (111,1,'2006-04-04 11:02:56','2006-04-04 11:02:56',19,10,NULL,NULL,NULL),
 (112,2,'2006-04-04 11:02:58','2006-04-04 11:07:37',19,25,NULL,NULL,'Evasione fornitura arretrata, ordine n. 48'),
 (113,1,'2006-04-04 11:03:12','2006-04-04 11:03:12',72,50,NULL,NULL,NULL),
 (114,2,'2006-04-04 11:03:14','2006-04-04 11:08:49',72,50,NULL,NULL,'Evasione fornitura arretrata, ordine n. 46'),
 (115,1,'2006-04-04 11:03:38','2006-04-04 11:03:38',41,50,NULL,NULL,NULL),
 (116,2,'2006-04-04 11:03:39','2006-04-04 11:09:24',41,50,NULL,NULL,'Evasione fornitura arretrata, ordine n. 45'),
 (117,2,'2006-04-04 11:04:55','2006-04-04 11:05:04',34,87,NULL,NULL,NULL),
 (118,2,'2006-04-04 11:35:50','2006-04-04 11:35:54',51,30,NULL,NULL,NULL),
 (119,2,'2006-04-04 11:35:51','2006-04-04 11:35:54',7,30,NULL,NULL,NULL),
 (120,2,'2006-04-04 11:36:15','2006-04-04 11:36:21',17,40,NULL,NULL,NULL),
 (121,2,'2006-04-04 11:36:39','2006-04-04 11:36:47',6,90,NULL,NULL,NULL),
 (122,2,'2006-04-04 11:37:06','2006-04-04 11:37:09',4,30,NULL,NULL,NULL),
 (123,2,'2006-04-04 11:37:45','2006-04-04 11:37:49',48,40,NULL,NULL,NULL),
 (124,2,'2006-04-04 11:38:07','2006-04-04 11:38:11',48,40,NULL,NULL,NULL),
 (125,2,'2006-04-04 11:38:27','2006-04-04 11:38:32',41,10,NULL,NULL,NULL),
 (126,2,'2006-04-04 11:38:48','2006-04-04 11:38:53',43,5,NULL,NULL,NULL),
 (127,2,'2006-04-04 11:39:12','2006-04-04 11:39:29',40,40,NULL,NULL,NULL),
 (128,2,'2006-04-04 11:39:50','2006-04-04 11:39:53',8,20,NULL,NULL,NULL),
 (129,2,'2006-04-04 11:40:13','2006-04-04 11:40:16',80,15,NULL,NULL,NULL),
 (130,2,'2006-04-04 11:40:32','2006-04-04 11:40:38',74,20,NULL,NULL,NULL),
 (131,2,'2006-04-04 11:41:39','2006-04-04 11:41:45',72,40,NULL,NULL,NULL),
 (132,2,'2006-04-04 11:42:17','2006-04-04 11:42:26',3,50,NULL,NULL,NULL),
 (133,2,'2006-04-04 11:42:24','2006-04-04 11:42:26',8,3,NULL,NULL,NULL),
 (134,2,'2006-04-04 11:42:48','2006-04-04 11:43:08',20,40,NULL,NULL,NULL),
 (135,2,'2006-04-04 11:43:05','2006-04-04 11:43:08',52,40,NULL,NULL,NULL),
 (136,3,'2006-04-25 17:04:05','2006-04-25 17:04:57',56,110,NULL,NULL,NULL);
INSERT INTO "Ordini" ("ID_ordine","ID_dipendente","ID_cliente","Data_ordine","Data_spedizione","ID_corriere","Nome_spedizione","Indirizzo_di_spedizione","Città_destinatario","Stato_Prov_dest","CAP_spedizione","Paese_spedizione","Costi_di_spedizione","Imposte","Tipo_pagamento","Data_pagamento","Note","Aliquota_d_imposta","Stato_imposta","ID_stato") VALUES (30,9,27,'2006-01-15','2006-01-22',2,'Eva Valverde','Via XXVII 789','Bologna','BO','99999','Italia',200.0,0.0,'Assegno','2006-01-15',NULL,0.0,NULL,3),
 (31,3,4,'2006-01-20','2006-01-22',1,'Raffaella Bonaldi','Via IV 123','Reggio Emilia','RE','99999','Italia',5.0,0.0,'Carta di credito','2006-01-20',NULL,0.0,NULL,3),
 (32,4,12,'2006-01-22','2006-01-22',2,'Luca Argentiero','Via XII 123','Bologna','BO','99999','Italia',5.0,0.0,'Carta di credito','2006-01-22',NULL,0.0,NULL,3),
 (33,6,8,'2006-01-30','2006-01-31',3,'Alice Ciccu','Via VIII 123','Torino','TO','99999','Italia',50.0,0.0,'Carta di credito','2006-01-30',NULL,0.0,NULL,3),
 (34,9,4,'2006-02-06','2006-02-07',3,'Raffaella Bonaldi','Via IV 123','Reggio Emilia','RE','99999','Italia',4.0,0.0,'Assegno','2006-02-06',NULL,0.0,NULL,3),
 (35,3,29,'2006-02-10','2006-02-12',2,'Barbara Zighetti','Via IXXX 789','Asti','AT','99999','Italia',7.0,0.0,'Assegno','2006-02-10',NULL,0.0,NULL,3),
 (36,4,3,'2006-02-23','2006-02-25',2,'Fernando Caro','Via III 123','Cagliari','CA','99999','Italia',7.0,0.0,'Contanti','2006-02-23',NULL,0.0,NULL,3),
 (37,8,6,'2006-03-06','2006-03-09',2,'Luca Dellamore','Via VI 123','Firenze','FI','99999','Italia',12.0,0.0,'Carta di credito','2006-03-06',NULL,0.0,NULL,3),
 (38,9,28,'2006-03-10','2006-03-11',3,'Giuseppe Rossi','Via XXVIII 789','Caserta','CE','99999','Italia',10.0,0.0,'Assegno','2006-03-10',NULL,0.0,NULL,3),
 (39,3,8,'2006-03-22','2006-03-24',3,'Alice Ciccu','Via VIII 123','Torino','TO','99999','Italia',5.0,0.0,'Assegno','2006-03-22',NULL,0.0,NULL,3),
 (40,4,10,'2006-03-24','2006-03-24',2,'Lucio Iallo','Via X 123','Messina','ME','99999','Italia',9.0,0.0,'Carta di credito','2006-03-24',NULL,0.0,NULL,3),
 (41,1,7,'2006-03-24',NULL,NULL,'Luisa Cazzaniga','Via VII 123','Trieste','TS','99999','Italia',0.0,0.0,NULL,NULL,NULL,0.0,NULL,0),
 (42,1,10,'2006-03-24','2006-04-07',1,'Lucio Iallo','Via X 123','Messina','ME','99999','Italia',0.0,0.0,NULL,NULL,NULL,0.0,NULL,2),
 (43,1,11,'2006-03-24',NULL,3,'Alessandro Leoni','Via XI 123','Ancona','AN','99999','Italia',0.0,0.0,NULL,NULL,NULL,0.0,NULL,0),
 (44,1,1,'2006-03-24',NULL,NULL,'Angela Barbariol','Via I 123','Roma','RM','99999','Italia',0.0,0.0,NULL,NULL,NULL,0.0,NULL,0),
 (45,1,28,'2006-04-07','2006-04-07',3,'Giuseppe Rossi','Via XXVIII 789','Caserta','CE','99999','Italia',40.0,0.0,'Carta di credito','2006-04-07',NULL,0.0,NULL,3),
 (46,7,9,'2006-04-05','2006-04-05',1,'Davide Garghentini','Via IX 123','Perugia','PG','99999','Italia',100.0,0.0,'Assegno','2006-04-05',NULL,0.0,NULL,3),
 (47,6,6,'2006-04-08','2006-04-08',2,'Luca Dellamore','Via VI 123','Firenze','FI','99999','Italia',300.0,0.0,'Carta di credito','2006-04-08',NULL,0.0,NULL,3),
 (48,4,8,'2006-04-05','2006-04-05',2,'Alice Ciccu','Via VIII 123','Torino','TO','99999','Italia',50.0,0.0,'Assegno','2006-04-05',NULL,0.0,NULL,3),
 (50,9,25,'2006-04-05','2006-04-05',1,'Marco Tanara','Via XXV 789','Messina','ME','99999','Italia',5.0,0.0,'Contanti','2006-04-05',NULL,0.0,NULL,3),
 (51,9,26,'2006-04-05','2006-04-05',3,'Elisabetta Scotti','Via XXVI 789','Ancona','AN','99999','Italia',60.0,0.0,'Carta di credito','2006-04-05',NULL,0.0,NULL,3),
 (55,1,29,'2006-04-05','2006-04-05',2,'Barbara Zighetti','Via IXXX 789','Asti','AT','99999','Italia',200.0,0.0,'Assegno','2006-04-05',NULL,0.0,NULL,3),
 (56,2,6,'2006-04-03','2006-04-03',3,'Luca Dellamore','Via VI 123','Firenze','FI','99999','Italia',0.0,0.0,'Assegno','2006-04-03',NULL,0.0,NULL,3),
 (57,9,27,'2006-04-22','2006-04-22',2,'Eva Valverde','Via XXVII 789','Bologna','BO','99999','Italia',200.0,0.0,'Assegno','2006-04-22',NULL,0.0,NULL,0),
 (58,3,4,'2006-04-22','2006-04-22',1,'Raffaella Bonaldi','Via IV 123','Reggio Emilia','RE','99999','Italia',5.0,0.0,'Carta di credito','2006-04-22',NULL,0.0,NULL,3),
 (59,4,12,'2006-04-22','2006-04-22',2,'Luca Argentiero','Via XII 123','Bologna','BO','99999','Italia',5.0,0.0,'Carta di credito','2006-04-22',NULL,0.0,NULL,0),
 (60,6,8,'2006-04-30','2006-04-30',3,'Alice Ciccu','Via VIII 123','Torino','TO','99999','Italia',50.0,0.0,'Carta di credito','2006-04-30',NULL,0.0,NULL,3),
 (61,9,4,'2006-04-07','2006-04-07',3,'Raffaella Bonaldi','Via IV 123','Reggio Emilia','RE','99999','Italia',4.0,0.0,'Assegno','2006-04-07',NULL,0.0,NULL,0),
 (62,3,29,'2006-04-12','2006-04-12',2,'Barbara Zighetti','Via IXXX 789','Asti','AT','99999','Italia',7.0,0.0,'Assegno','2006-04-12',NULL,0.0,NULL,0),
 (63,4,3,'2006-04-25','2006-04-25',2,'Fernando Caro','Via III 123','Cagliari','CA','99999','Italia',7.0,0.0,'Contanti','2006-04-25',NULL,0.0,NULL,3),
 (64,8,6,'2006-05-09','2006-05-09',2,'Luca Dellamore','Via VI 123','Firenze','FI','99999','Italia',12.0,0.0,'Carta di credito','2006-05-09',NULL,0.0,NULL,0),
 (65,9,28,'2006-05-11','2006-05-11',3,'Giuseppe Rossi','Via XXVIII 789','Caserta','CE','99999','Italia',10.0,0.0,'Assegno','2006-05-11',NULL,0.0,NULL,0),
 (66,3,8,'2006-05-24','2006-05-24',3,'Alice Ciccu','Via VIII 123','Torino','TO','99999','Italia',5.0,0.0,'Assegno','2006-05-24',NULL,0.0,NULL,0),
 (67,4,10,'2006-05-24','2006-05-24',2,'Lucio Iallo','Via X 123','Messina','ME','99999','Italia',9.0,0.0,'Carta di credito','2006-05-24',NULL,0.0,NULL,3),
 (68,1,7,'2006-05-24',NULL,NULL,'Luisa Cazzaniga','Via VII 123','Trieste','TS','99999','Italia',0.0,0.0,NULL,NULL,NULL,0.0,NULL,0),
 (69,1,10,'2006-05-24',NULL,1,'Lucio Iallo','Via X 123','Messina','ME','99999','Italia',0.0,0.0,NULL,NULL,NULL,0.0,NULL,0),
 (70,1,11,'2006-05-24',NULL,3,'Alessandro Leoni','Via XI 123','Ancona','AN','99999','Italia',0.0,0.0,NULL,NULL,NULL,0.0,NULL,0),
 (71,1,1,'2006-05-24',NULL,3,'Angela Barbariol','Via I 123','Roma','RM','99999','Italia',0.0,0.0,NULL,NULL,NULL,0.0,NULL,0),
 (72,1,28,'2006-06-07','2006-06-07',3,'Giuseppe Rossi','Via XXVIII 789','Caserta','CE','99999','Italia',40.0,0.0,'Carta di credito','2006-06-07',NULL,0.0,NULL,3),
 (73,7,9,'2006-06-05','2006-06-05',1,'Davide Garghentini','Via IX 123','Perugia','PG','99999','Italia',100.0,0.0,'Assegno','2006-06-05',NULL,0.0,NULL,3),
 (74,6,6,'2006-06-08','2006-06-08',2,'Luca Dellamore','Via VI 123','Firenze','FI','99999','Italia',300.0,0.0,'Carta di credito','2006-06-08',NULL,0.0,NULL,3),
 (75,4,8,'2006-06-05','2006-06-05',2,'Alice Ciccu','Via VIII 123','Torino','TO','99999','Italia',50.0,0.0,'Assegno','2006-06-05',NULL,0.0,NULL,3),
 (76,9,25,'2006-06-05','2006-06-05',1,'Marco Tanara','Via XXV 789','Messina','ME','99999','Italia',5.0,0.0,'Contanti','2006-06-05',NULL,0.0,NULL,3),
 (77,9,26,'2006-06-05','2006-06-05',3,'Elisabetta Scotti','Via XXVI 789','Ancona','AN','99999','Italia',60.0,0.0,'Carta di credito','2006-06-05',NULL,0.0,NULL,3),
 (78,1,29,'2006-06-05','2006-06-05',2,'Barbara Zighetti','Via IXXX 789','Asti','AT','99999','Italia',200.0,0.0,'Assegno','2006-06-05',NULL,0.0,NULL,3),
 (79,2,6,'2006-06-23','2006-06-23',3,'Luca Dellamore','Via VI 123','Firenze','FI','99999','Italia',0.0,0.0,'Assegno','2006-06-23',NULL,0.0,NULL,3),
 (80,2,4,'2006-04-25 17:03:55',NULL,NULL,'Raffaella Bonaldi','Via IV 123','Reggio Emilia','RE','99999','Italia',0.0,0.0,NULL,NULL,NULL,0.0,NULL,0),
 (81,2,3,'2006-04-25 17:26:53',NULL,NULL,'Fernando Caro','Via III 123','Cagliari','CA','99999','Italia',0.0,0.0,NULL,NULL,NULL,0.0,NULL,0);
INSERT INTO "Ordini_di_acquisto" ("ID_ordine_acquisto","ID_fornitore","Creato_da","Data_invio","Data_creazione","ID_stato","Data_prevista","Costi_di_spedizione","Imposte","Data_pagamento","Importo_pagam","Modalità_pag","Note","Approvato_da","Data_approvazione","Inserito_da") VALUES (90,1,2,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,NULL,2,'2006-01-22',2),
 (91,3,2,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,NULL,2,'2006-01-22',2),
 (92,2,2,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,NULL,2,'2006-01-22',2),
 (93,5,2,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,NULL,2,'2006-01-22',2),
 (94,6,2,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,NULL,2,'2006-01-22',2),
 (95,4,2,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,NULL,2,'2006-01-22',2),
 (96,1,5,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 30',2,'2006-01-22',5),
 (97,2,7,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 33',2,'2006-01-22',7),
 (98,2,4,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 36',2,'2006-01-22',4),
 (99,1,3,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 38',2,'2006-01-22',3),
 (100,2,9,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 39',2,'2006-01-22',9),
 (101,1,2,'2006-01-14','2006-01-22',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 40',2,'2006-01-22',2),
 (102,1,1,'2006-03-24','2006-03-24',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 41',2,'2006-04-04',1),
 (103,2,1,'2006-03-24','2006-03-24',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 42',2,'2006-04-04',1),
 (104,2,1,'2006-03-24','2006-03-24',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 45',2,'2006-04-04',1),
 (105,5,7,'2006-03-24','2006-03-24',2,NULL,0.0,0.0,NULL,0.0,'Assegno','Acquisto generato in base all''ordine n. 46',2,'2006-04-04',7),
 (106,6,7,'2006-03-24','2006-03-24',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 46',2,'2006-04-04',7),
 (107,1,6,'2006-03-24','2006-03-24',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 47',2,'2006-04-04',6),
 (108,2,4,'2006-03-24','2006-03-24',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 48',2,'2006-04-04',4),
 (109,2,4,'2006-03-24','2006-03-24',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 48',2,'2006-04-04',4),
 (110,1,3,'2006-03-24','2006-03-24',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 49',2,'2006-04-04',3),
 (111,1,2,'2006-03-31','2006-03-31',2,NULL,0.0,0.0,NULL,0.0,NULL,'Acquisto generato in base all''ordine n. 56',2,'2006-04-04',2),
 (140,6,NULL,'2006-04-25','2006-04-25 16:40:51',2,NULL,0.0,0.0,NULL,0.0,NULL,NULL,2,'2006-04-25 16:41:33',2),
 (141,8,NULL,'2006-04-25','2006-04-25 17:10:35',2,NULL,0.0,0.0,NULL,0.0,NULL,NULL,2,'2006-04-25 17:10:55',2),
 (142,8,NULL,'2006-04-25','2006-04-25 17:18:29',2,NULL,0.0,0.0,NULL,0.0,'Assegno',NULL,2,'2006-04-25 17:18:51',2),
 (146,2,2,'2006-04-26 18:26:37','2006-04-26 18:26:37',1,NULL,0.0,0.0,NULL,0.0,NULL,NULL,NULL,NULL,2),
 (147,7,2,'2006-04-26 18:33:28','2006-04-26 18:33:28',1,NULL,0.0,0.0,NULL,0.0,NULL,NULL,NULL,NULL,2),
 (148,5,2,'2006-04-26 18:33:52','2006-04-26 18:33:52',1,NULL,0.0,0.0,NULL,0.0,NULL,NULL,NULL,NULL,2);
INSERT INTO "Privilegi" ("ID_privilegio","Nome_privilegio") VALUES (2,'Approvazione acquisti');
INSERT INTO "Privilegi_dipendente" ("ID_dipendente","ID_privilegio") VALUES (2,2);
INSERT INTO "Prodotti" ("ID_fornitori","ID","Codice_prodotto","Nome_prodotto","Descrizione","Costo_standard","Prezzo_di_listino","Livello_di_riordino","Livello_stabilito","Quantità_per_unità","Sospeso","Quantità_di_riordino_minima","Categoria","Allegati") VALUES ('4',1,'NWTB-1','Acqua minerale Northwind Traders',NULL,13.5,18.0,10,40,'10 scatole da 20 buste',0,10,'Bevande',''),
 ('10',3,'NWTCO-3','Aceto di mele Northwind Traders',NULL,7.5,10.0,25,100,'12 bottiglie da 550 ml',0,25,'Condimenti',''),
 ('10',4,'NWTCO-4','Maionese Northwind Traders',NULL,16.5,22.0,10,40,'48 vasetti da 180 g',0,10,'Condimenti',''),
 ('10',5,'NWTO-5','Olio di oliva Northwind Traders',NULL,16.0125,21.35,10,40,'36 lattine',0,10,'Olio',''),
 ('2;6',6,'NWTJP-6','Marmellata di rose Northwind Traders',NULL,18.75,25.0,25,100,'12 vasetti da 250 g',0,25,'Marmellate, conserve',''),
 ('2',7,'NWTDFN-7','Pere secche Northwind Traders',NULL,22.5,30.0,10,40,'12 confezioni da 500 g',0,10,'Frutta secca',''),
 ('8',8,'NWTS-8','Salsa al curry Northwind Traders',NULL,30.0,40.0,10,40,'12 vasetti da 360 g',0,10,'Salse',''),
 ('2;6',14,'NWTDFN-14','Noci Northwind Traders',NULL,17.4375,23.25,10,40,'40 confezioni da 100 g',0,10,'Frutta secca',''),
 ('6',17,'NWTCFV-17','Macedonia Northwind Traders',NULL,29.25,39.0,10,40,'520 g',0,10,'Frutta e verdura in scatola',''),
 ('1',19,'NWTBGM-19','Frollini Northwind Traders',NULL,6.9,9.2,5,20,'10 scatole da 12 pezzi',0,5,'Prodotti da forno',''),
 ('2;6',20,'NWTJP-6','Marmellata d''arance Northwind Traders',NULL,60.75,81.0,10,40,'30 confezioni regalo',0,10,'Marmellate, conserve',''),
 ('1',21,'NWTBGM-21','Cornetti Northwind Traders',NULL,7.5,10.0,5,20,'24 confezioni da 4 pezzi',0,5,'Prodotti da forno',''),
 ('4',34,'NWTB-34','Birra Northwind Traders',NULL,10.5,14.0,15,60,'24 bottiglie da 33 cl',0,15,'Bevande',''),
 ('7',40,'NWTCM-40','Alici Northwind Traders',NULL,13.8,18.4,30,120,'24 scatolette da 120 g',0,30,'Carne e pesce in scatola',''),
 ('6',41,'NWTSO-41','Zuppa di legumi Northwind Traders',NULL,7.2375,9.65,10,40,'12 lattine da 33 cl',0,10,'Minestre',''),
 ('3;4',43,'NWTB-43','Caffé Northwind Traders',NULL,34.5,46.0,25,100,'16 barattoli da 500 g',0,25,'Bevande',''),
 ('10',48,'NWTCA-48','Cioccolato Northwind Traders',NULL,9.5625,12.75,25,100,'10 confezioni',0,25,'Dolciumi',''),
 ('2',51,'NWTDFN-51','Mele secche Northwind Traders',NULL,39.75,53.0,10,40,'50 confezioni da 300 g',0,10,'Frutta secca',''),
 ('1',52,'NWTG-52','Riso Northwind Traders',NULL,5.25,7.0,25,100,'16 scatole da 2 kg',0,25,'Cereali',''),
 ('1',56,'NWTP-56','Gnocchi Northwind Traders',NULL,28.5,38.0,30,120,'24 confezioni da 250 g',0,30,'Pasta',''),
 ('1',57,'NWTP-57','Ravioli Northwind Traders',NULL,14.625,19.5,20,80,'24 confezioni da 250 g',0,20,'Pasta',''),
 ('8',65,'NWTS-65','Salsa di soia Northwind Traders',NULL,15.7875,21.05,10,40,'32 bottiglie da 250 g',0,10,'Salse',''),
 ('8',66,'NWTS-66','Passata di pomodoro Northwind Traders',NULL,12.75,17.0,20,80,'24 vasetti da 250 g',0,20,'Salse',''),
 ('5',72,'NWTD-72','Mozzarella Northwind Traders',NULL,26.1,34.8,10,40,'24 confezioni da 200 g',0,10,'Prodotti caseari',''),
 ('2;6',74,'NWTDFN-74','Mandorle Northwind Traders',NULL,7.5,10.0,5,20,'Confezione da 5 kg',0,5,'Frutta secca',''),
 ('10',77,'NWTCO-77','Senape Northwind Traders',NULL,9.75,13.0,15,60,'12 vasetti',0,15,'Condimenti',''),
 ('2',80,'NWTDFN-80','Prugne secche Northwind Traders',NULL,3.0,3.5,50,75,'Busta da 500 g',0,25,'Frutta secca',''),
 ('3',81,'NWTB-81','Te verde Northwind Traders',NULL,2.0,2.99,100,125,'20 buste per scatola',0,25,'Bevande',''),
 ('1',82,'NWTC-82','Orzo Northwind Traders',NULL,2.0,4.0,20,100,NULL,0,NULL,'Cereali',''),
 ('9',83,'NWTCS-83','Patatine Northwind Traders',NULL,0.5,1.8,30,200,NULL,0,NULL,'Patatine, snack',''),
 ('1',85,'NWTBGM-85','Crostatine Northwind Traders',NULL,9.0,12.49,10,20,'3 scatole',0,5,'Prodotti da forno',''),
 ('1',86,'NWTBGM-86','Preparato per torte Northwind Traders',NULL,10.5,15.99,10,20,'4 scatole',0,5,'Prodotti da forno',''),
 ('7',87,'NWTB-87','Te Northwind Traders',NULL,2.0,4.0,20,50,'100 buste per scatola',0,NULL,'Bevande',''),
 ('6',88,'NWTCFV-88','Pere sciroppate Northwind Traders',NULL,1.0,1.3,10,40,'520 g',0,NULL,'Frutta e verdura in scatola',''),
 ('6',89,'NWTCFV-89','Pesche sciroppate Northwind Traders',NULL,1.0,1.5,10,40,'520 g',0,NULL,'Frutta e verdura in scatola',''),
 ('6',90,'NWTCFV-90','Ananas sciroppato Northwind Traders',NULL,1.0,1.8,10,40,'520 g',0,NULL,'Frutta e verdura in scatola',''),
 ('6',91,'NWTCFV-91','Amarene sciroppate Northwind Traders',NULL,1.0,2.0,10,40,'520 g',0,NULL,'Frutta e verdura in scatola',''),
 ('6',92,'NWTCFV-92','Fagiolini Northwind Traders',NULL,1.0,1.2,10,40,'500 g',0,NULL,'Frutta e verdura in scatola',''),
 ('6',93,'NWTCFV-93','Mais Northwind Traders',NULL,1.0,1.2,10,40,'500 g',0,NULL,'Frutta e verdura in scatola',''),
 ('6',94,'NWTCFV-94','Piselli Northwind Traders',NULL,1.0,1.5,10,40,'500 g',0,NULL,'Frutta e verdura in scatola',''),
 ('7',95,'NWTCM-95','Tonno Northwind Traders',NULL,0.5,2.0,30,50,'150 g',0,NULL,'Carne e pesce in scatola',''),
 ('7',96,'NWTCM-96','Salmone affumicato Northwind Traders',NULL,2.0,4.0,30,50,'150 g',0,NULL,'Carne e pesce in scatola',''),
 ('1',97,'NWTC-82','Muesli Northwind Traders',NULL,3.0,5.0,50,200,NULL,0,NULL,'Cereali',''),
 ('6',98,'NWTSO-98','Minestrone Northwind Traders',NULL,1.0,1.89,100,200,NULL,0,NULL,'Minestre',''),
 ('6',99,'NWTSO-99','Ribollita Northwind Traders',NULL,1.0,1.95,100,200,NULL,0,NULL,'Minestre','');
INSERT INTO "Stato_dettagli_ordini" ("ID_stato","Nome_stato") VALUES (0,'Nessuno'),
 (1,'Assegnato'),
 (2,'Fatturato'),
 (3,'Spedito'),
 (4,'Ordinato'),
 (5,'Non in magazzino');
INSERT INTO "Stato_imposta_ordini" ("ID","Nome_stato_imposta") VALUES (0,'Esente da IVA'),
 (1,'Imponibile');
INSERT INTO "Stato_ordine_di_acquisto" ("ID_stato","Stato") VALUES (0,'Nuovo'),
 (1,'Inviato'),
 (2,'Approvato'),
 (3,'Chiuso');
INSERT INTO "Stato_ordini" ("ID_stato","Nome_stato") VALUES (0,'Nuovo'),
 (1,'Fatturato'),
 (2,'Spedito'),
 (3,'Chiuso');
INSERT INTO "Stringhe" ("ID_stringa","Dati_stringa") VALUES (2,'Northwind Traders'),
 (3,'Impossibile rimuovere i prodotti inseriti in inventario.'),
 (4,'Fornitura arretrata evasa per l''ordine n. |'),
 (5,'Il prezzo scontato è inferiore al costo.'),
 (6,'Disponibilità magazzino insufficiente.'),
 (7,'Disponibilità in magazzino insufficiente. Creare un ordine di acquisto?'),
 (8,'Creati ordini di acquisto per | prodotti'),
 (9,'Nessun prodotto sotto il livello di riordino'),
 (10,'È necessario specificare il nome del cliente.'),
 (11,'L''approvvigionamento genererà ordini di acquisto per tutti i prodotti sotto il livello scorte minime. Continuare?'),
 (12,'Impossibile creare l''ordine di acquisto. Nessun fornitore per il prodotto specificato.'),
 (13,'Il prezzo scontato è inferiore al costo.'),
 (14,'Continuare?'),
 (15,'Ordine già fatturato. Stampare la fattura?'),
 (16,'L''ordine non contiene voci'),
 (17,'Impossibile creare la fattura. Inventario non assegnato per tutti i prodotti specificati.'),
 (18,'Nessuna vendita nel periodo specificato'),
 (19,'Approvvigionamento prodotto eseguito.'),
 (21,'Approvvigionamento non necessario. Il prodotto è già al livello scorte desiderato.'),
 (22,'Approvvigionamento prodotto non riuscito.'),
 (23,'Accesso specificato non valido.'),
 (24,'Selezionare prima un report.'),
 (25,'Se si cambia il fornitore, verranno rimosse le voci d''acquisto. Continuare?'),
 (26,'Ordini di acquisto inviati correttamente per | prodotti. Visualizzare il report di approvvigionamento?'),
 (27,'Errore durante il tentativo di approvvigionamento per il ripristino dei livelli scorte.'),
 (28,'Approvvigionamento completato per | prodotti. Visualizzare il report di approvvigionamento?'),
 (29,'Impossibile rimuovere voci d''acquisto già inserite in inventario.'),
 (30,'Errore durante la rimozione di una o più voci d''acquisto'),
 (31,'Impossibile modificare la quantità di un prodotto acquistato già ricevuto o inserito in inventario.'),
 (32,'Impossibile modificare il prezzo di un prodotto acquistato già ricevuto o inserito in inventario.'),
 (33,'Prodotto inserito in inventario.'),
 (34,'Inserimento del prodotto in inventario non riuscito.'),
 (35,'Ci sono ordini arretrati con questo prodotto. Evaderli adesso?'),
 (36,'Impossibile inserire un prodotto in inventario senza specificare la data di ricezione.'),
 (37,'Inserire il prodotto ricevuto in inventario?'),
 (38,'Inizializzare acquisti, ordini e dati di inventario?'),
 (39,'Specificare prima il nome del dipendente.'),
 (40,'Per approvare l''acquisto, l''utente specificato deve avere eseguito l''accesso.'),
 (41,'L''ordine di acquisto può essere approvato solo se contiene voci completate'),
 (42,'Non si dispone dell''autorizzazione per l''approvazione degli acquisti.'),
 (43,'Acquisto approvato'),
 (44,'Impossibile approvare l''acquisto'),
 (45,'Acquisto sottoposto ad approvazione'),
 (46,'Impossibile sottoporre l''acquisto ad approvazione'),
 (47,'L''ordine di acquisto non contiene voci'),
 (48,'Annullare l''ordine?'),
 (49,'L''annullamento di un ordine ne comporta l''eliminazione definitiva. Continuare?'),
 (100,'Ordine annullato.'),
 (101,'Impossibile annullare un ordine con articoli ricevuti e inseriti in inventario.'),
 (102,'Errore durante il tentativo di annullare l''ordine.'),
 (103,'Ordine non ancora fatturato.'),
 (104,'Informazioni di spedizione incomplete. Specificare tutte le informazioni per la spedizione e riprovare.'),
 (105,'Impossibile contrassegnare come spedito un ordine non ancora fatturato.'),
 (106,'Impossibile annullare un ordine già spedito.'),
 (107,'Specificare un venditore'),
 (108,'Ordine contrassegnato come chiuso.'),
 (109,'Prima di chiudere un ordine, è necessario contrassegnarlo come spedito.'),
 (110,'È necessario specificare prima le informazioni di pagamento.'),
 (111,'Errore durante il tentativo di approvvigionamento per il ripristino dei livelli scorte. Approvvigionamento completato per | prodotti.'),
 (112,'Applicare un costo unitario.'),
 (113,'Evasione fornitura arretrata, ordine n. |'),
 (114,'Acquisto generato in base all''ordine n. |');
INSERT INTO "Tipi_di_operazioni_di_magazzino" ("ID","Nome_tipo") VALUES (1,'Acquistato'),
 (2,'Venduto'),
 (3,'In sospeso'),
 (4,'Scarto');
DROP INDEX IF EXISTS "City";
CREATE INDEX IF NOT EXISTS "City" ON "Clienti" (
	"Città"
);
DROP INDEX IF EXISTS "Company";
CREATE INDEX IF NOT EXISTS "Company" ON "Clienti" (
	"Società"
);
DROP INDEX IF EXISTS "First_Name";
CREATE INDEX IF NOT EXISTS "First_Name" ON "Clienti" (
	"Nome"
);
DROP INDEX IF EXISTS "Last_Name";
CREATE INDEX IF NOT EXISTS "Last_Name" ON "Clienti" (
	"Cognome"
);
DROP INDEX IF EXISTS "Postal_Code";
CREATE INDEX IF NOT EXISTS "Postal_Code" ON "Clienti" (
	"CAP"
);
DROP INDEX IF EXISTS "State_Province";
CREATE INDEX IF NOT EXISTS "State_Province" ON "Clienti" (
	"Stato_Provincia"
);
DROP INDEX IF EXISTS "Inventory_ID";
CREATE INDEX IF NOT EXISTS "Inventory_ID" ON "Dettagli_ordini_di_acquisto" (
	"ID_inventario"
);
DROP INDEX IF EXISTS "InventoryTransactionsOnPurchaseOrders";
CREATE INDEX IF NOT EXISTS "InventoryTransactionsOnPurchaseOrders" ON "Dettagli_ordini_di_acquisto" (
	"ID_inventario"
);
DROP INDEX IF EXISTS "New_InventoryTransactionsOnPurchaseOrders";
CREATE INDEX IF NOT EXISTS "New_InventoryTransactionsOnPurchaseOrders" ON "Dettagli_ordini_di_acquisto" (
	"ID_inventario"
);
DROP INDEX IF EXISTS "New_ProductOnPurchaseOrderDetails";
CREATE INDEX IF NOT EXISTS "New_ProductOnPurchaseOrderDetails" ON "Dettagli_ordini_di_acquisto" (
	"ID_prodotto"
);
DROP INDEX IF EXISTS "New_PurchaseOrderDeatilsOnPurchaseOrder";
CREATE INDEX IF NOT EXISTS "New_PurchaseOrderDeatilsOnPurchaseOrder" ON "Dettagli_ordini_di_acquisto" (
	"ID_ordine_acquisto"
);
DROP INDEX IF EXISTS "OrderID";
CREATE INDEX IF NOT EXISTS "OrderID" ON "Dettagli_ordini_di_acquisto" (
	"ID_ordine_acquisto"
);
DROP INDEX IF EXISTS "ProductID";
CREATE INDEX IF NOT EXISTS "ProductID" ON "Dettagli_ordini_di_acquisto" (
	"ID_prodotto"
);
DROP INDEX IF EXISTS "ProductOnPurchaseOrderDetails";
CREATE INDEX IF NOT EXISTS "ProductOnPurchaseOrderDetails" ON "Dettagli_ordini_di_acquisto" (
	"ID_prodotto"
);
DROP INDEX IF EXISTS "PurchaseOrderDeatilsOnPurchaseOrder";
CREATE INDEX IF NOT EXISTS "PurchaseOrderDeatilsOnPurchaseOrder" ON "Dettagli_ordini_di_acquisto" (
	"ID_ordine_acquisto"
);
DROP INDEX IF EXISTS "New_OrderInvoice";
CREATE INDEX IF NOT EXISTS "New_OrderInvoice" ON "Fatture" (
	"ID_ordine"
);
DROP INDEX IF EXISTS "Order_ID";
CREATE INDEX IF NOT EXISTS "Order_ID" ON "Fatture" (
	"ID_ordine"
);
DROP INDEX IF EXISTS "OrderInvoice";
CREATE INDEX IF NOT EXISTS "OrderInvoice" ON "Fatture" (
	"ID_ordine"
);
DROP INDEX IF EXISTS "Customer_Order_ID";
CREATE INDEX IF NOT EXISTS "Customer_Order_ID" ON "Operazioni_di_magazzino" (
	"ID_ordine_cliente"
);
DROP INDEX IF EXISTS "New_OrdersOnInventoryTransactions";
CREATE INDEX IF NOT EXISTS "New_OrdersOnInventoryTransactions" ON "Operazioni_di_magazzino" (
	"ID_ordine_cliente"
);
DROP INDEX IF EXISTS "New_ProductOnInventoryTransaction";
CREATE INDEX IF NOT EXISTS "New_ProductOnInventoryTransaction" ON "Operazioni_di_magazzino" (
	"ID_prodotto"
);
DROP INDEX IF EXISTS "New_PuchaseOrdersonInventoryTransactions";
CREATE INDEX IF NOT EXISTS "New_PuchaseOrdersonInventoryTransactions" ON "Operazioni_di_magazzino" (
	"ID_ordine_acquisto"
);
DROP INDEX IF EXISTS "New_TransactionTypesOnInventoryTransactiosn";
CREATE INDEX IF NOT EXISTS "New_TransactionTypesOnInventoryTransactiosn" ON "Operazioni_di_magazzino" (
	"Tipo_transazione"
);
DROP INDEX IF EXISTS "OrdersOnInventoryTransactions";
CREATE INDEX IF NOT EXISTS "OrdersOnInventoryTransactions" ON "Operazioni_di_magazzino" (
	"ID_ordine_cliente"
);
DROP INDEX IF EXISTS "Product_ID";
CREATE INDEX IF NOT EXISTS "Product_ID" ON "Operazioni_di_magazzino" (
	"ID_prodotto"
);
DROP INDEX IF EXISTS "ProductOnInventoryTransaction";
CREATE INDEX IF NOT EXISTS "ProductOnInventoryTransaction" ON "Operazioni_di_magazzino" (
	"ID_prodotto"
);
DROP INDEX IF EXISTS "PuchaseOrdersonInventoryTransactions";
CREATE INDEX IF NOT EXISTS "PuchaseOrdersonInventoryTransactions" ON "Operazioni_di_magazzino" (
	"ID_ordine_acquisto"
);
DROP INDEX IF EXISTS "Purchase_Order_ID";
CREATE INDEX IF NOT EXISTS "Purchase_Order_ID" ON "Operazioni_di_magazzino" (
	"ID_ordine_acquisto"
);
DROP INDEX IF EXISTS "TransactionTypesOnInventoryTransactiosn";
CREATE INDEX IF NOT EXISTS "TransactionTypesOnInventoryTransactiosn" ON "Operazioni_di_magazzino" (
	"Tipo_transazione"
);
DROP INDEX IF EXISTS "EmployeesOnPurchaseOrder";
CREATE INDEX IF NOT EXISTS "EmployeesOnPurchaseOrder" ON "Ordini_di_acquisto" (
	"Creato_da"
);
DROP INDEX IF EXISTS "New_EmployeesOnPurchaseOrder";
CREATE INDEX IF NOT EXISTS "New_EmployeesOnPurchaseOrder" ON "Ordini_di_acquisto" (
	"Creato_da"
);
DROP INDEX IF EXISTS "New_PurchaseOrderStatusLookup";
CREATE INDEX IF NOT EXISTS "New_PurchaseOrderStatusLookup" ON "Ordini_di_acquisto" (
	"ID_stato"
);
DROP INDEX IF EXISTS "New_SuppliersOnPurchaseOrder";
CREATE INDEX IF NOT EXISTS "New_SuppliersOnPurchaseOrder" ON "Ordini_di_acquisto" (
	"ID_fornitore"
);
DROP INDEX IF EXISTS "PurchaseOrderStatusLookup";
CREATE INDEX IF NOT EXISTS "PurchaseOrderStatusLookup" ON "Ordini_di_acquisto" (
	"ID_stato"
);
DROP INDEX IF EXISTS "Status_ID";
CREATE INDEX IF NOT EXISTS "Status_ID" ON "Ordini_di_acquisto" (
	"ID_stato"
);
DROP INDEX IF EXISTS "SupplierID";
CREATE INDEX IF NOT EXISTS "SupplierID" ON "Ordini_di_acquisto" (
	"ID_fornitore"
);
DROP INDEX IF EXISTS "SuppliersOnPurchaseOrder";
CREATE INDEX IF NOT EXISTS "SuppliersOnPurchaseOrder" ON "Ordini_di_acquisto" (
	"ID_fornitore"
);
DROP INDEX IF EXISTS "EmployeePriviligesforEmployees";
CREATE INDEX IF NOT EXISTS "EmployeePriviligesforEmployees" ON "Privilegi_dipendente" (
	"ID_dipendente"
);
DROP INDEX IF EXISTS "EmployeePriviligesLookup";
CREATE INDEX IF NOT EXISTS "EmployeePriviligesLookup" ON "Privilegi_dipendente" (
	"ID_privilegio"
);
DROP INDEX IF EXISTS "New_EmployeePriviligesforEmployees";
CREATE INDEX IF NOT EXISTS "New_EmployeePriviligesforEmployees" ON "Privilegi_dipendente" (
	"ID_dipendente"
);
DROP INDEX IF EXISTS "New_EmployeePriviligesLookup";
CREATE INDEX IF NOT EXISTS "New_EmployeePriviligesLookup" ON "Privilegi_dipendente" (
	"ID_privilegio"
);
DROP INDEX IF EXISTS "Privilege_ID";
CREATE INDEX IF NOT EXISTS "Privilege_ID" ON "Privilegi_dipendente" (
	"ID_privilegio"
);
COMMIT;
