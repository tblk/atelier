#' Get weighted mean and quantiles by group
#'
#' @param data A dataframe
#' @param vars A character vector of variables to summarise
#' @param groups A character vector of variables to group by
#' @param weights The weights variable
#'
#' @returns A dataframe
#' @export
#'
#' @examples
#' full_wtd_summarise(data = penguins, vars = "bill_len", groups = "species", weights = "body_mass")
full_wtd_summarise = function(data, vars, groups, weights) {
  probs = c(0.1, 0.25, 0.5, 0.75, 0.9)
  data |>
    dplyr::summarise(dplyr::across(.cols = dplyr::all_of(vars),
                                   .fns = ~collapse::fquantile(.x,
                                                               probs = probs,
                                                               w = .data[[weights]],
                                                               names = FALSE) |>
                                     purrr::set_names(probs * 100) |>
                                     list(),
                                   .names = "{.col}_q"),
                     dplyr::across(.cols = dplyr::all_of(vars),
                                   .fns = ~collapse::fmean(.x, w = .data[[weights]]),
                                   .names = "{.col}_mean"),
                     .by = dplyr::all_of(groups)) |>
    tidyr::unnest_wider(dplyr::ends_with("_q"),
                        names_sep = "")
}
