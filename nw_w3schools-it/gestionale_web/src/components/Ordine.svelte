<script>
    import {Table} from "sveltestrap";
    export let id_ordine = -1;
    export let ordini = null;
    export let clienti = null;
    export let composizioni = null;
    export let prodotti = null;
    
    let azienda;
    let data_ordine;
    let acquisti = [];
    let totale = 0;

    const query = (tabella, attr_chiave, val_chiave, attributo) => {
        const riga = tabella.findIndex(e => e[attr_chiave] == val_chiave);
        if (riga != -1) return tabella[riga][attributo];
        return '';
    }

    $: {
        try {            
            const indiceOrdine = ordini.findIndex(o => o['id_ordine'] == id_ordine);
            const ordine = ordini[indiceOrdine];
            data_ordine = ordine['data_ordine'];
            
            const id_cliente = ordine['id_cliente'];
            azienda = query (clienti, "id_cliente", id_cliente, "azienda");
            acquisti = composizioni.filter(a => a['id_ordine'] == id_ordine);

            totale = 0;
            acquisti.forEach(a => {
                totale += a.quantita * parseFloat(query(prodotti, "id_prodotto", a.id_prodotto, "prezzo"));
            });
        } catch (e) {
            console.log(e);
        }
    }

</script>

<Table bordered striped>
    <caption>Ordine n. <strong>{id_ordine}</strong> del <strong>{data_ordine}</strong>
         venduto a <strong><em>{azienda}</em></strong></caption>
    <thead>
        <tr>
            <th>Codice prodotto</th>
            <th>Prodotto</th>
            <th>Quantità</th>
            <th>Prezzo unitario</th>
            <th>Prezzo totale</th>
        </tr>
    </thead>
    <tbody>
        {#each acquisti as p}
        <tr>
            <td>{p.id_prodotto}</td>
            <td>{query(prodotti, "id_prodotto", p.id_prodotto, "nome")}</td>
            <td>{p.quantita}</td>
            <td>{query(prodotti, "id_prodotto", p.id_prodotto, "prezzo")}</td>
            <td>{parseInt(p.quantita) * parseFloat(query(prodotti, "id_prodotto", p.id_prodotto, "prezzo"))}</td>
        </tr>            
        {/each}
    </tbody>
    <tfoot>
        <th></th>
        <th></th>
        <th>{acquisti.reduce((a, q) => a + q.quantita, 0)}</th>
        <th></th>
        <th>{totale}</th>
    </tfoot>
</Table>