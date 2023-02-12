erDiagram
 TipoMorsetto {
  INTEGER tipoMorsettoId PK
  TEXT tipo
  INTEGER diametro
 }

 TipoCavo {
  INTEGER tipoCavoId PK
  TEXT cavo
  TEXT colore
  REAL sezione
 }

 TipoFrutto {
  INTEGER tipoFruttoId PK
  TEXT frutto
  TEXT note
 }

 Parete {
  INTEGER pareteId PK
  TEXT parete
 }

 TipoScatola {
  INTEGER TipoScatolaId PK
  TEXT tipoScatola
  REAL lunghezza
  REAL larghezza
  REAL profondita
  INTEGER moduli
  TEXT descrizione
 }

 Scatola {
  INTEGER scatolaId PK
  INTEGER tipoScatolaId FK
  INTEGER pareteId FK
  INTEGER spigolo FK
  INTEGER distanzaSpigolo
  INTEGER altezzaTerra
  TEXT tipo
  TEXT descrizione
 }

 Canalizzazione {
  INTEGER canalizzazioneId PK
  INTEGER scatolaOrigineId FK
  INTEGER scatolaDestinazioneId FK
  INTEGER diametro
  INTEGER lunghezza
  TEXT descrizione
  INTEGER cavi
 }

 Linea {
  INTEGER lineaId PK
  TEXT linea
 }

 Cavo {
  INTEGER cavoId PK
  INTEGER tipoCavoId FK
  INTEGER lineaId FK
  INTEGER canalizzazioneId FK
 }

 Frutto {
  INTEGER fruttoId PK
  INTEGER tipoFruttoId FK
  INTEGER scatolaId FK
  INTEGER posizione
 }

 Connessione {
  INTEGER cavoOrigineId PK
  INTEGER cavoDestinazioneId PK
  INTEGER tipoMorsettoId FK
 }

 Scatola }o--|| Parete : spigolo
 Scatola }o--|| Parete : pareteId
 Scatola }o--|| TipoScatola : tipoScatolaId
 Canalizzazione }o--|| Scatola : scatolaDestinazioneId
 Canalizzazione }o--|| Scatola : scatolaOrigineId
 Cavo }o--|| Canalizzazione : canalizzazioneId
 Cavo }o--|| Linea : lineaId
 Cavo }o--|| TipoCavo : tipoCavoId
 Frutto }o--|| Scatola : scatolaId
 Frutto }o--|| TipoFrutto : tipoFruttoId
 Connessione }o--|| TipoMorsetto : tipoMorsettoId
 Connessione }o--|| Cavo : cavoDestinazioneId
 Connessione }o--|| Cavo : cavoOrigineId

