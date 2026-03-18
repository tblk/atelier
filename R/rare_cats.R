#' Détecter les modalités rares pour une ACM
#'
#' Calcule les fréquences des modalités et retourne celles
#' à exclure (rares et/ou NA recodés).
#'
#' @param data data.frame de variables qualitatives
#' @param min_pct seuil minimal de fréquence (%)
#' @return Un vecteur de modalités à exclure
#' @export
rare_cats = function(data, min_pct = 5) {

  freq_tbl = purrr::map(names(data), function(var_name) {
    tibble::tibble(modalite = data[[var_name]]) |>
      dplyr::count(.data$modalite, name = "effectif") |>
      dplyr::mutate(
        pourcentage = 100 * .data$effectif / sum(.data$effectif),
        variable = var_name
      )
  }) |>
    purrr::list_rbind()

  freq_tbl |>
    dplyr::filter(stringr::str_detect(.data$modalite, "\\sNA$") |
                    .data$pourcentage < min_pct) |>
    dplyr::pull(.data$modalite) |>
    unique()
}
