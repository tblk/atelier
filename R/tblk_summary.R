#' Personnalised tbl_summary
#'
#' @param data A dataframe
#' @param vars A named list, with variable names as names,
#' and labels
#' @param by Optionnal grouping variable
#' @param missing_text Label for missing text
#'
#' @returns A gtsummary::tbl_summary()
#' @export

tblk_summary = function(data,
                        vars,
                        by = NULL,
                        missing_text = "Manquant") {
  data |>
    gtsummary::tbl_summary(by = tidyselect::all_of(by),
                label = vars,
                statistic = list(gtsummary::all_categorical() ~ "{p}%"),
                include = tidyselect::all_of(names(vars)),
                missing_text = missing_text) |>
    gtsummary::modify_header(label ~ "") |>
    gtsummary::remove_footnote_header()
}
