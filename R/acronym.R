acronym <- function(x) {
  sapply(strsplit(x, "\\s+"), function(words) {
    paste(tolower(substr(words, 1, 1)), collapse = "")
  })
}
