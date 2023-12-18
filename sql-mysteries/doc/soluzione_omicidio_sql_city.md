<!--
author:   Gionata Massi

email:    gionata.massi@savoiabenincasa.it

version:  0.0.2

language: it

narrator: IT Italian Male

comment:  Il gioco didattico "Omicidio a SQL City".

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

-->

# Omicidio a SQL City

Viene fornita una base di dati in un file, formato SQLite3.

Dobbiamo risolvere un caso sapendo che si tratta di un omicidio
accaduto a 'SQL City' in data 15 gennaio 2018.

## Scoprire dove cercare i dati

Verifico quale sia lo schema della base di dati.

```sql
SELECT *
FROM sqlite_master;
```
Focalizzo l'attenzione su

| Type  | Name                          |
| ----- | ----------------------------- |
| table | rapporto\_scena\_del\_crimine |

Verifico il tipo delle colonne.

```sql
PRAGMA table_info(rapporto_scena_del_crimine);
```

| cid | name        | type    | notnull | dflt_value | pk  |
| --- | ----------- | ------- | ------- | ---------- | --- |
| 0   | data        | INTEGER | 0       | 0          |     |
| 1   | tipo        | TEXT    | 0       | 0          |     |
| 2   | descrizione | TEXT    | 0       | 0          |     |
| 3   | luogo       | TEXT    | 0       | 0          |     |


## La descrizione del crimine

```sql
SELECT descrizione
  FROM rapporto_scena_del_crimine
 WHERE data = 20180115 AND 
       tipo LIKE 'omicidio' AND 
       luogo LIKE 'SQL City';
```

> I filmati di sicurezza mostrano che c'erano 2 testimoni.
>
> Il primo testimone abita nell'ultima casa sulla "Northwestern Dr".
>
> La seconda testimone, di nome Annabel, vive da qualche parte in "Franklin Ave".

## I testimoni

Si devono realizzare interrogazioni sulla tabella `persona`.

Mi servirà trovare l'ID.

La seconda sembra più semplice per cui inziamo da questa.

### Secondo testimone

Partiamo dal secondo testimone:

> La seconda testimone, di nome Annabel, vive da qualche parte in "Franklin Ave"

```sql
SELECT *
  FROM persona
 WHERE nome LIKE '%Annabel%' AND 
       indirizzo LIKE '%Franklin Ave%';
```

### Primo testimone

> Il primo testimone abita nell'ultima casa sulla "Northwestern Dr".

#### Prima idea, in due passi

1. Cerco il numero civico più elevato tra quelli di "Northwestern Dr".

```sql
SELECT MAX(numero_civico)
FROM persona
WHERE indirizzo LIKE 'Northwestern Dr'
```

2. Avendo ottenuto 4919, posso determinare la persona

```sql
SELECT *
FROM persona
WHERE indirizzo LIKE 'Northwestern Dr' AND
        numero_civico = 4919
```

#### Seconda idea

1. Annido la prima query scritta sopra nella seconda

```sql
SELECT *
FROM persona
WHERE indirizzo LIKE 'Northwestern Dr' AND
        numero_civico = (
            SELECT MAX(numero_civico)
            FROM persona
            WHERE indirizzo LIKE 'Northwestern Dr'
        )
```

#### Terza idea

1. Ordino in modo decrescente le persone che vivono in 'Northwestern Dr' in base al numero civico e considero solo la prima riga

```sql
SELECT *
FROM persona
WHERE indirizzo LIKE 'Northwestern Dr'
ORDER BY numero_civico DESC
LIMIT 1
```

#### Soluzione

```sql
SELECT id
FROM persona
WHERE indirizzo = 'Northwestern Dr' AND
    numero_civico = 
    (SELECT MAX(numero_civico)
        FROM persona
        WHERE indirizzo = 'Northwestern Dr')

UNION

SELECT id
  FROM persona
 WHERE nome LIKE '%Annabel%' AND 
       indirizzo LIKE '%Franklin Ave%'
```

```txt
14887
16371
```

## Trascrizioni degli interrogatori

### Prima idea: OR

```sql
SELECT *
FROM interrogatorio
WHERE persona_id = 14887 OR
      persona_id = 16371
```

### Seconda idea: IN

```sql
SELECT *
FROM interrogatorio
WHERE persona_id IN (14887, 16371)
```

### Soluzione

1. Senza CTE

```sql
SELECT *
FROM interrogatorio
WHERE persona_id IN (
    SELECT id
    FROM persona
    WHERE indirizzo = 'Northwestern Dr' AND
        numero_civico = 
        (SELECT MAX(numero_civico)
            FROM persona
            WHERE indirizzo = 'Northwestern Dr')
    
    UNION
    
    SELECT id
      FROM persona
     WHERE nome LIKE '%Annabel%' AND 
           indirizzo LIKE '%Franklin Ave%'
)
```

2. Con CTE

```sql
WITH testimoni (id) AS
(
    SELECT id
    FROM persona
    WHERE indirizzo = 'Northwestern Dr' AND
        numero_civico = 
        (SELECT MAX(numero_civico)
            FROM persona
            WHERE indirizzo = 'Northwestern Dr')
  
    UNION
    
    SELECT id
      FROM persona
     WHERE nome LIKE '%Annabel%' AND 
           indirizzo LIKE '%Franklin Ave%'
)
SELECT trascrizione
FROM interrogatorio
WHERE persona_id IN testimoni
```

3. Con più CTE

```sql
WITH
    massimo_civico AS (
		SELECT MAX(numero_civico) AS numero
		FROM persona
		WHERE indirizzo = 'Northwestern Dr'
	),
	testimone_1 AS (
		SELECT id
		FROM persona INNER JOIN 
			massimo_civico ON
			persona.numero_civico = massimo_civico.numero
		WHERE indirizzo = 'Northwestern Dr'
	),
    testimone_2 AS (
        SELECT id
        FROM persona
        WHERE nome LIKE '%Annabel%' AND
              indirizzo = 'Franklin Ave'
    )
SELECT trascrizione
FROM interrogatorio
WHERE persona_id IN (
    SELECT id FROM testimone_1
    UNION
    SELECT id FROM testimone_2
)
```


> Ho sentito uno sparo e poi ho visto un uomo correre fuori. Aveva una borsa "Get Fit Now Gym". Il numero di iscrizione sulla borsa iniziava con "48Z". Solo i membri Gold hanno quelle borse. L'uomo è salito su un''auto con la targa con scritto "H42W" ma non so se erano all'inizio, alla fine o al centro.
>
> Ho visto accadere l'omicidio e ho riconosciuto l'assassino nella mia palestra mentre mi allenavo la settimana scorsa, il 9 gennaio.



## Sospettato

```sql
SELECT *
  FROM get_fit_now_iscrizione AS iscr
       INNER JOIN
       persona AS pers ON iscr.persona_id = pers.id
       INNER JOIN
       patente AS pat ON pers.patente_id = pat.id
       INNER JOIN
       get_fit_now_ingresso AS ingr ON iscr.id = ingr.tessera_id
 WHERE tipo_iscrizione = 'gold' AND 
       iscr.id LIKE '48Z%' AND 
       targa LIKE '%H42W%' AND 
       data_ingresso = 20180109;
```