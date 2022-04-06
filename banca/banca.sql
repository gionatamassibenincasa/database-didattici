/* begin table creation */

create table settore
 (settore_id integer not null,
  nome varchar(20) not null,
  constraint pk_settore primary key (settore_id)
 );

create table filiale
 (filiale_id integer not null,
  nome varchar(20) not null,
  indirizzo varchar(30),
  citta varchar(20),
  stato varchar(2),
  cap varchar(12),
  constraint pk_filiale primary key (filiale_id)
 );

create table dipendente
 (dipendente_id integer not null,
  nome varchar(20) not null,
  cognome varchar(20) not null,
  data_assunzione date not null,
  data_fine_rapporto date,
  superiore_id integer,
  settore_id integer,
  titolo varchar(20),
  filiale_id integer,
  constraint fk_e_dipendente_id 
    foreign key (superiore_id) references dipendente (dipendente_id),
  constraint fk_settore_id
    foreign key (settore_id) references settore (settore_id),
  constraint fk_dip_filiale_id
    foreign key (filiale_id) references filiale (filiale_id),
  constraint pk_dipendente primary key (dipendente_id)
 );

create table tipo_prodotto
 (tipo_prodotto_cd varchar(10) not null,
  nome varchar(50) not null,
  constraint pk_tipo_prodotto primary key (tipo_prodotto_cd)
 );

create table prodotto
 (prodotto_cd varchar(10) not null,
  nome varchar(50) not null,
  tipo_prodotto_cd varchar(10) not null,
  data_proposta date,
  data_cessazione date,
  constraint fk_tipo_prodotto_cd foreign key (tipo_prodotto_cd) 
    references tipo_prodotto (tipo_prodotto_cd),
  constraint pk_prodotto primary key (prodotto_cd)
 );

create table cliente
 (cliente_id integer not null,
  codice_fiscale varchar(12) not null,
  tipo_cliente TEXT not null CHECK(tipo_cliente = 'P' OR tipo_cliente = 'S'),
  -- P -> cliente privato, S -> società
  indirizzo varchar(30),
  citta varchar(20),
  stato varchar(20),
  codice_postale varchar(10),
  constraint pk_cliente primary key (cliente_id)
 );

create table privato -- persona fisica senza partita IVA
 (cliente_id integer not null,
  nome varchar(30) not null,
  cognome varchar(30) not null,
  data_nascita date,
  constraint fk_i_cliente_id foreign key (cliente_id)
    references cliente (cliente_id),
  constraint pk_privato primary key (cliente_id)
 );

create table societa
 (cliente_id integer not null,
  nome varchar(40) not null,
  stato_id varchar(10) not null,
  data_costituzione date,
  constraint fk_b_cliente_id foreign key (cliente_id)
    references cliente (cliente_id),
  constraint pk_societa primary key (cliente_id)
 );

create table funzionario
 (funzionario_id integer not null,
  cliente_id integer not null,
  nome varchar(30) not null,
  cognome varchar(30) not null,
  titolo varchar(20),
  data_assunzione date not null,
  data_fine_rapporto date,
  constraint fk_o_cliente_id foreign key (cliente_id)
    references societa (cliente_id),
  constraint pk_funzionario primary key (funzionario_id)
 );

create table conto
 (conto_id integer not null,
  prodotto_cd varchar(10) not null,
  cliente_id integer not null,
  data_apertura date not null,
  data_chiusura date,
  data_ultima_attivita date,
  stato TEXT CHECK (stato IN ('ATTIVO','CHIUSO','BLOCCO')),
  filiale_apertura_id integer,
  dipedente_apertura_id integer,
  saldo_disponibile float(10,2),
  saldo_contabile float(10,2),
  constraint fk_prodotto_cd foreign key (prodotto_cd)
    references prodotto (prodotto_cd),
  constraint fk_a_cliente_id foreign key (cliente_id)
    references cliente (cliente_id),
  constraint fk_a_filiale_id foreign key (filiale_apertura_id)
    references filiale (filiale_id),
  constraint fk_a_dipendente_id foreign key (dipedente_apertura_id)
    references dipendente (dipendente_id),
  constraint pk_conto primary key (conto_id)
 );

create table movimento
 (movimento_id integer not null,
  data_movimento datetime not null,
  conto_id integer not null,
  tipo_movimento_cd TEXT CHECK( tipo_movimento_cd IN ('DEBITO','CREDITO')),
  importo real not null,
  cassiere_dipendente_id integer,
  filiare_esecuzione_id integer,
  data_disponibilita datetime,
  constraint fk_t_conto_id foreign key (conto_id)
    references conto (conto_id),
  constraint fk_cassiere_dipendente_id foreign key (cassiere_dipendente_id)
    references dipendente (dipendente_id),
  constraint fk_exec_filiale_id foreign key (filiare_esecuzione_id)
    references filiale (filiale_id),
  constraint pk_transaction primary key (movimento_id)
 );

/* end table creation */

/* begin data population */

/* settore data */
insert into settore (settore_id, nome)
values (null, 'Operazioni');
insert into settore (settore_id, nome)
values (null, 'Prestiti');
insert into settore (settore_id, nome)
values (null, 'Amministrazione');

/* filiale data */
insert into filiale (filiale_id, nome, indirizzo, citta, stato, cap)
values (null, 'Sede principale', '3882 Main St.', 'Waltham', 'MA', '02451');
insert into filiale (filiale_id, nome, indirizzo, citta, stato, cap)
values (null, 'Filiale Woburn', '422 Maple St.', 'Woburn', 'MA', '01801');
insert into filiale (filiale_id, nome, indirizzo, citta, stato, cap)
values (null, 'Filiale Quincy', '125 Presidenteial Way', 'Quincy', 'MA', '02169');
insert into filiale (filiale_id, nome, indirizzo, citta, stato, cap)
values (null, 'Filiale So. NH', '378 Maynard Ln.', 'Salem', 'NH', '03079');

/* dipendente data */
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Michael', 'Smith', '2001-06-22', 
  (select settore_id from settore where nome = 'Administration'), 
  'Presidente', 
  (select filiale_id from filiale where nome = 'Headquarters'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Susan', 'Barker', '2002-09-12', 
  (select settore_id from settore where nome = 'Administration'), 
  'Vice Presidente', 
  (select filiale_id from filiale where nome = 'Headquarters'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Robert', 'Tyler', '2000-02-09',
  (select settore_id from settore where nome = 'Administration'), 
  'Tesoriere', 
  (select filiale_id from filiale where nome = 'Headquarters'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Susan', 'Hawthorne', '2002-04-24', 
  (select settore_id from settore where nome = 'Operations'), 
  'Direttore', 
  (select filiale_id from filiale where nome = 'Headquarters'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'John', 'Gooding', '2003-11-14', 
  (select settore_id from settore where nome = 'Loans'), 
  'Responsabile dei prestiti', 
  (select filiale_id from filiale where nome = 'Headquarters'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Helen', 'Fleming', '2004-03-17', 
  (select settore_id from settore where nome = 'Operations'), 
  'Capo cassiere', 
  (select filiale_id from filiale where nome = 'Headquarters'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Chris', 'Tucker', '2004-09-15', 
  (select settore_id from settore where nome = 'Operations'), 
  'Operatore di sportello', 
  (select filiale_id from filiale where nome = 'Headquarters'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Sarah', 'Parker', '2002-12-02', 
  (select settore_id from settore where nome = 'Operations'), 
  'Operatore di sportello', 
  (select filiale_id from filiale where nome = 'Headquarters'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Jane', 'Grossman', '2002-05-03', 
  (select settore_id from settore where nome = 'Operations'), 
  'Operatore di sportello', 
  (select filiale_id from filiale where nome = 'Headquarters'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Paula', 'Roberts', '2002-07-27', 
  (select settore_id from settore where nome = 'Operations'), 
  'Capo cassiere', 
  (select filiale_id from filiale where nome = 'Woburn filiale'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Thomas', 'Ziegler', '2000-10-23', 
  (select settore_id from settore where nome = 'Operations'), 
  'Operatore di sportello', 
  (select filiale_id from filiale where nome = 'Woburn filiale'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Samantha', 'Jameson', '2003-01-08', 
  (select settore_id from settore where nome = 'Operations'), 
  'Operatore di sportello', 
  (select filiale_id from filiale where nome = 'Woburn filiale'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'John', 'Blake', '2000-05-11', 
  (select settore_id from settore where nome = 'Operations'), 
  'Capo cassiere', 
  (select filiale_id from filiale where nome = 'Quincy filiale'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Cindy', 'Mason', '2002-08-09', 
  (select settore_id from settore where nome = 'Operations'), 
  'Operatore di sportello', 
  (select filiale_id from filiale where nome = 'Quincy filiale'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Frank', 'Portman', '2003-04-01', 
  (select settore_id from settore where nome = 'Operations'), 
  'Operatore di sportello', 
  (select filiale_id from filiale where nome = 'Quincy filiale'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Theresa', 'Markham', '2001-03-15', 
  (select settore_id from settore where nome = 'Operations'), 
  'Capo cassiere', 
  (select filiale_id from filiale where nome = 'So. NH filiale'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Beth', 'Fowler', '2002-06-29', 
  (select settore_id from settore where nome = 'Operations'), 
  'Operatore di sportello', 
  (select filiale_id from filiale where nome = 'So. NH filiale'));
insert into dipendente (dipendente_id, nome, cognome, data_assunzione, 
  settore_id, titolo, filiale_id)
values (null, 'Rick', 'Tulman', '2002-12-12', 
  (select settore_id from settore where nome = 'Operations'), 
  'Operatore di sportello', 
  (select filiale_id from filiale where nome = 'So. NH filiale'));

/* create data for self-referencing foreign key 'superiore_id' */
create temporary table emp_tmp as
select dipendente_id, nome, cognome from dipendente;

update dipendente set superiore_id =
 (select dipendente_id from emp_tmp where cognome = 'Smith' and nome = 'Michael')
where ((cognome = 'Barker' and nome = 'Susan')
  or (cognome = 'Tyler' and nome = 'Robert'));
update dipendente set superiore_id =
 (select dipendente_id from emp_tmp where cognome = 'Tyler' and nome = 'Robert')
where cognome = 'Hawthorne' and nome = 'Susan';
update dipendente set superiore_id =
 (select dipendente_id from emp_tmp where cognome = 'Hawthorne' and nome = 'Susan')
where ((cognome = 'Gooding' and nome = 'John')
  or (cognome = 'Fleming' and nome = 'Helen')
  or (cognome = 'Roberts' and nome = 'Paula') 
  or (cognome = 'Blake' and nome = 'John') 
  or (cognome = 'Markham' and nome = 'Theresa')); 
update dipendente set superiore_id =
 (select dipendente_id from emp_tmp where cognome = 'Fleming' and nome = 'Helen')
where ((cognome = 'Tucker' and nome = 'Chris') 
  or (cognome = 'Parker' and nome = 'Sarah') 
  or (cognome = 'Grossman' and nome = 'Jane'));  
update dipendente set superiore_id =
 (select dipendente_id from emp_tmp where cognome = 'Roberts' and nome = 'Paula')
where ((cognome = 'Ziegler' and nome = 'Thomas')  
  or (cognome = 'Jameson' and nome = 'Samantha'));   
update dipendente set superiore_id =
 (select dipendente_id from emp_tmp where cognome = 'Blake' and nome = 'John')
where ((cognome = 'Mason' and nome = 'Cindy')   
  or (cognome = 'Portman' and nome = 'Frank'));    
update dipendente set superiore_id =
 (select dipendente_id from emp_tmp where cognome = 'Markham' and nome = 'Theresa')
where ((cognome = 'Fowler' and nome = 'Beth')   
  or (cognome = 'Tulman' and nome = 'Rick'));    

drop table emp_tmp;

/* prodotto type data */
insert into tipo_prodotto (tipo_prodotto_cd, nome)
values ('CONTO','Conto corrente');
insert into tipo_prodotto (tipo_prodotto_cd, nome)
values ('PRESTITO','Prestiti a privati e società');
insert into tipo_prodotto (tipo_prodotto_cd, nome)
values ('ASSICURAZIONE','Offerte assicurative');

/* prodotto data */
insert into prodotto (prodotto_cd, nome, tipo_prodotto_cd, data_proposta)
values ('CC','conto corrente','CONTO','2000-01-01');
insert into prodotto (prodotto_cd, nome, tipo_prodotto_cd, data_proposta)
values ('CD','conto deposito','CONTO','2000-01-01');
insert into prodotto (prodotto_cd, nome, tipo_prodotto_cd, data_proposta)
values ('MM','conto mercato monetario','CONTO','2000-01-01');
insert into prodotto (prodotto_cd, nome, tipo_prodotto_cd, data_proposta)
values ('CERTDEP','certificato di deposito','CONTO','2000-01-01');
insert into prodotto (prodotto_cd, nome, tipo_prodotto_cd, data_proposta)
values ('MTC','mutuo casa','PRESTITO','2000-01-01');
insert into prodotto (prodotto_cd, nome, tipo_prodotto_cd, data_proposta)
values ('AUT','prestiti per autoveicoli','PRESTITO','2000-01-01');
insert into prodotto (prodotto_cd, nome, tipo_prodotto_cd, data_proposta)
values ('BUS','linee di credito per società','PRESTITO','2000-01-01');
insert into prodotto (prodotto_cd, nome, tipo_prodotto_cd, data_proposta)
values ('PPMI','prestito per piccole imprese','PRESTITO','2000-01-01');

/* residential cliente data */
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '111-11-1111', 'P', '47 Mockingbird Ln', 'Lynnfield', 'MA', '01940');
insert into privato (cliente_id, nome, cognome, data_nascita)
select cliente_id, 'James', 'Hadley', '1972-04-22' from cliente
where codice_fiscale = '111-11-1111';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '222-22-2222', 'P', '372 Clearwater Blvd', 'Woburn', 'MA', '01801');
insert into privato (cliente_id, nome, cognome, data_nascita)
select cliente_id, 'Susan', 'Tingley', '1968-08-15' from cliente
where codice_fiscale = '222-22-2222';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '333-33-3333', 'P', '18 Jessup Rd', 'Quincy', 'MA', '02169');
insert into privato (cliente_id, nome, cognome, data_nascita)
select cliente_id, 'Frank', 'Tucker', '1958-02-06' from cliente
where codice_fiscale = '333-33-3333';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '444-44-4444', 'P', '12 Buchanan Ln', 'Waltham', 'MA', '02451');
insert into privato (cliente_id, nome, cognome, data_nascita)
select cliente_id, 'John', 'Hayward', '1966-12-22' from cliente
where codice_fiscale = '444-44-4444';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '555-55-5555', 'P', '2341 Main St', 'Salem', 'NH', '03079');
insert into privato (cliente_id, nome, cognome, data_nascita)
select cliente_id, 'Charles', 'Frasier', '1971-08-25' from cliente
where codice_fiscale = '555-55-5555';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '666-66-6666', 'P', '12 Blaylock Ln', 'Waltham', 'MA', '02451');
insert into privato (cliente_id, nome, cognome, data_nascita)
select cliente_id, 'John', 'Spencer', '1962-09-14' from cliente
where codice_fiscale = '666-66-6666';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '777-77-7777', 'P', '29 Admiral Ln', 'Wilmington', 'MA', '01887');
insert into privato (cliente_id, nome, cognome, data_nascita)
select cliente_id, 'Margaret', 'Young', '1947-03-19' from cliente
where codice_fiscale = '777-77-7777';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '888-88-8888', 'P', '472 Freedom Rd', 'Salem', 'NH', '03079');
insert into privato (cliente_id, nome, cognome, data_nascita)
select cliente_id, 'Louis', 'Blake', '1977-07-01' from cliente
where codice_fiscale = '888-88-8888';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '999-99-9999', 'P', '29 Maple St', 'Newton', 'MA', '02458');
insert into privato (cliente_id, nome, cognome, data_nascita)
select cliente_id, 'Richard', 'Farley', '1968-06-16' from cliente
where codice_fiscale = '999-99-9999';

/* corporate cliente data */
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '04-1111111', 'S', '7 Industrial Way', 'Salem', 'NH', '03079');
insert into societa (cliente_id, nome, stato_id, data_costituzione)
select cliente_id, 'Chilton Engineering', '12-345-678', '1995-05-01' from cliente
where codice_fiscale = '04-1111111';
insert into funzionario (funzionario_id, cliente_id, nome, cognome,
  titolo, data_assunzione)
select null, cliente_id, 'John', 'Chilton', 'Presidente', '1995-05-01'
from cliente
where codice_fiscale = '04-1111111';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '04-2222222', 'S', '287A Corporate Ave', 'Wilmington', 'MA', '01887');
insert into societa (cliente_id, nome, stato_id, data_costituzione)
select cliente_id, 'Northeast Cooling Inc.', '23-456-789', '2001-01-01' from cliente
where codice_fiscale = '04-2222222';
insert into funzionario (funzionario_id, cliente_id, nome, cognome,
  titolo, data_assunzione)
select null, cliente_id, 'Paul', 'Hardy', 'Presidente', '2001-01-01'
from cliente
where codice_fiscale = '04-2222222';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '04-3333333', 'S', '789 Main St', 'Salem', 'NH', '03079');
insert into societa (cliente_id, nome, stato_id, data_costituzione)
select cliente_id, 'Superior Auto Body', '34-567-890', '2002-06-30' from cliente
where codice_fiscale = '04-3333333';
insert into funzionario (funzionario_id, cliente_id, nome, cognome,
  titolo, data_assunzione)
select null, cliente_id, 'Carl', 'Lutz', 'Presidente', '2002-06-30'
from cliente
where codice_fiscale = '04-3333333';
insert into cliente (cliente_id, codice_fiscale, tipo_cliente,
  indirizzo, citta, stato, codice_postale)
values (null, '04-4444444', 'S', '4772 Presidenteial Way', 'Quincy', 'MA', '02169');
insert into societa (cliente_id, nome, stato_id, data_costituzione)
select cliente_id, 'AAA Insurance Inc.', '45-678-901', '1999-05-01' from cliente
where codice_fiscale = '04-4444444';
insert into funzionario (funzionario_id, cliente_id, nome, cognome,
  titolo, data_assunzione)
select null, cliente_id, 'Stanley', 'Cheswick', 'Presidente', '1999-05-01'
from cliente
where codice_fiscale = '04-4444444';

/* residential conto data */
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Woburn' limit 1) e
  cross join
 (select 'CC' prod_cd, '2000-01-15' data_apertura, '2005-01-04' last_date,
    1057.75 avail, 1057.75 pend union all
  select 'CD' prod_cd, '2000-01-15' data_apertura, '2004-12-19' last_date,
    500.00 avail, 500.00 pend union all
  select 'CERTDEP' prod_cd, '2004-06-30' data_apertura, '2004-06-30' last_date,
    3000.00 avail, 3000.00 pend) a
where c.codice_fiscale = '111-11-1111';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Woburn' limit 1) e
  cross join
 (select 'CC' prod_cd, '2001-03-12' data_apertura, '2004-12-27' last_date,
    2258.02 avail, 2258.02 pend union all
  select 'CD' prod_cd, '2001-03-12' data_apertura, '2004-12-11' last_date,
    200.00 avail, 200.00 pend) a
where c.codice_fiscale = '222-22-2222';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Quincy' limit 1) e
  cross join
 (select 'CC' prod_cd, '2002-11-23' data_apertura, '2004-11-30' last_date,
    1057.75 avail, 1057.75 pend union all
  select 'MM' prod_cd, '2002-12-15' data_apertura, '2004-12-05' last_date,
    2212.50 avail, 2212.50 pend) a
where c.codice_fiscale = '333-33-3333';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Waltham' limit 1) e
  cross join
 (select 'CC' prod_cd, '2003-09-12' data_apertura, '2005-01-03' last_date,
    534.12 avail, 534.12 pend union all
  select 'CD' prod_cd, '2000-01-15' data_apertura, '2004-10-24' last_date,
    767.77 avail, 767.77 pend union all
  select 'MM' prod_cd, '2004-09-30' data_apertura, '2004-11-11' last_date,
    5487.09 avail, 5487.09 pend) a
where c.codice_fiscale = '444-44-4444';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Salem' limit 1) e
  cross join
 (select 'CC' prod_cd, '2004-01-27' data_apertura, '2005-01-05' last_date,
    2237.97 avail, 2897.97 pend) a
where c.codice_fiscale = '555-55-5555';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Waltham' limit 1) e
  cross join
 (select 'CC' prod_cd, '2002-08-24' data_apertura, '2004-11-29' last_date,
    122.37 avail, 122.37 pend union all
  select 'CERTDEP' prod_cd, '2004-12-28' data_apertura, '2004-12-28' last_date,
    10000.00 avail, 10000.00 pend) a
where c.codice_fiscale = '666-66-6666';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Woburn' limit 1) e
  cross join
 (select 'CERTDEP' prod_cd, '2004-01-12' data_apertura, '2004-01-12' last_date,
    5000.00 avail, 5000.00 pend) a
where c.codice_fiscale = '777-77-7777';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Salem' limit 1) e
  cross join
 (select 'CC' prod_cd, '2001-05-23' data_apertura, '2005-01-03' last_date,
    3487.19 avail, 3487.19 pend union all
  select 'CD' prod_cd, '2001-05-23' data_apertura, '2004-10-12' last_date,
    387.99 avail, 387.99 pend) a
where c.codice_fiscale = '888-88-8888';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Waltham' limit 1) e
  cross join
 (select 'CC' prod_cd, '2003-07-30' data_apertura, '2004-12-15' last_date,
    125.67 avail, 125.67 pend union all
  select 'MM' prod_cd, '2004-10-28' data_apertura, '2004-10-28' last_date,
    9345.55 avail, 9845.55 pend union all
  select 'CERTDEP' prod_cd, '2004-06-30' data_apertura, '2004-06-30' last_date,
    1500.00 avail, 1500.00 pend) a
where c.codice_fiscale = '999-99-9999';

/* corporate conto data */
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Salem' limit 1) e
  cross join
 (select 'CC' prod_cd, '2002-09-30' data_apertura, '2004-12-15' last_date,
    23575.12 avail, 23575.12 pend union all
  select 'BUS' prod_cd, '2002-10-01' data_apertura, '2004-08-28' last_date,
    0 avail, 0 pend) a
where c.codice_fiscale = '04-1111111';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Woburn' limit 1) e
  cross join
 (select 'BUS' prod_cd, '2004-03-22' data_apertura, '2004-11-14' last_date,
    9345.55 avail, 9345.55 pend) a
where c.codice_fiscale = '04-2222222';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Salem' limit 1) e
  cross join
 (select 'CC' prod_cd, '2003-07-30' data_apertura, '2004-12-15' last_date,
    38552.05 avail, 38552.05 pend) a
where c.codice_fiscale = '04-3333333';
insert into conto (conto_id, prodotto_cd, cliente_id, data_apertura,
  data_ultima_attivita, stato, filiale_apertura_id,
  dipedente_apertura_id, saldo_disponibile, saldo_contabile)
select null, a.prod_cd, c.cliente_id, a.data_apertura, a.last_date, 'ATTIVO',
  e.filiale_id, e.dipendente_id, a.avail, a.pend
from cliente c cross join 
 (select b.filiale_id, e.dipendente_id 
  from filiale b inner join dipendente e on e.filiale_id = b.filiale_id
  where b.citta = 'Quincy' limit 1) e
  cross join
 (select 'PPMI' prod_cd, '2004-02-22' data_apertura, '2004-12-17' last_date,
    50000.00 avail, 50000.00 pend) a
where c.codice_fiscale = '04-4444444';

/* put $100 in all checking/conto depositos on date conto opened */
insert into movimento (movimento_id, data_movimento, conto_id, tipo_movimento_cd,
  importo, data_disponibilita)
select null, a.data_apertura, a.conto_id, 'CREDITO', 100, a.data_apertura
from conto a
where a.prodotto_cd IN ('CC','CD','CERTDEP','MM');

/* end data population */
