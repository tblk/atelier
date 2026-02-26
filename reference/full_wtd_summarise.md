# Get weighted mean and quantiles by group

Get weighted mean and quantiles by group

## Usage

``` r
full_wtd_summarise(data, vars, groups, weights)
```

## Arguments

- data:

  A dataframe

- vars:

  A character vector of variables to summarise

- groups:

  A character vector of variables to group by

- weights:

  The weights variable

## Value

A dataframe

## Examples

``` r
full_wtd_summarise(data = penguins, vars = "bill_len", groups = "species", weights = "body_mass")
#> # A tibble: 3 × 7
#>   species   bill_len_q10 bill_len_q25 bill_len_q50 bill_len_q75 bill_len_q90
#>   <fct>            <dbl>        <dbl>        <dbl>        <dbl>        <dbl>
#> 1 Adelie            35.6         37           39           40.9         42.2
#> 2 Gentoo            43.7         45.5         47.5         49.8         51.1
#> 3 Chinstrap         45.3         46.4         49.7         51.3         52.2
#> # ℹ 1 more variable: bill_len_mean <dbl>
```
