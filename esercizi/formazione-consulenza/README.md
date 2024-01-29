<!--
author:   Gionata Massi

email:    gionata.massi@savoiabenincasa.it

version:  2024-01-20

language: it

narrator: IT Italian Male

comment:  Modellizzazione concettuale dei dati.

-->

## Problema

# Modello concettuale dei dati


Una società di formazione e consulenza sta lavorando sulla gestione informatizzata delle certificazioni per le quali offre corsi formativi e rilascia titoli.

Le **certificazioni** sono di varie tipologie, nello specifico gli attestati della formazione sulla sicurezza nei luoghi di lavoro, la Certificazione Safety-Critical per il Settore Avionico e Aerospaziale, Software Security Certification, Software Developer Certification, Sofware Engineering Certification e Certified Secure Software Lifecycle Professional. La forte richiesta nel settore della Cybersicurezza sta inoltre spingendo il consiglio di amministrazione verso l'ampliamento della propria offerta verso altri corsi propedeutici alla partecipazione alle competizioni nazionali sul tema, le OliCyber e la CyberChallenge.it.  
  
La società eroga i **corsi** tramite i suoi consulenti ed ogni **formatore** può impartire un corso solo se possiede la certificazione oggetto del corso stesso.  
  
Gli **iscritti** ai corsi frequentano le **lezioni** in **sale attrezzate** in base al tipo di corso. Le sale hanno una capienza massima determinata in base alle caratteristiche geometriche della stanza e in base al numero di postazioni attrezzate.  
  
I corsi si sviluppano con più lezioni, teoriche e pratiche, e una prova finale per il rilascio dell'attestato. 
  
Le lezioni sono svolte per gruppi di non meno di 10 partecipanti e non più di 20. Il gruppo si stabilisce ad inizio corso e non è possibile cambiarlo successivamente all'iscrizione.
  
Le lezioni avvengono in fasce orarie e prestabilite che sono comunicate ai partecipanti sul sito web della Società.  
  
Si organizzi un database in grado di fornire le seguenti informazioni:  
  

-   elenco degli iscritti a ogni *edizione* del corso;
-   numero dei posti liberi in ciascun sala;
-   elenco dei corsi tenuti da ogni consulente formatore;  
    
-   elenco dei certificati di ogni formatore.

  
Dati mancanti opportunamente scelti.  
  
La documentazione di progetto da produrre è composta da:  

-   il glossario dei termini,
-   il diagramma delle classi di analisi
-   lo schema della base di dati relazionale.


## Glossario dei termini

| Termine        | Descrizione                           | Sinonimi          | Associazioni |
| -------------- | ------------------------------------- | ----------------- | ------------ |
| Certificazione | Attestazione di comprovate competenze | Titolo, Attestato | Formatore, Corso |
| Corso          | Insieme di obiettivi formativi comuni |                   | Formatore, Certificazione    |
| Formatore      | Colui che può impartire un corso      |                   | Certificazione |


## Un possibile schema E/relazionale

```plantuml
@startuml
hide methods
title Società di formazione e consulenza - Diagramma E/R

class Certificazione {
  denominazione
  data
  valutazione
}

class Corso {
  edizione
}

class Lezione {
  tipo
}

class FasciaOraria {
  inizio
  fine
}

class Formatore {
  cognome : string
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

Iscritto "1" -- "n" Prova : esame >

Corso "1" -- "n" Prova
Corso "n" -- "1" Sala
Corso "1" -- "n" Lezione : sviluppa >
Corso "n" -- "1" Certificazione : forma >


Formatore -- Corso: impartisce >
Formatore "n" -- "n" Certificazione : possiede >
Iscritto "n" -- "n" Corso : frequenta >
Lezione "n" -- "1" FasciaOraria : svolge >

Prova "1" -- "0..1" Cartificazione : rilascio >

@enduml
```

```plantuml

@startuml
@startuml
hide methods
title Società di formazione e consulenza - Diagramma E/R

class Certificazione {
  denominazione
}

class Corso {
  edizione
}

class Lezione {
  tipo
}

class FasciaOraria {
  inizio
  fine
}

class Formatore {
  cognome : string
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
FormatoreCertificazione "n" -- "1" Certificazione

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

```plantuml
@startuml
hide methods
title Società di formazione e consulenza - Diagramma E/R

class Certificazione {
  **idCertificazione**
  denominazione
}

class Corso {
  **idCorso**
  __idSala__
  __idCertificazione__
  edizione
}

class Lezione {
  **idLezione**
  __idCorso__
  __idFasciaOraria__
  tipo
}

class FasciaOraria {
  **idFasciaOraria**
  inizio
  fine
}

class Formatore {
  **idFormatore**
  cognome : string
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
  __idIscritto__
  __idCorso__
  __idCertificazione__
  data
  valutazione
}

class Frequenta {
  **idIscritto**
  **idCorso**
}

class FormatoreCertificazione {
 **idFormatore**
 **idCertificazione**
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
