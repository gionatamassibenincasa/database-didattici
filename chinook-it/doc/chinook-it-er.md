erDiagram
 Album {
  INTEGER AlbumId PK
  TEXT Titolo
  INTEGER ArtistaId FK
 }

 Artista {
  INTEGER ArtistaId PK
  TEXT Nome
 }

 Cliente {
  INTEGER ClienteId PK
  TEXT Nome
  TEXT Cognome
  TEXT Societa
  TEXT Indirizzo
  TEXT Citta
  TEXT Stato
  TEXT Nazione
  TEXT CodicePostale
  TEXT Telefono
  TEXT Fax
  TEXT Email
  INTEGER AssistenteId FK
 }

 Dipendente {
  INTEGER DipendenteId PK
  TEXT Cognome
  TEXT Nome
  TEXT Titolo
  INTEGER SuperioreId FK
  DATETIME DataNascita
  DATETIME DataAssunzione
  TEXT Indirizzo
  TEXT Citta
  TEXT Stato
  TEXT Nazione
  TEXT CodicePostale
  TEXT Telefono
  TEXT Fax
  TEXT Email
 }

 Genere {
  INTEGER GenereId PK
  TEXT Nome
 }

 Fattura {
  INTEGER FatturaId PK
  INTEGER ClienteId FK
  DATETIME DataFatturazione
  TEXT IndirizzoFatturazione
  TEXT CittaFatturazione
  TEXT StatoFatturazione
  TEXT NazioneFatturazione
  TEXT CodicePostaleFatturazione
  REAL(10,2) Totale
 }

 LineaFattura {
  INTEGER LineaFatturaId PK
  INTEGER FatturaId FK
  INTEGER TracciaId FK
  REAL(10,2) PrezzoUnitario
  INTEGER Quantita
 }

 FormatoMultimediale {
  INTEGER FormatoMultimedialeId PK
  TEXT Nome
 }

 Playlist {
  INTEGER PlaylistId PK
  TEXT Nome
 }

 TracciaPlaylist {
  INTEGER PlaylistId PK
  INTEGER TracciaId PK
 }

 Traccia {
  INTEGER TracciaId PK
  TEXT Nome
  INTEGER AlbumId FK
  INTEGER FormatoMultimedialeId FK
  INTEGER GenereId FK
  TEXT Compositori
  INTEGER Millisecondi
  INTEGER Byte
  REAL(10,2) PrezzoUnitario
 }

 Album }o--|| Artista : ArtistaId
 Cliente }o--|| Dipendente : AssistenteId
 Dipendente }o--|| Dipendente : SuperioreId
 Fattura }o--|| Cliente : ClienteId
 LineaFattura }o--|| Traccia : TracciaId
 LineaFattura }o--|| Fattura : FatturaId
 TracciaPlaylist }o--|| Traccia : TracciaId
 TracciaPlaylist }o--|| Playlist : PlaylistId
 Traccia }o--|| FormatoMultimediale : FormatoMultimedialeId
 Traccia }o--|| Genere : GenereId
 Traccia }o--|| Album : AlbumId

