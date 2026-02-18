#' Create lowercase acronym
#'
#' @param x A character vector with one element
#'
#' @returns A character vector
#' @export
#'
#' @examples
#' x <- "Robert Hertz"
#' acronym(x)
acronym <- function(x) {
  sapply(strsplit(x, "\\s+"), function(words) {
    paste(tolower(substr(words, 1, 1)), collapse = "")
  })
}
