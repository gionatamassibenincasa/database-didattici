erDiagram
 Categoria {
  INTEGER id_categoria PK
  TEXT nome
  TEXT descrizione
 }

 Cliente {
  INTEGER id_cliente PK
  TEXT azienda
  TEXT referente
  TEXT indirizzo
  TEXT citta
  TEXT cap
  TEXT nazione
 }

 Venditore {
  INTEGER id_venditore PK
  TEXT cognome
  TEXT nome
  TEXT data
  TEXT foto
  TEXT note
 }

 Spedizioniere {
  INTEGER id_spedizioniere PK
  TEXT nome
  TEXT telefono
 }

 Ordine {
  INTEGER id_ordine PK
  INTEGER id_cliente FK
  INTEGER id_venditore FK
  TEXT data_ordine
  INTEGER id_spedizioniere FK
 }

 Composizione {
  INTEGER id_ordine FK
  INTEGER id_prodotto FK
  INTEGER quantita
 }

 Fornitore {
  INTEGER id_fornitore PK
  TEXT azienda
  TEXT referente
  TEXT indirizzo
  TEXT citta
  TEXT cap
  TEXT nazione
  TEXT telefono
 }

 Prodotto {
  INTEGER id_prodotto PK
  TEXT nome
  INTEGER id_fornitore FK
  INTEGER id_categoria FK
  TEXT formato
  REAL prezzo
 }

 Ordine }o--|| Spedizioniere : id_spedizioniere
 Ordine }o--|| Venditore : id_venditore
 Ordine }o--|| Cliente : id_cliente
 Composizione }o--|| Prodotto : id_prodotto
 Composizione }o--|| Ordine : id_ordine
 Prodotto }o--|| Categoria : id_categoria
 Prodotto }o--|| Fornitore : id_fornitore

