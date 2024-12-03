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

## 6. Titolo dei film categoria 'Comedy'

$\pi_\mathrm{titolo}
  \left(
    \sigma_{\mathrm{nome}='\mathrm{Comedy}'}
      \left(
        \mathrm{film} \bowtie \mathrm{film\_categoria} \bowtie {categoria}
      \right)
 \right)$

```text
-- 6. Elenca il titolo dei film della categoria 'Comedy'
π titolo (σ nome='Comedy' (film ⨝ film_categoria ⨝ categoria))
```

Oppure, con $\theta$-join

```text
-- 6. Elenca il titolo dei film della categoria 'Comedy'
π titolo (σ nome='Comedy' (((film) ⨝ film.film_id=film_categoria.film_id (film_categoria)) ⨝ film_categoria.categoria_id=categoria.categoria_id (categoria)))
```
Oppure, con assegnamenti

```text
-- 6. Elenca il titolo dei film della categoria 'Comedy'
film_con_id_categoria=(film) ⨝ film.film_id=film_categoria.film_id (film_categoria)
film_con_categoria=(film_con_id_categoria) ⨝ film_categoria.categoria_id=categoria.categoria_id (categoria)
commedie=σ nome='Comedy' (film_con_categoria)
π titolo (commedie)
```
## 7. Categorie diverse da 'Horror'

$\pi_\mathrm{nome}
  \left(
    \sigma_{\mathrm{nome}\neq'\mathrm{Horror}'}
      \left(
        \mathrm{categoria}
      \right)
  \right)$

```text
-- 7. Elenca le categorie diverse da 'Horror'
π nome (σ nome≠'Horror' (categoria))
```

## 8. Titolo e descrizione dei film  'Horror'

$\pi_\mathrm{titolo,descrizione}
  \left(
    \sigma_{\mathrm{nome}='\mathrm{Horror}'}
      \left(
        \mathrm{film} \bowtie \mathrm{film\_categoria} \bowtie {categoria}
      \right)
 \right)$

```text
-- 8. Elenca i titoli e la descrizione dei film della categoria 'Horror'
π titolo,descrizione (σ nome='Horror' (film ⨝ film_categoria ⨝ categoria))
```

## 9. Nome attori che hanno recitato in film 'Horror'

$\pi_\mathrm{attore.nome}
  \left(
    \sigma_{\mathrm{categoria.nome}='\mathrm{Horror}'}
      \left(
        \left(
          \mathrm{attore} \bowtie \mathrm{film\_attore} \bowtie {film} \bowtie {film\_categoria} 
        \right) \bowtie_{film\_categoria.categoria\_id=categoria.categoria\_id} \mathrm{categoria}
      \right)
 \right)
$

```text
-- 9. Elenca il nome degli attori che hanno recitato in almeno un film della categoria 'Horror'
π attore.nome (
	σ categoria.nome='Horror' (
		(attore ⨝ film_attore ⨝ film ⨝ film_categoria) ⨝ film_categoria.categoria_id=categoria.categoria_id (categoria)
  )
)
```

