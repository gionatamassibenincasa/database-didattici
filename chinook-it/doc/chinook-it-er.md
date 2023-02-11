erDiagram
 Album {
  INTEGER albumId PK
  TEXT titolo
  INTEGER artistaId FK
 }

 Artista {
  INTEGER artistaId PK
  TEXT nome
 }

 Cliente {
  INTEGER clienteId PK
  TEXT nome
  TEXT cognome
  TEXT societa
  TEXT indirizzo
  TEXT citta
  TEXT stato
  TEXT nazione
  TEXT codicePostale
  TEXT telefono
  TEXT fax
  TEXT email
  INTEGER assistenteId FK
 }

 Dipendente {
  INTEGER dipendenteId PK
  TEXT cognome
  TEXT nome
  TEXT titolo
  INTEGER superioreId FK
  DATETIME dataNascita
  DATETIME dataAssunzione
  TEXT indirizzo
  TEXT citta
  TEXT stato
  TEXT nazione
  TEXT codicePostale
  TEXT telefono
  TEXT fax
  TEXT email
 }

 Genere {
  INTEGER genereId PK
  TEXT nome
 }

 Fattura {
  INTEGER fatturaId PK
  INTEGER clienteId FK
  DATETIME dataFatturazione
  TEXT indirizzoFatturazione
  TEXT cittaFatturazione
  TEXT statoFatturazione
  TEXT nazioneFatturazione
  TEXT codicePostaleFatturazione
  REAL totale
 }

 LineaFattura {
  INTEGER lineaFatturaId PK
  INTEGER fatturaId FK
  INTEGER tracciaId FK
  REAL prezzoUnitario
  INTEGER quantita
 }

 FormatoMultimediale {
  INTEGER formatoMultimedialeId PK
  TEXT nome
 }

 Playlist {
  INTEGER playlistId PK
  TEXT nome
 }

 TracciaPlaylist {
  INTEGER playlistId PK
  INTEGER tracciaId PK
 }

 Traccia {
  INTEGER tracciaId PK
  TEXT nome
  INTEGER albumId FK
  INTEGER formatoMultimedialeId FK
  INTEGER genereId FK
  TEXT compositori
  INTEGER millisecondi
  INTEGER byte
  REAL prezzoUnitario
 }

 Album }o--|| Artista : artistaId
 Cliente }o--|| Dipendente : assistenteId
 Dipendente }o--|| Dipendente : superioreId
 Fattura }o--|| Cliente : clienteId
 LineaFattura }o--|| Traccia : tracciaId
 LineaFattura }o--|| Fattura : fatturaId
 TracciaPlaylist }o--|| Traccia : tracciaId
 TracciaPlaylist }o--|| Playlist : playlistId
 Traccia }o--|| FormatoMultimediale : formatoMultimedialeId
 Traccia }o--|| Genere : genereId
 Traccia }o--|| Album : albumId

