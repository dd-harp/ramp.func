#' @title Check the Length
#'
#' @description Check the length of a vector \eqn{x}:
#' + If it is a scalar and `fixit = TRUE`, then return the value as a vector of length \eqn{N}
#' + Otherwise, if it is a vector, stop if it's length is not \eqn{N}
#'
#' @param x a [numeric] object
#' @param N an integer, the length
#' @param fixit a [logical] value, if TRUE force length to N
#' @return a vector of length \eqn{N}
#' @keywords internal
#' @export
check_length = function(x, N, fixit=TRUE){
  stopifnot(is.numeric(x))
  if(length(x)==1 & fixit) x=rep(x, N)
  stopifnot(length(x)==N)
  x
}
