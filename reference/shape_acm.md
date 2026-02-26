# Pipeline complet ACM

Pipeline complet ACM

## Usage

``` r
shape_acm(
  data,
  var_actives,
  var_sup = NULL,
  excl = atelier::rare_cats,
  ncp = 6
)
```

## Arguments

- data:

  data.frame source

- var_actives:

  variables actives

- var_sup:

  variables supplémentaires

- excl:

  fonction ou vecteur de modalités exclues

- ncp:

  nombre de dimensions

## Value

objet FactoMineR::MCA
