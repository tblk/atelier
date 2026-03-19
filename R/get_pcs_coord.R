#' Get PCS coord after dimension reduction
#'
#' @param data a dataframe with dimensions and pcs grouping variables
#' @param var a pcs niv
#'
#' @returns a summarised dataframe
#' @export
#'
get_pcs_coord = function(data, var) {
  data |>
    dplyr::filter(!is.na(.data[[var]])) |>
    dplyr::summarise(
      dplyr::across(
        dplyr::starts_with("dim"),
        mean),
      .by = dplyr::all_of(var)) |>
    dplyr::rename(pcs_code = dplyr::all_of(var)) |>
    dplyr::mutate(pcs_code = as.character(.data$pcs_code))
}
