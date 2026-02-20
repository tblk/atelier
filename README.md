
<!-- README.md is generated from README.Rmd. Please edit that file -->

# atelier

<!-- badges: start -->

<!-- badges: end -->

The goal of atelier is to gather small helper functions I use across my
projects.

## Installation

You can install the development version of atelier from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("tblk/atelier")
```

## Strings

Useful before `case_match()` for example :

``` r
atelier::acronym("Robert Hertz")
#> [1] "rh"
```

## Plots

``` r
library(ggplot2)
penguins |>
  ggplot(aes(x = bill_len,
             y = flipper_len,
             colour = species)) +
  geom_point() +
  theme_minimal() +
  atelier::legend_inside() # after calling theme_minimal()
#> Warning: Removed 2 rows containing missing values or values outside the scale range
#> (`geom_point()`).
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />
