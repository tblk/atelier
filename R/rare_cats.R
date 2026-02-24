#' Détecter les modalités rares pour une ACM
#'
#' Calcule les fréquences des modalités et retourne celles
#' à exclure (rares et/ou NA recodés).
#'
#' @param data data.frame de variables qualitatives
#' @param min_pct seuil minimal de fréquence (%)
#' @param detect_na exclure les modalités correspondant à NA recodés
#' @param na_pattern regex identifiant les NA recodés
#'
#' @return Un vecteur de modalités à exclure
#' @export
rare_cats <- function(
    data,
    min_pct = 5,
    detect_na = TRUE,
    na_pattern = "\\sNA$"
) {

  # ---- fréquences ----
  freq_tbl <-
    purrr::map(names(data), function(var_name) {
      tibble::tibble(modalite = data[[var_name]]) |>
        dplyr::count(.data$modalite, name = "effectif") |>
        dplyr::mutate(
          pourcentage = 100 * .data$effectif / sum(.data$effectif),
          variable = var_name
        )
    }) |>
    purrr::list_rbind()

  # ---- condition rareté ----
  rare_cond <- freq_tbl$pourcentage < min_pct

  # ---- condition NA robuste ----
  if (detect_na) {
    na_cond <- stringr::str_detect(freq_tbl$modalite, na_pattern)
  } else {
    na_cond <- FALSE
  }

  # ---- modalités exclues ----
  to_exclude <-
    freq_tbl |>
    dplyr::filter(rare_cond | na_cond) |>
    dplyr::pull(.data$modalite) |>
    unique()

  return(to_exclude)
}
