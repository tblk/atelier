#' Title
#'
#' @param justification A vector of length 2
#'
#' @details
#' Cette fonction doit être utilisée AVANT theme_...()
#' Avec theme_set() toutefois, ça ne pose aucun problème.
#'
#'
#' @returns A ggplot object with legend insid
#' @export
#'
#' @examples
#' penguins |>
#' ggplot2::ggplot(ggplot2::aes(x = bill_len,
#'  y = flipper_len,
#'   colour = species)) +
#'   legend_inside()
legend_inside = function(justification = c(0, 1)) {
  ggplot2::theme(
    legend.position = abs(justification - 0.05),
    legend.justification = justification,
    legend.background = ggplot2::element_rect(fill = "white", color = "black"),
    legend.key = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank()
  )
}
