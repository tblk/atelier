#' Title Label x axis in k euros
#'
#' @details
#' Some graphic devices may require the \pkg{showtext} package
#' to correctly display the euro symbol.
#'
#' @returns a ggplot object
#' @export
#'
#' @examples
#' if (require("showtext")) {
#' library(ggplot2)
#' showtext_auto()
#' ggplot(penguins, aes(x = bill_len, y = flipper_len)) +
#' geom_point() +
#' label_y_keuros()
#' }
label_x_keuros = function() {
  ggplot2::scale_x_continuous(
    labels = scales::label_number(scale = 1e-3,
                                  suffix = " k\u20AC"))
}
