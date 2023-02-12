**TipoMorsetto** (  **tipoMorsettoId**: INTEGER, tipo: TEXT, diametro: INTEGER)

**TipoCavo** (  **tipoCavoId**: INTEGER, cavo: TEXT, colore: TEXT, sezione: REAL)

**TipoFrutto** (  **tipoFruttoId**: INTEGER, frutto: TEXT, note: TEXT)

**Parete** (  **pareteId**: INTEGER, parete: TEXT)

**TipoScatola** (  **TipoScatolaId**: INTEGER, tipoScatola: TEXT, lunghezza: REAL, larghezza: REAL, profondita: REAL, moduli: INTEGER, descrizione: TEXT)

**Scatola** (  **scatolaId**: INTEGER, _tipoScatolaId_: INTEGER -> TipoScatola(tipoScatolaId), _pareteId_: INTEGER -> Parete(pareteId), _spigolo_: INTEGER -> Parete(spigolo), distanzaSpigolo: INTEGER, altezzaTerra: INTEGER, tipo: TEXT, descrizione: TEXT)

**Canalizzazione** (  **canalizzazioneId**: INTEGER, _scatolaOrigineId_: INTEGER -> Scatola(scatolaOrigineId), _scatolaDestinazioneId_: INTEGER -> Scatola(scatolaDestinazioneId), diametro: INTEGER, lunghezza: INTEGER, descrizione: TEXT, cavi: INTEGER)

**Linea** (  **lineaId**: INTEGER, linea: TEXT)

**Cavo** (  **cavoId**: INTEGER, _tipoCavoId_: INTEGER -> TipoCavo(tipoCavoId), _lineaId_: INTEGER -> Linea(lineaId), _canalizzazioneId_: INTEGER -> Canalizzazione(canalizzazioneId))

**Frutto** (  **fruttoId**: INTEGER, _tipoFruttoId_: INTEGER -> TipoFrutto(tipoFruttoId), _scatolaId_: INTEGER -> Scatola(scatolaId), posizione: INTEGER)

**Connessione** (  ***cavoOrigineId***: INTEGER -> Cavo(cavoOrigineId), ***cavoDestinazioneId***: INTEGER -> Cavo(cavoDestinazioneId), _tipoMorsettoId_: INTEGER -> TipoMorsetto(tipoMorsettoId))

