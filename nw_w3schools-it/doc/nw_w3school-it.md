**categoria** (  **id_categoria**: INTEGER, nome: TEXT, descrizione: TEXT)
**cliente** (  **id_cliente**: INTEGER, azienda: TEXT, referente: TEXT, indirizzo: TEXT, citta: TEXT, cap: TEXT, nazione: TEXT)
**venditore** (  **id_venditore**: INTEGER, cognome: TEXT, nome: TEXT, data: DATE, foto: TEXT, note: MEMO)
**spedizioniere** (  **id_spedizioniere**: INTEGER, nome: TEXT, telefono: TEXT)
**ordine** (  **id_ordine**: INTEGER, _id_cliente_: INT -> cliente(id_cliente), _id_venditore_: INT -> venditore(id_venditore), data_ordine: DATE, _id_spedizioniere_: INT -> spedizioniere(id_spedizioniere))
**composizione** (  _id_ordine_: INT -> ordine(id_ordine), _id_prodotto_: INT -> prodotto(id_prodotto), quantita: INT)
**fornitore** (  **id_fornitore**: INTEGER, azienda: TEXT, referente: TEXT, indirizzo: TEXT, citta: TEXT, cap: TEXT, nazione: TEXT, telefono: TEXT)
**prodotto** (  **id_prodotto**: INTEGER, nome: TEXT, _id_fornitore_: INT -> fornitore(id_fornitore), _id_categoria_: INT -> categoria(id_categoria), formato: TEXT, prezzo: MONEY)
