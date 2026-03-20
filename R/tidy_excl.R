#' tidy excluded modalities
#'
#' @param x A MCA object
#' @param out_pattern pattern to filter out, default to NSP, NA, REFUS
#' @returns a dataframe of excl coordinates
#' @export
#'
tidy_excl_coord = function(x, out_pattern = "(REFUS)|(NSP)|(NA)$") {
  x$excl$coord |>
    as.data.frame() |>
    tibble::rownames_to_column(var = "varmod") |>
    dplyr::rename_with(~stringr::str_replace(.x, " ", "")) |>
    dplyr::rename_with(tolower) |>
    dplyr::rename_with(.cols = dplyr::starts_with("dim"),
                       .fn = ~paste0(.x, "_coord")) |>
    dplyr::filter_out(stringr::str_detect(.data$varmod, out_pattern))
}
