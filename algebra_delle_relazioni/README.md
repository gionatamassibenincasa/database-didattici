<!--
author:   Gionata Massi

email:    gionata.massi@savoiabenincasa.it

version:  0.0.1

language: it

narrator: IT Italian Male

comment:  Un corso in 10 incontri per scoprire, in modo pratico, la teoria delle basi
          di dati relazionali.

script:   https://cdnjs.cloudflare.com/ajax/libs/railroad-diagrams/1.0.0/railroad-diagrams.min.js
script:   https://cdn.jsdelivr.net/gh/gionatamassibenincasa/database-didattici/algebra_delle_relazioni/js/relations.js

link:     https://cdnjs.cloudflare.com/ajax/libs/railroad-diagrams/1.0.0/railroad-diagrams.min.css

-->

# Algebra delle relazioni <br> Un approccio pratico<!-- style="color: blue" --> alla teoria<!-- style="color: red" --> delle basi di dati

Un corso in 10 incontri per scoprire, in modo pratico, la teoria delle basi di dati relazionali.

> Per visualizzare questo documento come una versione interattiva fornita da LiaScript,
> fare clic sul seguente collegamento/badge:
>
> [![LiaScript](https://raw.githubusercontent.com/LiaScript/LiaScript/master/badges/course.svg)](https://liascript.github.io/course/?https://raw.githubusercontent.com/gionatamassibenincasa/database-didattici/main/algebra_delle_relazioni/README.md)

Web application complementare (calcolatrice): https://gionata.github.io/relax/

## Riferimenti

Crediti:

* Hugh Darwen, *An Introduction to Relational Database Theory*. 2014

{{1}}
|Diapositive|Calcolatrice|
|:---:|:---:|
|[qr-code](https://liascript.github.io/course/?https://raw.githubusercontent.com/gionatamassibenincasa/database-didattici/main/algebra_delle_relazioni/README.md)|[qr-code](https://gionata.github.io/relax/)|

{{2}}
|New SQL script|SQLite language|
|:---:|:---:|
|[qr-code](https://it.khanacademy.org/computer-programming/new/sql)|[qr-code](https://www.sqlite.org/lang.html)|


## Introduzione

Uno sguardo su

* cos'è un database
* cos'è un database relazionale, in particolare
* cos'è un sistema di gestione dei database (DBMS)
* cosa fa un DBMS
* come un DBMS relazionale fa quello che fa un DBMS

### Cos'è un database?

> Un **database** è una raccolta *organizzata* di *simboli*  leggibile da una macchina, da _interpretare_ come un fedele resoconto di un'organizzazione. Un database è anche aggiornabile da una macchina, e quindi deve essere anche una raccolta di _variabili_. Un database è in genere disponibile per una comunità di utenti, con requisiti variabili nel tempo.
>
> -- Hugh Darwen, An Introduction to Relational Database Theory. 2014

#### una raccolta *organizzata* di *simboli*

Un esempio di raccolta *organizzata* di *simboli*

<script>
addHTMLTable(`||
|StudentId|Name|CourseId|
|---------|----|--------|
|S1|Anne|C1|
|S1|Anne|C2|
|S2|Boris|C1|
|S3|Cindy|C3|`);
</script>

**Figura 1.1: Una raccolta organizzata di simboli**

{{1}}
Riesci a indovinare cosa potrebbe voler dirci questa disposizione tabulare di simboli?
Cosa potrebbe significare che i simboli appaiano nella stessa riga?
E nella stessa colonna?
In che modo il significato dei simboli nella prima riga (mostrati in neretto) potrebbe differire dal significato di quelli sottostanti?

{{2}}
Riesci a indovinare intuitivamente che i simboli sotto la prima riga nella prima colonna sono tutti identificatori di studenti, quelli nella seconda colonna nomi di studenti e quelli nella terza identificatori di corsi? Riesci a indovinare che il nome della studentessa S1 è Anne? E che Anne è iscritta ai corsi C1 e C2? E che Cindy non è iscritta a nessuno di quei due corsi? In tal caso, quali caratteristiche dell'organizzazione dei simboli ti hanno portato a queste ipotesi?

{{3}}
Ricorda quelle caratteristiche. In modo informale, costituiscono il fondamento della teoria relazionale. Ognuna di esse ha una controparte formale nella teoria relazionale e quelle controparti formali sono gli unici costituenti della struttura organizzata che è un database relazionale.

#### da interpretare come un fedele resoconto

Per esempio

<script>
addHTMLTable(`||
|StudenteId|Nome|CorsoId|
|---------|----|--------|
|S1|Anne|C1|`);
</script>

Forse quei simboli in carattere normale, organizzati come sono rispetto a quelli in neretto, devono essere intesi nel senso:

"La studentessa S1, di nome Anne, è iscritta al corso C1."


{{1}}
Una cosa importante è che solo alcuni simboli della frase tra virgolette compaiono nella tabella: S1, Anne e C1.
Nessuna delle altre parole compare nella tabella.
I simboli nella riga superiore della tabella (presumibilmente intestazioni di colonna) potrebbero aiutarci a indovinare "studente", "nome" e "corso", ma nulla nella tabella accenna a "iscritto". E anche se quelle intestazioni di colonna presunte fossero state A, B e C, o X, Y e Z, l'interpretazione data potrebbe comunque essere quella voluta.

{{2}}
Ora, possiamo prendere la frase "La studentessa S1, di nome Anne, è iscritta al corso C1" e sostituire ciascuno di S1, Anne e C1 con i simboli corrispondenti presi da un'altra riga della tabella, come S2, Boris e C1. Così facendo, stiamo applicando esattamente la stessa modalità di interpretazione a ogni riga.

{{3}}
Se è davvero così che la tabella deve essere interpretata, allora possiamo concludere che le seguenti frasi sono tutte vere:

{{3}}

* La studentessa S1, di nome Anne, è iscritta al corso C1.
* La studentessa S1, di nome Anne, è iscritta al corso C2.
* Lo studente S2, di nome Boris, è iscritto al corso C1.
* La studentessa S3, di nome Cindy, è iscritta al corso C3.


####  raccolta di variabili

Guarda questa nuova tabella con una piccola modifica

<script>
addHTMLTable(`|Iscrizione|
|StudentId|Name|CourseId|
|S1|Anne|C1|
|S1|Anne|C2|
|S2|Boris|C1|
|S3|Cindy|C3|
|S4|Devinder|C1|`);
</script>

**Figura 1.2: Una variabile che rappresenta suo valore corrente**

{{1}}
Abbiamo aggiunto un *nome*, `Iscrizione`, sopra la tabella, ed una riga aggiuntiva.

`Iscrizione` è una **variabile**.
 Forse la tabella in fig. 1.1 era un suo **valore** precedente.
 Se così fosse, la variabile è stata *aggionata* con l'aggiunta della riga per S4.
 
La nostra interpretazione della fig. 1.1 deve essere rivista alla luce della nuova riga:

* La studentessa S1, di nome Anne, è iscritta al corso C1.
* La studentessa S1, di nome Anne, è iscritta al corso C2.
* Lo studente S2, di nome Boris, è iscritto al corso C1.
* La studentessa S3, di nome Cindy, è iscritta al corso C3.
* Lo studente  S4, di nome Devinder, è iscritto al corso C1.

{{2}}

Conosci la [logica delle proposizioni](https://it.wikipedia.org/wiki/Logica_proposizionale)?

{{2}}
Nota che in italiano possiamo unire tutte queste frasi per formare una frase singola, usando congiunzioni come "e", "o", "ma", "perché" e così via.
Se le uniamo usando in particolare con "e", che per noi è anche un **connettivo logico**, otteniamo una frase singola che è logicamente equivalente all'insieme di frasi sopra scritte, nel senso che la nuova proposizione è vera se delle proposizioni che la compone è vera (e falsa se una qualsiasi di esse è falsa). Un database, quindi, può essere pensato come una rappresentazione di un resoconto dell'organizzazione espresso come una frase singola, ma è più comune pensare in termini di una raccolta di singole frasi.

{{3}}

Potremmo anche essere in grado di concludere che le seguenti frasi (ad esempio) sono false:

* Lo studente S2, di nome Boris, è iscritto al corso C2.
* Lo studente S2, di nome Beth, è iscritto al corso C1.

{{4}}

Ogni volta che la variabile viene *aggiornata*, l'insieme di frasi (proposizioni) vere rappresentato dal suo valore cambia in qualche modo.

{{5}}

Gli aggiornamenti di solito riflettono i cambiamenti che osserviamo nell'organizzazione, influenzando le nostre convinzioni su di essa e quindi il nostro resoconto su di essa.

### Cos'è un database relazionale?

Un database relazionale è un database i cui simboli sono organizzati in una raccolta di relazioni.
La Figura 1.3 conferma che gli esempi che abbiamo già visto sono in effetti relazioni, rappresentate in forma tabellare. Infatti, secondo la Figura 1.2, la relazione rappresentata nella Figura 1.3 è il valore corrente della variabile `Iscrizione`.

<script>
  addHTMLTable(`||
|StudentId|Name|CourseId|
|---|---|---|
|S1|Anne|C1|
|S1|Anne|C2|
|S2|Boris|C1|
|S3|Cindy|C3|
|S4|Devinder|C1|`);
</script>

**Figura 1.3: Una relazione rappresentata in forma tabellare**

{{1}}
La rappresentazione visiva (tabellare) che abbiamo utilizzato finora è particolarmente adatta ai database relazionali: tanto che molte persone usano la parola tabella come alternativa a relazione. Il linguaggio SQL in particolare usa quel termine, quindi nel contesto della teoria relazionale è conveniente e giudizioso attenersi a relazione per il costrutto teorico, consentendo che le deviazioni di SQL dalla teoria relazionale siano notate come differenze tra tabelle e relazioni.

{{2}}
*Relazione* è un termine formale in matematica, in particolare, nel fondamento logico della matematica.

{{3}}
La maggior parte dei testi matematici si concentra sulle relazioni che coinvolgono cose prese in coppia, ma il nostro esempio mostra una relazione che coinvolge cose prese tre alla volta e, come vedremo, le relazioni in generale possono mettere in relazione un numero qualsiasi di cose (e, come vedremo, il numero in questione può anche essere inferiore a due, rendendo il termine relazione un po' inappropriato).

{{4}}
La teoria dei database relazionali è costruita attorno al concetto di relazione. Il nostro studio della teoria includerà:

{{4}}

- L'"anatomia" di una relazione.
- Algebra relazionale: un insieme di operatori matematici che operano sulle relazioni e producono relazioni come risultati.
- Variabili di relazione: la loro creazione e distruzione e operatori per aggiornarle.
- Operatori di confronto relazionale, che consentono di esprimere le regole di coerenza come vincoli (comunemente chiamati vincoli di **integrità**) sulle variabili che costituiscono il database.

{{5}}

E vedremo come questi e altri costrutti possono costituire la base di un linguaggio di database (in particolare, un linguaggio di database relazionale).

#### “Relazione" $\neq$ “Tabella”

"Tabella", qui, si riferisce a immagini del tipo mostrato nelle Figure 1.1, 1.2 e 1.3. I termini relazione e tabella
non sono sinonimi. Per prima cosa, sebbene ogni relazione possa essere rappresentata come una tabella, esistono tabelle
che non sono una rappresentazione di una relazione. Diremo che tali tabelle non **denotano** una relazione. Inoltre, diverse tabelle possono tutte rappresentare la stessa relazione. Si consideri la Figura 1.4, per esempio.

<script>
addHTMLTable(`||
|Name|StudentId|CourseId|
|---|---|---|
|Devinder|S4|C1|
|Cindy|S3|C3|
|Anne|S1|C1|
|Boris|S2|C1|
|Anne|S1|C2|`);
</script>

**Figura 1.4: La stessa relazione di Figura 1.3**

{{1}}

La tabella nella Figura 1.4 è diversa da quella nella Figura 1.3, ma rappresenta la stessa relazione. Ho cambiato l'ordine delle colonne e l'ordine delle righe, ogni riga verde nella Figura 1.4 ha gli stessi simboli per ogni intestazione di colonna di alcune righe nella Figura 1.3 e ogni riga nella Figura 1.3 ha una riga corrispondente, derivata in quel modo, nella Figura 1.4. Ciò che sto cercando di illustrare è il principio secondo cui la relazione rappresentata da una tabella non dipende dall'ordine in cui posizioniamo le righe o le colonne in quella tabella. Ne consegue che diverse tabelle possono tutte indicare la stessa relazione, perché possiamo semplicemente cambiare l'ordine da sinistra a destra in cui sono mostrate le colonne e/o l'ordine dall'alto verso il basso in cui sono mostrate le righe e tuttavia rappresentare ancora la stessa relazione.

{{2}}

Cosa significa dire che l'ordine delle colonne e l'ordine delle righe non hanno importanza? Scopriremo la risposta a questa domanda quando in seguito studieremo gli operatori tipici definiti per operare sulle relazioni (ad esempio, per calcolare i risultati delle query sul database) e sulle variabili di relazione (ad esempio, per aggiornare il database). Nessuno di questi operatori dipenderà dalla nozione di una riga o di una colonna come prima o ultima, o immediatamente prima o dopo un'altra colonna o riga.

{{3}}
Possiamo anche osservare che non tutte le tabelle rappresentano una relazione. Tali tabelle possono essere facilmente ottenute semplicemente eliminando le righe blu (le intestazioni di colonna) da ciascuna delle Figure 1.1 a 1.4.

{{4}}

La Figura 1.5 mostra un'altra tabella che non rappresenta alcuna relazione.

<script>
addHTMLTable(`||
|A|B|A|
|---|---|---|
|1|2|3|
|4||5|
|6|7|8|
|9|9|?|
|1|2|3|`);
</script>

**Figura 1.5: Una tabella che non denota una relazione**

### Anatomia di una relazione

La figura 1.6 mostra la terminologia che utilizziamo per riferirci alle parti della struttura di una relazione.

![Anatomia di una relazione](./1/anatomia.svg "Figura 1.6. Anatomia di una relazione")

**Figura 1.6. Anatomia di una relazione**

{{1}}

A causa della distinzione tra i termini relazione e tabella, preferiamo non usare la terminologia delle tabelle per le parti anatomiche di una relazione. Utilizziamo invece i termini proposti da E.F. Codd, il ricercatore che per primo propose la teoria relazionale come base per la tecnologia dei database, nel 1969. Prova ad abituarti a questi termini. Potresti non trovarli molto intuitivi. Le loro controparti nella rappresentazione tabellare potrebbero aiutarti:

{{1}}

- relazione : tabella
- (n-)tupla : riga
- attributo : colonna

{{2}}

Inoltre (come mostrato nella Figura 1.6):

- Il **grado** è il numero di attributi.

- La **cardinalità** è il numero di tuple.

- L'**intestazione** (o **schema**) è l'insieme di attributi (nota *insieme*, perché gli attributi non sono ordinati in alcun modo e nessun attributo appare più di una volta).

- Il **corpo** è l'insieme di tuple (di nuovo, nota *insieme*: le tuple non sono ordinate e nessuna tupla appare più di una volta).

- Un **attributo** ha un nome di attributo e non ce ne sono due con lo stesso nome.

- Ogni attributo ha un valore di attributo in ogni tupla.


### Cos'è un DBMS?

{{1}}
Un sistema di gestione di database (DBMS) è esattamente ciò che suggerisce il suo nome: un software per la gestione di database e per fornire accesso a essi.

{{2}}
Un DBMS risponde a _comandi impartiti da *programmi applicativi*, personalizzati o generici, eseguiti per conto degli utenti. I comandi sono scritti nel linguaggio del database del DBMS (ad esempio, `SQL`).

{{3}}
Per supportare più utenti simultanei, un DBMS normalmente funziona come un server. I suoi utenti immediati sono quindi quei programmi applicativi, eseguiti come client di questo server, in genere (anche se non necessariamente) per conto di *utenti finali*. Pertanto, è necessario un qualche tipo di protocollo di comunicazione per la trasmissione di comandi e risposte tra client e server. Prima di inviare comandi al server, un programma applicativo client deve prima stabilire una connessione con esso, avviando così una sessione, che in genere dura finché il client non ne chiede esplicitamente la terminazione. Questo è tutto ciò che devi sapere sull'architettura client-server per quanto riguarda questo libro.

<script>
// Questo documento riguarda in particolare i DBMS relazionali e i database relazionali, e presto esamineremo i componenti che ci aspettiamo di trovare in un DBMS relazionale. Prima di ciò, dobbiamo rivedere brevemente cosa ci si aspetta da un DBMS in generale.
</script>

### Cos'è un linguaggio di database?

{{1}}

I comandi forniti a un DBMS da un'applicazione sono scritti nel linguaggio di database del DBMS. Il termine *sottolinguaggio dei dati* è talvolta utilizzato al posto di linguaggio di database. Il prefisso *sotto* si riferisce al fatto che i programmi applicativi sono talvolta scritti in un linguaggio di programmazione più generico (il linguaggio "host"), in cui i comandi del linguaggio di database sono incorporati in uno stile predefinito. 

{{2}}

Una query è un'espressione che, quando valutata, produce un risultato derivato dal database. **Le query sono ciò che rende utili i database**. Si noti che una query non è di per sé un comando. Il DBMS potrebbe supportare un qualche tipo di comando per valutare una determinata query e rendere il risultato disponibile per l'accesso, anche tramite comandi DBMS, da parte del programma applicativo. Il programma applicativo potrebbe eseguire tali comandi per visualizzare un risultato di query (solitamente in forma tabellare) in una finestra.

### Cosa fa un DBMS?

{{1}}

In risposta alle richieste dei programmi applicativi, ci aspettiamo che un DBMS sia in grado, ad esempio, di

- creare e distruggere variabili nel database
- prendere nota delle regole di integrità (vincoli)
- prendere nota delle autorizzazioni (chi è autorizzato a fare cosa, a quale cosa)
- aggiornare le variabili (rispettando vincoli e autorizzazioni)
- fornire risultati di query

{{2}}

Le richieste assumono la forma di comandi scritti nel linguaggio del database supportato dal DBMS.

{{3}}

Le variabili sono i costituenti del database, come la variabile `Iscrizione` che abbiamo esaminato in precedenza.

{{4}}

Tali variabili sono sia **persistenti** che **globali**.

{{5}}
Una variabile *persistente* è una variabile che cessa di esistere solo quando la sua distruzione è richiesta esplicitamente da un utente.

{{6}}
Una variabile *globale* è una variabile che esiste indipendentemente dai programmi applicativi che la utilizzano, distinguendola da una variabile locale, dichiarata all'interno del programma applicativo e automaticamente distrutta quando l'unità di programma ("blocco") in cui è dichiarata termina la sua esecuzione.

{{7}}
I **vincoli** (talvolta chiamati  **vincoli di integrità**) sono regole che disciplinano i valori ammissibili e le combinazioni ammissibili di valori delle variabili. Ad esempio, potrebbe essere possibile dire al DBMS che il punteggio di valutazione degli studente non può essere inferiore a zero.

{{8}}
Un database che_viola un vincolo è, per definizione, errato: rappresenta un resoconto che è in qualche modo falso.

{{9}}
Un database che soddisfa tutti i suoi vincoli si dice **coerente**, anche se in generale non si può garantire che sia corretto.
Nel senso che i vincoli sono per l'**integrità**, le autorizzazioni sono per la **sicurezza**. Alcuni dei dati in un database potrebbero rappresentare informazioni sensibili la cui accessibilità è limitata solo a determinati utenti privilegiati. Analogamente, potrebbe essere desiderabile consentire ad alcuni utenti di accedere a determinate parti del database senza essere in grado di aggiornare anche tali parti.

{{10}}
Nota le tre parti di un'autorizzazione: **chi**, **cosa** e **a cosa**. "Chi" è un utente del database; "cosa" è una delle operazioni disponibili per operare sulle variabili nel database; "a cosa" è una di queste variabili.

### Con RelaX

#### Creazione ed eliminazione di variabili

L'esempio 1.1 mostra i comandi per creare la variabile mostrata in Figura 1.2:

```text
Iscrizione={StudentId:string,Name:string,CourseId:string
'S1','Anne','C1'
'S1','Anne','C2'
'S2','Boris','C1'
'S3','Cindy','C3'
'S4','Devinder','C1'
}
```
**Esempio 1.1. Creazione di una variabile temporanea con RelaX**

{{1}}

Funziona?

{{2}}

```text
Iscrizione={StudentId:string,Name:string,CourseId:string
'S1','Anne','C1'
'S1','Anne','C2'
'S2','Boris','C1'
'S3','Cindy','C3'
'S4','Devinder','C1'
}
Interrogazione
```
**Esempio 1.2. Creazione di una variabile temporanea con RelaX e interrogazione**

{{3}}

Funziona?

{{4}}

- Compare nello schema della base di dati?
- È una variabile globale?
- È persistente?

{{5}}

In RelaX bisogna usare l'editor di gruppo. Non è un DBMS! Meglio cambiare strumento.

### Linguaggio SQL

Per sperimentare un sistema quasi _relazionale_, possiamo usare anche noi [SQLite](https://sqlite.org), il motore di database SQL [più usato al mondo](https://sqlite.org/mostdeployed.html). Non si tratta di un DBMS ma di un componente software (libreria) così importante da essere tra quelli con maggiori istallazioni e maggiore utilizzo.

Un'interfaccia molto amichivole ci viene fornita da [Khan Academy](Khan Academy):


[qr-code](https://it.khanacademy.org/computer-programming/new/sql)

La relazione si genera con:

```sql
CREATE TABLE Iscrizione (
  StudentId TEXT,
  Name TEXT,
  CourseId TEXT,
  PRIMARY KEY(StudentId, CourseId)
);
```
**Costruzione di una variabile**

Si può vedere qualche dettaglio sulla [sintassi CREATE TABLE](https://www.sqlite.org/lang_createtable.html)

`TEXT` si riferisce ad un tipo, `PRIMARY KEY` è un tipo di vincolo e specifica che non ci posso essere due tuple nella relazione `Iscrizione` con la stessa configurazione di valori di attributi per StudentId e CourseId (non possiamo iscrivere lo stesso studente allo stesso corso più di una volta)

La relazione si elimina con:

```
DROP TABLE Iscrizione;
```
**Eliminazione di una relazione**

Dopo l'esecuzione del comando, la variabile smetterà di esistere e ogni tentativo di riferirsi alla variabile genera un errore.

### Tenere nota delle regole d'integrità

- `PRIMARY KEY`
- `FOREIGN KEY`
- `CHECK`
- `TRIGGER`


### Tenere nota delle autorizzazioni

- `CREATE USER`
- `GRANT`
- `REVOKE`

### Aggiornare le variabili

Il modo usuale di aggiornare una variabile nei linguaggi informatici è tramite assegnazione.
Ad esempio, se X è una variabile intera, l'assegnazione X := X + 1 aggiorna X in modo che il suo valore immediatamente dopo l'esecuzione dell'assegnazione sia uno in più rispetto al suo valore immediatamente precedente.
L'espressione a destra di := indica la sorgente per l'assegnazione e il nome della variabile a sinistra indica la destinazione.
Quando la destinazione è una variabile di relazione, come sempre quando fa parte di un database relazionale, la
sorgente deve essere una 
L'assegnazione, sebbene dovrebbe essere disponibile (non lo è in SQL), non è il modo usuale di applicare aggiornamenti a un database relazionale.
Questo perché molto spesso c'è solo una piccola quantità di differenza, per così dire, tra il valore "vecchio" e il valore "nuovo" ed è solitamente molto
più comodo poter esprimere l'aggiornamento in termini di quella piccola differenza.

Gli operatori di aggiornamento differenziale previsti in un DBMS relazionale sono solitamente chiamati `INSERT`, `DELETE` e `UPDATE`, e sono questi i nomi utilizzati in SQL.


Dai un'occhiata prima a DELETE

(Esempio 1.8).

**Esempio 1.8: Aggiornamento tramite eliminazione**
```
DELETE FROM Iscrizioni WHERE StudentId = 'S4' ;
```

- Informalmente, l'esempio 1.8 elimina tutte le tuple per lo studente S4 e può essere interpretato come "lo studente S4 non è più iscritto a nessun corso". Più formalmente, assegna alla variabile Iscrizione la relazione il cui corpo è costituito da quelle tuple nel valore corrente di Iscrizione che non soddisfano la condizione data nella clausola WHERE, quindi ogni tupla in cui il valore dell'attributo StudentId non è l'identificativo dello studente S4.

- `StudentId = 'S4'  è un'espressione condizionale. Poiché segue la parola chiave WHERE qui, è in effetti una condizione WHERE, nota anche come condizione di restrizione (o selezione).
Successivamente, nell'Esempio 1.9, esaminiamo UPDATE.

**Esempio 1.9: Aggiornamento tramite sostituzione**
```
UPDATE Iscrizione SET Name = 'Ann' WHERE StudentId = 'S1' :

```

Nota che `UPDATE` usa una clausola `WHERE`, proprio come `DELETE`. La clausola ``WHERE` è preceduta da un elenco di assegnazioni, nell'Esempio 1.9 solo un'assegnazione, ma queste sono assegnazioni ad attributi, non assegnazioni a variabili.

**Spiegazione 1.9:**

- Informalmente, l'Esempio 1.9 aggiorna ogni tupla Iscrizione per lo studente S1, modificandone il valore Name in 'Ann'. Più formalmente, assegna alla variabile Iscrizione la relazione che è identica al valore corrente sotto tutti gli aspetti, eccetto che il valore per l'attributo Name, nelle tuple il cui valore StudentId è l'identificativo studente S1, diventa la stringa 'Ann' in ogni caso. (Avrei scritto "tranne forse" se non avessi saputo che il valore Name esistente in quelle tuple è 'Anne' in ogni caso. In alcune circostanze non si verifica alcuna modifica come risultato dell'esecuzione di un UPDATE e lo stesso vale per DELETE e INSERT.)

- `SET Name = 'Ann'` è un'assegnazione di attributo. Un'assegnazione di attributo imposta il valore dell'attributo di destinazione sul valore specificato, in ogni tupla che soddisfa la condizione WHERE.

Infine, l'Esempio 1.10 illustra l'uso di INSERT.

**Esempio 1.10: Aggiornamento tramite inserimento**

```
INSERT INTO Iscrizione (StudentId, Name, CourseId) VALUES ( 'S4' , 'Devinder',  'C1' );

```

**Spiegazione 1.10:**

- Informalmente, l'Esempio 1.10 aggiunge una tupla a Iscrizione indicando che lo studente S4, ancora chiamato Devinder, è ora iscritto al corso C1. Più formalmente, assegna alla variabile ENROLMENT la relazione costituita da ogni tupla nel valore corrente di Iscrizione e ogni tupla (ce n'è solo una in questo particolare esempio) nella relazione indicata dall'espressione che segue la parola Iscrizione.

- L'espressione che inizia con la parola chiave VALUES e termina con l'ultima parentesi tonda di chiusura indica la tupla composta dai tre valori di attributo indicati: 'S4' per l'attributo StudentId, 'Devinder' per l'attributo Name, e 'C1' per l'attributo CourseId.

L'esempio 1.10 non ha alcun effetto sul database nel caso in cui il valore corrente di Iscrizione contenga già la tupla che rappresenta l'iscrizione dello studente S4, di nome Devinder, al corso C1.

### Interrogazioni

Chi è iscritto al corso C1?

**Esempio 1.11: Una query**
```
SELECT StudentId, Name
FROM Iscrizione
WHERE CourseId = 'C1';
```


## Valori, tipi, variabili, operatori

Valori, tipi, variabili, operatori

### Anatomia di un'istruzione
Esempio: $Y \gets X + 1$

- $Y$ Indica una variabile
- $X$ Indica il valore corrente di una variabile
- Indica un valore
- $+$ Un operatore di sola lettura
- $=$ Un operatore di assegnamento (aggiornamento)
- $X$ e 1 sono argomenti per l'invocazione di $+$
- $Y$ e $X+1$ sono argomenti per l'invocazione di $\gets$

### Distinzioni importanti

- Valore vs variabile
- Variabile vs riferimento a variabile
- Operatore di assegnamento (aggiornamento) vs operatore di sola lettura
- Operatore vs invocazione
- Parametro vs argomento
- Parametro soggetto ad aggiornamento vs parametro non soggetto ad aggiornamento

### Uno sguardo più da vicino a un operatore (+)

<script>
addHTMLTable(`||
| a | b | c |
| --- | --- | --- |
| 1 | 2 | 3 |
| 2 | 3 | 5 |
| 2 | 1 | 3 |
`);
</script>

e così via (all'infinito)

- Guarda, è una relazione!
- Il predicato: $a + b = c$
- Gli attributi $a$ e $b$ possono essere considerati come parametri di $+$.
- È anche una funzione: dati $a$ e $b$, conosciamo $c$.

### Che cos'è un tipo? Esempi:

- WEEKDAY: { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }
- INTEGER: { …, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, … }
- Un tipo (= "dominio") è un insieme di valori denominati.
- Monday ecc. e -7 ecc. sono letterali. Ogni valore di ogni tipo dovrebbe poter essere denotato da un qualche letterale.

<!-- Numero diapositiva: 7 -->
### A cosa serve un tipo?

Serve a limitare i valori consentiti per uno scopo. Ad esempio, limitando:

- i valori che possono essere assegnati a una variabile
- i valori che possono essere sostituiti per un parametro
- i valori che un operatore può produrre quando viene invocato
- i valori che possono apparire per un dato attributo di una relazione
- Il tipo dichiarato (della variabile, parametro, operatore o attributo) limita i suoi possibili valori a essere di quel tipo.

### Qual è il tipo di questo?

<script>
addHTMLTable(`||
| StudentId | Name | CourseId |
| --- | --- | --- |
| S1 | Anne | C1 |
| S1 | Anne | C2 |
| S2 | Boris | C1 |
| S3 | Cindy | C3 |
| S4 | Devinder | C1 |
`);
</script>

Forse è una **relazione** definita sugli attributi { StudentId: SID, Name: NAME, CourseId: CID }
dove SID è il tipo dichiarato di StudentId, NAME quello di Name e CID quello di CourseId.

NOTA: SQLite non supporta la creazione di domini.

- Useremo i tipi predefiniti (INTEGER, REAL, TEXT, BLOB) ed i vincoli CHECK.
- SQLite usa la tipizzazione flessibile.

### Come scrivere questo come letterale?

<script>
addHTMLTable(`||
| StudentId | Nome | CourseId |
| --- | --- | --- |
| S1 | Anne | C1 |
| S1 | Anne | C2 |
| S2 | Boris | C1 |
| S3 | Cindy | C3 |
| S4 | Devinder | C1 |
`);
</script>

<!-- Numero diapositiva: 10 -->
### Un letterale in SQL

```sql
SELECT 'S1' as StudentId, 'C1' AS CourseId, 'Anne' AS Name
UNION
SELECT 'S1' as StudentId, 'C2' AS CourseId, 'Anne' AS Name
UNION
SELECT 'S2' as StudentId, 'C1' AS CourseId, 'Boris' AS Name
UNION
SELECT 'S3' as StudentId, 'C3' AS CourseId, 'Cindy' AS Name
UNION
SELECT 'S4' as StudentId, 'C1' AS CourseId, 'Devinder' AS Name
```

Una strana sintassi!

### Che cos'è una variabile?

- un nome (identificatore)
- un tipo (composto, con nome dell'attributo e dominio)
- un valore

Quindi una variabile ha un nome, un tipo dichiarato e un valore.
Il valore può cambiare di volta in volta. Il nome e il tipo no.

### Aggiornamento di una variabile

- Inserimento di nuovi valori
- Aggiornamento di valori pre-esistenti
- Cancellazione di valori pre-esistenti

### Distinzioni importanti che emergono

- valori e variabili
- valori e rappresentazioni di valori
- tipi e rappresentazioni
- operatori di sola lettura e operatori di aggiornamento
- parametri e argomenti
- operatori e invocazioni


## Proposizioni e Predicati

Un po' di logica

### Che cos'è un predicato?

In senso stretto, il significato di un certo tipo di frase, ma spesso usato (opportunamente) per riferirsi alla frase stessa.

Esempio: "Lo studente S1 è iscritto al corso C1".

- Nota che il significato è indipendente dalla lingua; la frase no!
- Nota anche che otteniamo una frase molto simile, con un significato molto simile, se cambiamo semplicemente uno dei designatori, S1 e C1 (ad esempio, sostituiamo C1 con C2).

### Che tipo di frase?

Una frase che ha la forma grammaticale di un'affermazione, qualcosa a cui si può credere o non credere.

In italiano, se "È vero che x?" è una domanda, allora x è un'affermazione (che ha la forma di una frase dichiarativa).

Potrebbe essere necessario parafrasare x. Ad esempio (da Shakespeare):

"Il problema è se essere o non essere" $gets$ "Essere o non essere, questo è il problema" 

### Alcuni controesempi

Frasi non dichiarative:

- "Vuoi sposarmi?"
- "Per favore, passami il sale."
- "Se la musica è il cibo dell'amore, continua a suonare."

### Alcuni esempi

Frasi dichiarative (e quindi denotano predicati):

- "Lo studente S1 è iscritto al corso C1."
- "Ti sposerò."
- "Il re di Francia è calvo"
- "2 + 2 = 5"
- "$x < y$"
- "$a + b = c$"
- "Lo studente $s$ è iscritto al corso $c$."
- “$P(x)$” (notazione per la forma generale)

### Derivazione di predicati da predicati (1)

- Sostituzione: di un designatore per un parametro
  - Dato un predicato n-adico, produce un predicato (n-1)-adico.

- Ad esempio, in “$a < b$” sostituisci 10 per $b$ per ottenere “$a < 10$”.
  - Ora sostituisci 5 per a e otteniamo “5 < 10”, una proposizione.
- Istanziazione: sostituzione di tutti i parametri, che produce una proposizione.

### Intensione ed estensione

Di un predicato:
- Intensione: il suo significato (in senso lato).
- Estensione: tutte le istanziazioni che sono (si ritiene siano) vere.

Il concetto di estensione è di fondamentale importanza nella teoria relazionale.

Nota che è un insieme di proposizioni.

In alternativa, è una singola proposizione formata collegando tutti i membri di quell'insieme usando "e".

L'estensione di un predicato niladico è o se stesso (se è vero) o l'insieme vuoto (se è falso).

### Derivazione di predicati da predicati (2)

I familiari operatori logici:

- congiunzione ("e", "and", $\land$) : "Lo studente s è iscritto al corso c e s si chiama nome".
- disgiunzione ("o", "or", $\lor$): "a < b o c < d"
negazione ("non", "not", "$\lnot$"): "Non è il caso che ti sposerò".


### Derivazione di predicati da predicati (3)

Condizionali:
implicazione: "Se me lo chiedi gentilmente, allora ti sposerò".
solo se: "Ti sposerò solo se me lo chiedi gentilmente". bicondizionale: "Ti sposerò solo se me lo chiederai gentilmente". (equivalenza)

### Derivazione di predicati da predicati (4)

Quantificatori:
esistenziale: "Esiste s tale che s è uno studente e s è iscritto al corso c". (≡ "Almeno uno studente è iscritto al corso c").
universale: "Per tutti gli s, se s è uno studente allora s è iscritto al corso c". (≡ "Tutti gli studenti sono iscritti al corso c").
La ​​quantificazione, come la sostituzione, lega un parametro.

### Insiemi
Sia P(x) un predicato. Se l'oggetto a è tale che P(a) è vero, allora si dice che a soddisfa P. E P(x) è chiamato un predicato di appartenenza per l'insieme costituito da tutti questi oggetti a. Esempio: "x è un intero tale che 1 < x < 4"
"x è un intero tale che 1 < x < 4" è un predicato di appartenenza per l'insieme costituito dagli elementi 2 e 3, denotato dall'espressione { 2, 3 } (un'enumerazione).
Questo insieme è anche denotato da { x : x  Z e 1 < x e x < 4 }.


<!-- Numero diapositiva: 13 -->
### Il linguaggio degli insiemi (1)
Sia A e B insiemi con predicati di appartenenza PA(x) e PB(x), rispettivamente. Sia a un elemento. Quindi abbiamo i seguenti confronti:
appartenenza: a  A (a è un membro di A)
contenimento: B  A (B è un sottoinsieme di A)
A  B (A è un superinsieme di B)
B  A (B è un sottoinsieme proprio di A)
A  B (A è un superinsieme proprio di B)
uguaglianza: A = B (A  B e B  A)
disgiunzione: A e B sono disgiunti (non hanno membri in comune)
13

<!-- Numero diapositiva: 14 -->
### Il linguaggio degli insiemi (2)
E le seguenti operazioni sugli insiemi che producono insiemi:
unione: A  B = {x : x  A o x  B} (disgiunzione)
intersezione: A  B = {x : x  A e x  B} (congiunzione)
complemento: (di A) = {x : non x  A} (negazione)
differenza: A - B = {x : x  A e non x  B}
14

<!-- Numero diapositiva: 15 -->
### ESERCIZI

| StudentId | Nome | CourseId |
| --- | --- | --- |
| S1 | Anne | C1 |
| S1 | Anne | C2 |
| S2 | Boris | C1 |
| S3 | Cindy | C3 |
| S4 | Devinder | C1 |
Supponiamo che il predicato di appartenenza per la seguente relazione sia "Studente StudentId, denominato Nome, è iscritto al corso CourseId".
(Gli esercizi sono nelle Note)
15