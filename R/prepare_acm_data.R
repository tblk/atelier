#' Préparer des données pour une ACM
#'
#' @param data data.frame source
#' @param var_actives variables actives
#' @param var_sup variables supplémentaires
#'
#' @return data.frame prêt pour FactoMineR::MCA
#' @export
prepare_acm_data <- function(
    data,
    var_actives,
    var_sup = NULL
) {

  if (!is.data.frame(data)) {
    rlang::abort("`data` must be a data.frame.")
  }

  vars_all <- c(var_sup, var_actives)

  missing_vars <- setdiff(vars_all, names(data))
  if (length(missing_vars) > 0) {
    rlang::abort(
      paste(
        "Variables not found in `data`:",
        paste(missing_vars, collapse = ", ")
      )
    )
  }

  if (length(intersect(var_actives, var_sup)) > 0) {
    rlang::abort("`var_actives` and `var_sup` must not overlap.")
  }

  data |>
    dplyr::select(dplyr::all_of(vars_all)) |>
    dplyr::mutate(id = dplyr::row_number()) |>
    tibble::column_to_rownames("id") |>
    dplyr::mutate(
      dplyr::across(
        dplyr::everything(),
        ~ paste(dplyr::cur_column(), .x)
      )
    )
}
