#' tidy excluded modalities
#'
#' @param x A MCA object
#'
#' @returns a dataframe of excl coordinates
#' @export
#'
tidy_excl_coord = function(x) {
  x$excl$coord |>
    as.data.frame() |>
    tibble::rownames_to_column(var = "variable_modalite") |>
    dplyr::rename_with(~stringr::str_replace(.x, " ", "")) |>
    dplyr::rename_with(tolower) |>
    dplyr::rename_with(~paste0(.x, "_coord"))
}
