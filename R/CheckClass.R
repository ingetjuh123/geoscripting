CheckClass <- function (x) {
  if (!is.numeric(x)) {
    stop('object of class character expected for x')
  }
}   
