# Détecter les modalités rares pour une ACM

Calcule les fréquences des modalités et retourne celles à exclure (rares
et/ou NA recodés).

## Usage

``` r
rare_cats(data, min_pct = 5)
```

## Arguments

- data:

  data.frame de variables qualitatives

- min_pct:

  seuil minimal de fréquence (%)

## Value

Un vecteur de modalités à exclure
