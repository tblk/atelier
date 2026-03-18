#' Préparer des données pour une ACM
#'
#' @param data data.frame contenant uniquement les variables
#' actives de l'ACM, prélablement sélectionnées.
#' @return data.frame prêt pour FactoMineR::MCA
#' @export
prep4acm = function(data) {

  data |>
    dplyr::mutate(id = dplyr::row_number()) |>
    tibble::column_to_rownames("id") |>
    dplyr::mutate(
      dplyr::across(
        dplyr::everything(),
        ~ paste(dplyr::cur_column(), .x)
      )
    )
}
