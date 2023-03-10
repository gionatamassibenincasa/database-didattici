**Categoria** (  **id_categoria**: INTEGER, nome: TEXT, descrizione: TEXT)

**Cliente** (  **id_cliente**: INTEGER, azienda: TEXT, referente: TEXT, indirizzo: TEXT, citta: TEXT, cap: TEXT, nazione: TEXT)

**Venditore** (  **id_venditore**: INTEGER, cognome: TEXT, nome: TEXT, data: TEXT, foto: TEXT, note: TEXT)

**Spedizioniere** (  **id_spedizioniere**: INTEGER, nome: TEXT, telefono: TEXT)

**Ordine** (  **id_ordine**: INTEGER, _id_cliente_: INTEGER -> Cliente(id_cliente), _id_venditore_: INTEGER -> Venditore(id_venditore), data_ordine: TEXT, _id_spedizioniere_: INTEGER -> Spedizioniere(id_spedizioniere))

**Composizione** (  _id_ordine_: INTEGER -> Ordine(id_ordine), _id_prodotto_: INTEGER -> Prodotto(id_prodotto), quantita: INTEGER)

**Fornitore** (  **id_fornitore**: INTEGER, azienda: TEXT, referente: TEXT, indirizzo: TEXT, citta: TEXT, cap: TEXT, nazione: TEXT, telefono: TEXT)

**Prodotto** (  **id_prodotto**: INTEGER, nome: TEXT, _id_fornitore_: INTEGER -> Fornitore(id_fornitore), _id_categoria_: INTEGER -> Categoria(id_categoria), formato: TEXT, prezzo: REAL)

