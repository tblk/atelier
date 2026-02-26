# Détecter les modalités rares pour une ACM

Calcule les fréquences des modalités et retourne celles à exclure (rares
et/ou NA recodés).

## Usage

``` r
rare_cats(data, min_pct = 5, detect_na = TRUE, na_pattern = "\\sNA$")
```

## Arguments

- data:

  data.frame de variables qualitatives

- min_pct:

  seuil minimal de fréquence (%)

- detect_na:

  exclure les modalités correspondant à NA recodés

- na_pattern:

  regex identifiant les NA recodés

## Value

Un vecteur de modalités à exclure
