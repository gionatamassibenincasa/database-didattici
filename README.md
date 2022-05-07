# database-didattici
Database per uso didattico in lingua italiana

## Scopo

Fornire database didattici in formato SQLite per la didattica del linguaggio SQL
agli studenti di lingua italiana.

## Rationale

1. *Lingua italiana*: sebbene in Italia sia imposto il CLIL, la proposta di materiale
in una lingua diversa da quella madre, in particolare quando usata in un contesto
lontano da quello dello studente, confonde lo studente.
La barriera linguistica deve essere superata usando basi di dati con termini in
italiano.

2. *Complessità non banale*: la base di dati deve avere una complessità non banale
che consenta di realizzare query con join tra almeno 3 tabelle e query complesse.

3. *Quantità di dati elevata*: nella base di dati devono esserci un numero elevato di
dati.

## Cosa fare

### Scelta del DBMS

Installare un DBMS non sempre è semplice e soluzioni centralizzate si scontrano
con le politiche del firewall.
I programmi della Microsoft sono a pagamento.

L'idea è quella di usare basi di dati su file nel formato SQLite.
Questi file possono essere gestiti anche dal browser, con opportune estensioni,
o con strumenti grafici come `DB Browser for SQLite` che sono liberi e che si
possono installare senza essere superutente.

### Tradurre basi di dati già disponibili in lingua inglese

C'è dispobinilità di basi di dati di esempio in inglese.
Alcune sono state create per database specifici della Microsoft o di MySQL,
altre per l'illustrazione del linguaggio SQL ad opera di libri e manuali,
altre ancora a scopi didattici.

* Sakila
* Northwind
* Chinook

## Cosa tradurre

### Oggetti dello schema

Di certo vanno tradotti i nomi delle tabelle, delle colonne, degli indici, dei trigger,
delle viste ed, eventualmente, delle stored procedure.

Tali nomi possono essere estratti facilmente dal catalogo della base di dati!

Ad esempio, limitandosi ai nomi di tabelle e viste, in SQLite:

```sql
SELECT name FROM sqlite_schema
WHERE type IN ('table', 'view')
ORDER BY type, substr(name, 1, 1), length(name) DESC;
```

Per ogni oggetto estratto sopra vanno estratti i nomi delle colonne:

```sql
SELECT identificatore
FROM
(SELECT DISTINCT m.name AS identificatore
  FROM sqlite_schema AS m
 WHERE m.type IN ('table', 'view')
UNION
SELECT DISTINCT tbl_name AS identificatore
  FROM sqlite_schema AS catalogo,
  pragma_table_info(catalogo.name) AS colonne
 WHERE catalogo.type IN ('table', 'view')
)
ORDER BY substr(identificatore, 1, 1), length(identificatore) DESC;
``` 

### Traduzione

Estraggo tutti i nomi, ordinati per lettera iniziale e lunghezza, dalla parola più
lunga a quella più corta.

Con `sed` traduco i termini nell'ordine definito.
