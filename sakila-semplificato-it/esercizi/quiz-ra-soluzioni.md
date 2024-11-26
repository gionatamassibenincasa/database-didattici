# Soluzione

## 1. Nomi delle categorie

$\pi_\mathrm{nome} (\mathrm{categoria})$

```text
-- 1. Elenca i nomi delle categorie
π nome (categoria)
```

## 2. Titoli dei film

$\pi_\mathrm{titolo} (\mathrm{film})$

```text
-- 2. Elenca i titoli dei film
π titolo (film)
```

## 3. Anno di uscita dei film

$\pi_\mathrm{anno} (\mathrm{film})$

```text
-- 3. Elenca l'anno di uscita dei film
π anno (film)
```

## 4. Titolo e anno dei film del 2006

$\pi_\mathrm{titolo,anno} (\sigma_{\mathrm{anno}=2006}(\mathrm{film}))$

```text
-- 4. Elenca il titolo e l'anno dei film usciti nel 2006
π titolo,anno (σ anno='2006' (film))
```

Nota: anno è un attributo di tipo testo.

## 5. Nome e cognome attori nome 'JOHNNY'

$\pi_\mathrm{nome,cognome} (\sigma_{\mathrm{nome}=\mathrm{JOHNNY}}(\mathrm{attore}))$

```text
-- 5. Elenca il nome e il cognome degli attori che si chiamano 'JOHNNY'
π nome,cognome (σ nome='JOHNNY' (attore))
```
