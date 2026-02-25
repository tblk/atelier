#' Exécuter une ACM
#'
#' @param data_prepare données préparées
#' @param excl fonction ou vecteur de modalités à exclure
#' @param quali_sup indices des variables supplémentaires
#' @param ncp nombre de dimensions
#'
#' @return objet FactoMineR::MCA
#' @export
run_acm <- function(
    data_prepare,
    excl = NULL,
    quali_sup = NULL,
    ncp = 6
) {

  # autorise excl = fonction
  if (is.function(excl)) {
    excl <- excl(data_prepare)
  }

  FactoMineR::MCA(
    data_prepare,
    excl = excl,
    quali.sup = quali_sup,
    ncp = ncp,
    graph = FALSE
  )
}
