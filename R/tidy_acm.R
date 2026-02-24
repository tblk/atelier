#' Construire un tableau consolidé des résultats d'ACM
#'
#' @param res_acm Objet résultat d'une ACM (ex: FactoMineR::MCA)
#'
#' @return Un data.frame contenant les modalités actives,
#' exclues et supplémentaires.
#' @export
tidy_acm <- function(res_acm) {

  # ---- fonction interne de nettoyage ----
  clean_acm_block <- function(x, statut, n_elements) {

    purrr::map(x[seq_len(n_elements)], function(.x) {
      as.data.frame(.x)
    }) |>
      purrr::map(function(.x) {
        dplyr::rename_with(.x, tolower)
      }) |>
      purrr::map(function(.x) {
        dplyr::rename_with(
          .x,
          ~ stringr::str_replace(.x, "\\.", "")
        )
      }) |>
      purrr::map(function(.x) {
        dplyr::rename_with(
          .x,
          ~ stringr::str_replace(.x, " ", "")
        )
      }) |>
      purrr::map2(
        .y = names(x)[seq_len(n_elements)],
        .f = function(df, nm) {
          dplyr::rename_with(
            df,
            ~ stringr::str_c(.x, nm, sep = "_")
          )
        }
      ) |>
      purrr::map(function(.x) {
        dplyr::mutate(
          .x,
          modalite = rownames(.x)
        )
      }) |>
      purrr::reduce(dplyr::left_join) |>
      dplyr::relocate(.data$modalite) |>
      dplyr::mutate(statut = statut)
  }

  # ---- blocs ACM ----
  acm_var <- clean_acm_block(
    x = res_acm$var,
    statut = "active",
    n_elements = 4
  )

  acm_excl <- clean_acm_block(
    x = res_acm$excl,
    statut = "excl",
    n_elements = 3
  )

  acm_sup <- clean_acm_block(
    x = res_acm$quali.sup,
    statut = "supplementaire",
    n_elements = 3
  )

  # ---- assemblage final ----
  acm_results <-
    dplyr::bind_rows(acm_var, acm_excl) |>
    dplyr::bind_rows(acm_sup) |>
    tidyr::separate_wider_delim(
      .data$modalite,
      delim = " ",
      names = c("variable", "modalite")
    )

  return(acm_results)
}
