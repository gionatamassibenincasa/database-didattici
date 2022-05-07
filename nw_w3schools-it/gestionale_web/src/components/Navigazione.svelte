<script>
  export let ordini;
  export let value = "";
  import {
    Collapse,
    Form,
    Navbar,
    NavbarBrand,
    Nav,
    NavItem,
  } from "sveltestrap";

  let generaLink = (evento) => {
    value = evento.target.value;
  };
</script>

<Navbar color="light" light expand="md">
  <NavbarBrand href="/">Sistema Informativo Aziendale (SIA)</NavbarBrand>
  <Collapse navbar expand="md">
    <Nav class="ms-auto" navbar>
      <NavItem>
        <Form method="get">
          <label for="ordine"
            >Scegli l'ordine:
            <select id="ordine" name="id_ordine" on:change="{generaLink}">
              <option value="0">Scegli un'ordine</option>
              {#each $$props.ordini as ordine}
                <option value="{ordine['id_ordine']}"
                  >n. {ordine["id_ordine"]} del {ordine["data_ordine"]}</option
                >
              {/each}
            </select>
          </label>
        </Form>
      </NavItem>
    </Nav>
  </Collapse>
</Navbar>
