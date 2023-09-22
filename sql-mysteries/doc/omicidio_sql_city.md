**rapport_scena_del_crimine** (  nome: INTEGER, tipo: TEXT, descrizione: TEXT, luogo: TEXT)

**patente** (  **id**: INTEGER, eta: INTEGER, altezza: INTEGER, colore_occhi: TEXT, colore_capelli: TEXT, sesso: TEXT, targa: TEXT, costruttore_veicolo: TEXT, modello_veicolo: TEXT)

**facebook_ingresso_eventi** (  _persona_id_: INTEGER -> persona(persona_id), evento_id: INTEGER, nome_evento: TEXT, data: INTEGER)

**interrogatorio** (  _persona_id_: INTEGER -> persona(persona_id), trascrizione: TEXT)

**get_fit_now_iscrizione** (  **id**: TEXT, _persona_id_: INTEGER -> persona(persona_id), nome: TEXT, data_iscrizione: INTEGER, tipo_iscrizione: TEXT)

**get_fit_now_ingresso** (  _tessera_id_: TEXT -> get_fit_now_iscrizione(tessera_id), data_ingresso: INTEGER, ora_ingresso: INTEGER, ora_uscita: INTEGER)

**soluzione** (  utente: INTEGER, valore: TEXT)

**reddito** (  **codice_fiscale**: CHAR, reddito_annuo: INTEGER)

**persona** (  **id**: INTEGER, nome: TEXT, _patente_id_: INTEGER -> patente(patente_id), numero_civico: INTEGER, indirizzo: TEXT, _codice_fiscale_: CHAR -> reddito(codice_fiscale))

