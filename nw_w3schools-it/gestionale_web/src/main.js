import App from "./App.svelte";
import tabelle from "./nw_w3school-it.json";

const app = new App({
  target: document.body,
  props: {
    ordini: tabelle['ordine'],
    clienti: tabelle['cliente'],
    composizioni: tabelle['composizione'],
    prodotti: tabelle['prodotto']
  },
});

export default app;
