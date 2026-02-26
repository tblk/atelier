# Title

Title

## Usage

``` r
legend_inside(justification = c(0, 1))
```

## Arguments

- justification:

  A vector of length 2

## Value

A ggplot object with legend insid

## Details

Cette fonction doit être utilisée AVANT theme\_...() Avec theme_set()
toutefois, ça ne pose aucun problème.

## Examples

``` r
library(ggplot2)
penguins |>
ggplot(aes(x = bill_len, y = flipper_len, colour = species)) +
  geom_point() +
  legend_inside()
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_point()`).
```
