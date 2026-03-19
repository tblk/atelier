
#' Title
#'
#' @param data A dataframe with active variables only
#' @param min_pct Minimum threshold to keep modalities
#'
#' @returns A FactoMineR MCA
#' @export
#'
acm = function(data, min_pct) {

  data_prepared = atelier::prep4acm(data)

  to_exclude = atelier::rare_cats(data_prepared,
                                  min_pct = min_pct)

  FactoMineR::MCA(data_prepared, excl = to_exclude)

}
