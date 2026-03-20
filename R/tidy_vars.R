#' tidy active vars MCA metrics
#'
#' @param x Le résultat de FactoMineR::MCA
#' @return Un data.frame avec toutes les informations sur les
#' variables/modalités actives
#' @export
tidy_vars = function(x) {

  x$var[1:4] |>
    purrr::map(~as.data.frame(.x) |>
                 tibble::rownames_to_column(var = "varmod")) |>
    purrr::list_rbind(names_to = "indicateur") |>
    dplyr::rename_with(~stringr::str_replace(.x, " ", "")) |>
    dplyr::rename_with(tolower) |>
    tidyr::pivot_wider(names_from = .data$indicateur,
                       values_from = dplyr::starts_with("dim"),
                       names_sep = "_")

}
