<!--
author: Gionata Massi

email: gionata.massi@savoiabenincasa.it

version: 2024-01-30

language: it

narrator: IT Italian Male

comment: Modellizzazione concettuale dei dati.

import: https://raw.githubusercontent.com/liascript-templates/plantUML/master/README.md

-->

## Problema

Una società di formazione e consulenza sta lavorando sulla gestione informatizzata delle certificazioni per le quali offre corsi formativi e rilascia titoli.

Le **certificazioni** sono di varie tipologie, nello specifico gli attestati della formazione sulla sicurezza nei luoghi di lavoro, la Certificazione Safety-Critical per il Settore Avionico e Aerospaziale, Software Security Certification, Software Developer Certification, Sofware Engineering Certification e Certified Secure Software Lifecycle Professional. La forte richiesta nel settore della Cybersicurezza sta inoltre spingendo il consiglio di amministrazione verso l'ampliamento della propria offerta verso altri corsi propedeutici alla partecipazione alle competizioni nazionali sul tema, le OliCyber e la CyberChallenge.it.

La società eroga **corsi** tramite i suoi consulenti ed ogni **formatore** può impartire un corso solo se possiede la certificazione oggetto del corso stesso.
  
Gli **iscritti** ai corsi frequentano le **lezioni** in **sale** attrezzate in base al tipo di **corso**. Le sale hanno una **capienza** massima determinata in base alle caratteristiche geometriche della stanza e in base al numero di postazioni attrezzate.

I corsi si sviluppano in più lezioni, teoriche e pratiche, e una prova finale per il rilascio dell'attestato.

Le lezioni sono svolte in gruppi di non meno di 10 partecipanti e non più di 20. Il gruppo si stabilisce ad inizio corso e non è possibile cambiarlo successivamente all'iscrizione.

Le lezioni avvengono in e orarie e prestabilite che sono comunicate ai partecipanti sul sito web della Società.

Si organizzi un database
ado di fornire le seguenti informazioni:

- elenco degli iscritti **edizione** del corso;
- numero massimo di posti liberi in ciascuna sala, data un'edizione del corso;
- elenco deli corsi tenuti da ogni formatore;
- elenco dei certificati conseguiti dai formatori.
 
Dati mancanti opportunamente scelti. 

La documentazione di progetto è composta da:

- il glossario dei termini,
- il diagramma dle classi di analisi,
- lo schhema della base di dati relazionale.

## Glossario dei termini

| Termine        | Descrizione                           | Sinonimi          | Associazioni |
| -------------- | ------------------------------------- | ----------------- | ------------ |
| Certificazione | Attestazione di comprovate competenze | Titolo, Attestato | Formatore, Corso |
| Corso          | Insieme di obiettivi formativi comuni |                   | Formatore, Certificazione    |
| Formatore      | Colui che può impartire un corso      |                   | Certificazione |


## Schema concettuale

```text @plantUML
@startuml
hide methods
title Società di formazione e consulenza - Diagramma E/R

class Certificazione {
  denominazione
}

class Corso {
  denominazione
  edizione
}

class Lezione {
  data
  tipo
}

class Prova {
  data
  valutazione
}

class FasciaOraria {
  inizio
  fine
}

class Formatore {
  cognome
  nome
}

class Iscritto {
  nome
  cognome
}

class Sala {
  capienza
}

Iscritto "1" -- "n" Prova : esame >

Corso "1" -- "n" Prova
Corso "n" -- "1" Sala
Corso "1" -- "n" Lezione : sviluppa >
Corso "n" .. "0..1" Certificazione : forma >

Formatore "1" -- "n" Corso: impartisce >
Formatore "n" -- "n" Certificazione : possiede >
Iscritto "n" -- "n" Corso : frequenta >
Lezione "n" -- "1" FasciaOraria : svolge >

Prova "1" .. "0..1" Certificazione : rilascioCertificato >
@enduml
```

## Diagramma ristrutturato per eliminare le relazioni molti a molti e quelle 1 a 1 

```text @plantUML
@startuml
hide methods
title Società di formazione e consulenza - Diagramma E/R ristrutturato

class Certificazione {
  denominazione
}

class Corso {
  edizione
}

class Lezione {
  tipo
  data
}

class FasciaOraria {
  denominazione
  inizio
  fine
}

class Formatore {
  cognome
  nome
}

class Iscritto {
  nome
  cognome
}

class Sala {
  capienza
}

class Prova {
  data
  valutazione
}

class Frequenta

class FormatoreCertificazione

Formatore "1" -- "n" FormatoreCertificazione
FormatoreCertificazione "n" -- " " Certificazione

Iscritto "1" -- "n" Frequenta
Frequenta "n" -- "1" Corso

Iscritto "1" -- "n" Prova : esame >

Corso "1" -- "n" Prova
Corso "n" -- "1" Sala
Corso "1" -- "n" Lezione : sviluppa >
Corso "n" -- "1" Certificazione : forma >

Formatore "1" -- "n" Corso: impartisce >
Lezione "n" -- "1" FasciaOraria : svolge >

Prova "1" .. "0..1" Certificazione
@enduml
```

## Aggiunta delle chiavi

```text @plantUML
@startuml
hide methods
title Società di formazione e consulenza - Diagramma E/R

class Certificazione {
  **idCertificazione**
  denominazione
}

class Corso {
  **idCorso**
  //idSala//
  //idCertificazione//
  descrizione
  edizione
}

class Lezione {
  **idLezione**
  //idCorso//
  //idFasciaOraria//
  tipo
}

class FasciaOraria {
  **idFasciaOraria**
  inizio
  fine
}

class Formatore {
  **idFormatore**
  cognome
  nome
}

class Iscritto {
  **idIscritto**
  nome
  cognome
}

class Sala {
  **idSala**
  capienza
}

class Prova {
  **idProva**
  //idIscritto//
  //idCorso//
  //idCertificazione//
  data
  valutazione
}

class Frequenta {
  //**idIscritto**//
  //**idCorso**//
}

class FormatoreCertificazione {
 //**idFormatore**//
 //**idCertificazione**//
}

Formatore "1" -- "n" FormatoreCertificazione
FormatoreCertificazione "n" -- "1" Certificazione

Iscritto "1" -- "n" Frequenta
Frequenta "n" -- "1" Corso

Iscritto "1" -- "n" Prova : esame >

Corso "1" -- "n" Prova
Corso "n" -- "1" Sala
Corso "1" -- "n" Lezione : sviluppa >
Corso "n" .. "1" Certificazione : forma >

Formatore "1" -- "n" Corso: impartisce >
Lezione "n" -- "1" FasciaOraria : svolge >

Prova "1" .. "0..1" Certificazione

@enduml
```

## Diagramma delle classi con aggiunta dei tipi

```text @plantUML
@startuml
hide methods
title Società di formazione e consulenza - Diagramma E/R

class Certificazione {
  INTEGER **idCertificazione**
  TEXT denominazione
}

class Corso {
  INTEGER **idCorso**
  INTEGER //idSala//
  INTEGER //idCertificazione//
  TEXT descrizione
  INTEGER edizione
}

class Lezione {
  INTEGER **idLezione**
  INTEGER //idCorso//
  INTEGER //idFasciaOraria//
  ENUM tipo
}

class FasciaOraria {
  INTEGER **idFasciaOraria**
  TIME inizio
  TIME fine
}

class Formatore {
  INTEGER **idFormatore**
  TEXT cognome
  TEXT nome
}

class Iscritto {
  INTEGER **idIscritto**
  TEXT nome
  TEXT cognome
}

class Sala {
  INTEGER **idSala**
  INTEGER capienza
}

class Prova {
  INTEGER **idProva**
  INTEGER //idIscritto//
  INTEGER //idCorso//
  INTEGER //idCertificazione//
  DATE data
  REAL valutazione
}

class Frequenta {
  INTEGER //**idIscritto**//
  INTEGER //**idCorso**//
}

class FormatoreCertificazione {
 INTEGER //**idFormatore**//
 INTEGER //**idCertificazione**//
}

Formatore "1" -- "n" FormatoreCertificazione
FormatoreCertificazione "n" -- "1" Certificazione

Iscritto "1" -- "n" Frequenta
Frequenta "n" -- "1" Corso

Iscritto "1" -- "n" Prova : esame >

Corso "1" -- "n" Prova
Corso "n" -- "1" Sala
Corso "1" -- "n" Lezione : sviluppa >
Corso "n" .. "1" Certificazione : forma >

Formatore "1" -- "n" Corso: impartisce >
Lezione "n" -- "1" FasciaOraria : svolge >

Prova "1" .. "0..1" Certificazione

@enduml
```
