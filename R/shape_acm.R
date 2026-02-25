#' Pipeline complet ACM
#'
#' @param data data.frame source
#' @param var_actives variables actives
#' @param var_sup variables supplémentaires
#' @param excl fonction ou vecteur de modalités exclues
#' @param ncp nombre de dimensions
#'
#' @return objet FactoMineR::MCA
#' @export
shape_acm <- function(
    data,
    var_actives,
    var_sup = NULL,
    excl = atelier::rare_cats,
    ncp = 6
) {

  data_prepare <-
    prepare_acm_data(
      data = data,
      var_actives = var_actives,
      var_sup = var_sup
    )

  quali_sup_index <- if (!is.null(var_sup)) {
    seq_along(var_sup)
  } else {
    NULL
  }

  run_acm(
    data_prepare = data_prepare,
    excl = excl,
    quali_sup = quali_sup_index,
    ncp = ncp
  )
}
