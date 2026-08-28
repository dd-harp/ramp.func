
#' @title Zero Truncated Poisson
#'
#' @description
#' A poisson conditioned
#' on non zero values.
#'
#'
#' @param x vector of non-negative integers
#' @param lambda the mean value
#'
#' @importFrom stats dpois
#'
#' @returns a probability
#' @export
dPOIStrunc = function(x, lambda){
  dx <- dpois(x, lambda)/(1-dpois(0,lambda))
  ix <- which(x==0)
  if(length(ix)>0) dx[ix]=0
  return(dx)
}

#' @title Make a Zero Truncated Poisson
#'
#' @description
#' Return a zero truncated Poisson
#'
#' @param lambda the mean value
#'
#' @returns a probability
#' @export
make_POIStrunc = function(lambda){
  F <- function(x){dPOIStrunc(x, lambda=lambda)}
  return(F)
}
