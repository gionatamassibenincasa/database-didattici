**Ambito** (  **idAmbito**: INTEGER, ambito: TEXT)

**Beneficiario** (  **idBeneficiario**: INTEGER, beneficiario: TEXT)

**Donatore** (  **idDonatore**: INTEGER, cognome: TEXT, nome: TEXT, email: TEXT, CF: TEXT, IBAN: TEXT)

**Obiettivo** (  **idObiettivo**: INTEGER, obiettivo: TEXT)

**Organizzazione** (  **idOrganizzazione**: INTEGER, partitaIVA: TEXT, denominazione: TEXT, indirizzo: TEXT, IBAN: TEXT)

**Progetto** (  **idProgetto**: INTEGER, _idOrganizzazione_: INTEGER -> Organizzazione(idOrganizzazione), titolo: TEXT, sogliaMinima: REAL, ricompensa: TEXT, stato: TEXT, tempoLimite: TEXT, ammontare: REAL)

**ProgettoAmbito** (  ***idProgetto***: INTEGER -> Progetto(idProgetto), ***idAmbito***: INTEGER -> Ambito(idAmbito))

**ProgettoBeneficiario** (  ***idProgetto***: INTEGER -> Progetto(idProgetto), ***idBeneficiario***: INTEGER -> Beneficiario(idBeneficiario))

**ProgettoObiettivo** (  ***idProgetto***: INTEGER -> Progetto(idProgetto), ***idObiettivo***: INTEGER -> Obiettivo(idObiettivo))

**Donazione** (  **idDonazione**: INTEGER, _idDonatore_: INTEGER -> Donatore(idDonatore), _idProgetto_: INTEGER -> Progetto(idProgetto), importo: REAL, modalita: TEXT, dataPagamento: TEXT, dataRestituzione: TEXT)

