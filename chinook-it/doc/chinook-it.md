**Album** (  **albumId**: INTEGER, titolo: TEXT, _artistaId_: INTEGER -> Artista(artistaId))

**Artista** (  **artistaId**: INTEGER, nome: TEXT)

**Cliente** (  **clienteId**: INTEGER, nome: TEXT, cognome: TEXT, societa: TEXT, indirizzo: TEXT, citta: TEXT, stato: TEXT, nazione: TEXT, codicePostale: TEXT, telefono: TEXT, fax: TEXT, email: TEXT, _assistenteId_: INTEGER -> Dipendente(assistenteId))

**Dipendente** (  **dipendenteId**: INTEGER, cognome: TEXT, nome: TEXT, titolo: TEXT, _superioreId_: INTEGER -> Dipendente(superioreId), dataNascita: DATETIME, dataAssunzione: DATETIME, indirizzo: TEXT, citta: TEXT, stato: TEXT, nazione: TEXT, codicePostale: TEXT, telefono: TEXT, fax: TEXT, email: TEXT)

**Genere** (  **genereId**: INTEGER, nome: TEXT)

**Fattura** (  **fatturaId**: INTEGER, _clienteId_: INTEGER -> Cliente(clienteId), dataFatturazione: DATETIME, indirizzoFatturazione: TEXT, cittaFatturazione: TEXT, statoFatturazione: TEXT, nazioneFatturazione: TEXT, codicePostaleFatturazione: TEXT, totale: REAL)

**LineaFattura** (  **lineaFatturaId**: INTEGER, _fatturaId_: INTEGER -> Fattura(fatturaId), _tracciaId_: INTEGER -> Traccia(tracciaId), prezzoUnitario: REAL, quantita: INTEGER)

**FormatoMultimediale** (  **formatoMultimedialeId**: INTEGER, nome: TEXT)

**Playlist** (  **playlistId**: INTEGER, nome: TEXT)

**TracciaPlaylist** (  ***playlistId***: INTEGER -> Playlist(playlistId), ***tracciaId***: INTEGER -> Traccia(tracciaId))

**Traccia** (  **tracciaId**: INTEGER, nome: TEXT, _albumId_: INTEGER -> Album(albumId), _formatoMultimedialeId_: INTEGER -> FormatoMultimediale(formatoMultimedialeId), _genereId_: INTEGER -> Genere(genereId), compositori: TEXT, millisecondi: INTEGER, byte: INTEGER, prezzoUnitario: REAL)

