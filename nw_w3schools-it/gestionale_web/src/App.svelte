<script>
  import { Styles } from "sveltestrap";
  import { TabContent, TabPane, Container, Row, Col } from 'sveltestrap';
  import Navigazione from "./components/Navigazione.svelte";
  import Ordine from "./components/Ordine.svelte";
  export let ordini;
  export let clienti;
  export let composizioni;
  export let prodotti;
  let id_ordine;
  import { aiuti } from './codice_aiuto'
  import { Highlight, HighlightAuto } from "svelte-highlight";
  import xml from "svelte-highlight/languages/xml";
  import php from "svelte-highlight/languages/php";
  import sql from "svelte-highlight/languages/sql";
  import github from "svelte-highlight/styles/github";
</script>

<svelte:head>
  {@html github}
</svelte:head>

<Styles />

<Container>
  <TabContent pills>
    <TabPane tabId="attivita" tab="Attività" active>
      <Row>
        <Col>
            <ol>
                <li>Autenticarsi su <a href="https://replit.com/">replit.com</a></li>
                <li>Cliccare su 
                    <button><div><svg preserveAspectRatio="xMidYMin" width="16" height="16" viewBox="0 0 24 24" color="currentColor" stroke="currentColor" stroke-width="2" fill="transparent" style="vertical-align:middle"><path d="M12 4V20M4 12H20" stroke-linecap="round" stroke-linejoin="round"></path></svg><span>Create</span></div></button>
                </li>
                <li>Cercare e selezionare il template: <span><b>PHP</b> (PDO SQLite)</span></li>
                <li>Inserire come <em>title</em>: <strong><em>COGNOME Nome - Classe - Data</em></strong></li>
                <li>Copiare sul pannello File il database <code>nw_w3school-it.sqlite</code></li>
                <li>Scrivere una o più pagine PHP, o HTML, per realizzare un'applicazione, o un sito statico, che approssima le funzionalità presenti nella scheda <strong>Esempio</strong></li>
                <li>Stampare e spillare il codice sorgente prodotto.</li>
                <li>Inviare il link del progetto su classroom.</li>
            </ol>
        </Col>
    </Row>
    </TabPane>
    <TabPane tabId="esempio" tab="Esempio">
      <Navigazione bind:value={id_ordine} {ordini} />

      <main>
        {#if id_ordine != 0}
          <Ordine id_ordine={id_ordine} {ordini} {clienti} {composizioni} {prodotti}/>
        {/if}
      </main>
      <footer>
        <Row>
          <Col>Copyrigth (c) 2022 by <em>COGNOME Nome Classe</em></Col>
        </Row>
      </footer>
    </TabPane>
    <TabPane tabId="aiuto" tab="Aiuto">
      <ul>
        <li>Per la sintassi dei HTML e PHP vedere <a href="https://replit.com/@gionatamassi/Esempio-compito-sul-PHP#index.php">l'esercitazione per la preparazione</a> di questo compito.</li>
        <li>Per la sintassi dello SQL vedere la <a href="https://www.sqlite.org/syntax/select-core.html">sintassi semplificata del SELECT</a> in SQLite.</li>
        <li>Linguaggio HTML per la casella di riepilogo: 
          <Highlight language={xml} code={aiuti.html_select.src}/></li>
        <li>Esempio di accesso alla base di dati usando PHP e PDO:
          <Highlight language={php} code={aiuti.php_select.src}/></li>
        <li>Query per ottenere il numero e la data dell'ordine: 
          <Highlight code={aiuti.sql_data_ordine.src} language={sql} /></li>
        <li>Query per ottenere l'acquirente dato l'id dell'ordine:
          <Highlight code={aiuti.sql_acquirente_ordine.src} language={sql} /></li>
        <li>Query per ottenere i dati del corpo della tabella dato l'id dell'ordine:
          <Highlight code={aiuti.sql_dettaglio_ordine.src} language={sql} />
        </li>
        <li>Query per ottenere i dati del piede della tabella dato l'id dell'ordine:
          <Highlight code={aiuti.sql_riepilogo_ordine.src} language={sql} />
        </li>
      </ul>
    </TabPane>
    <TabPane tabId="valutazione" tab="Valutazione">
      <dl>
        <dt>HTML, sito statico</dt>
        <dd>6</dd>

        <dt>PHP, solo input dell'ordine dinamico</dt>
        <dd>7</dd>

        <dt>PHP, scelta dell'ordine e tabella statica</dt>
        <dd>8</dd>

        <dt>PHP, scelta dell'ordine e tabella dinamica, senza colonna totale e riga riepilogativa</dt>
        <dd>9</dd>

        <dt>PHP, come da esempio</dt>
        <dd>10</dd>
      </dl>
    </TabPane>
  </TabContent>
</Container>

<style>
  main {
    height: 80vh;
  }
</style>
