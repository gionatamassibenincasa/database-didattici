erDiagram
 Album {
  INTEGER AlbumId PK
  NVARCHAR(160) Titolo
  INTEGER ArtistaId FK
 }

 Artista {
  INTEGER ArtistaId PK
  NVARCHAR(120) Nome
 }

 Cliente {
  INTEGER ClienteId PK
  NVARCHAR(40) Nome
  NVARCHAR(20) Cognome
  NVARCHAR(80) Societa
  NVARCHAR(70) Indirizzo
  NVARCHAR(40) Citta
  NVARCHAR(40) Stato
  NVARCHAR(40) Nazione
  NVARCHAR(10) CodicePostale
  NVARCHAR(24) Telefono
  NVARCHAR(24) Fax
  NVARCHAR(60) Email
  INTEGER AssistenteId FK
 }

 Dipendente {
  INTEGER DipendenteId PK
  NVARCHAR(20) Cognome
  NVARCHAR(20) Nome
  NVARCHAR(30) Titolo
  INTEGER SuperioreId FK
  DATETIME DataNascita
  DATETIME DataAssunzione
  NVARCHAR(70) Indirizzo
  NVARCHAR(40) Citta
  NVARCHAR(40) Stato
  NVARCHAR(40) Nazione
  NVARCHAR(10) CodicePostale
  NVARCHAR(24) Telefono
  NVARCHAR(24) Fax
  NVARCHAR(60) Email
 }

 Genere {
  INTEGER GenereId PK
  NVARCHAR(120) Nome
 }

 Fattura {
  INTEGER FatturaId PK
  INTEGER ClienteId FK
  DATETIME DataFatturazione
  NVARCHAR(70) IndirizzoFatturazione
  NVARCHAR(40) CittaFatturazione
  NVARCHAR(40) StatoFatturazione
  NVARCHAR(40) NazioneFatturazione
  NVARCHAR(10) CodicePostaleFatturazione
  NUMERIC(10,2) Totale
 }

 LineaFattura {
  INTEGER LineaFatturaId PK
  INTEGER FatturaId FK
  INTEGER TracciaId FK
  NUMERIC(10,2) PrezzoUnitario
  INTEGER Quantita
 }

 FormatoMultimediale {
  INTEGER FormatoMultimedialeId PK
  NVARCHAR(120) Nome
 }

 Playlist {
  INTEGER PlaylistId PK
  NVARCHAR(120) Nome
 }

 TracciaPlaylist {
  INTEGER PlaylistId PK
  INTEGER TracciaId PK
 }

 Traccia {
  INTEGER TracciaId PK
  NVARCHAR(200) Nome
  INTEGER AlbumId FK
  INTEGER FormatoMultimedialeId FK
  INTEGER GenereId FK
  NVARCHAR(220) Compositori
  INTEGER Millisecondi
  INTEGER Byte
  NUMERIC(10,2) PrezzoUnitario
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

