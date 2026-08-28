

#' @title Zero Truncated Negative Binomial
#'
#' @description
#' A negative binomial distribution conditioned
#' on non zero values.
#'
#'
#' @param x vector of non-negative integers
#' @param mu the mean value
#' @param size the size parameter
#'
#' @importFrom stats dnbinom
#'
#' @returns a probability
#'
#' @export
dNBtrunc = function(x, mu, size){
  dx <- dnbinom(x, mu=mu, size=size)/(1-dnbinom(0,mu=mu,size=size))
  ix <- which(x==0)
  if(length(ix)>0) dx[ix]=0
  return(dx)
}

#' @title Make a Zero Truncated Negative Binomial
#'
#' @description
#' Return a zero truncated negative binomial distribution
#' with a given mean and size
#'
#' @param mu the mean value
#' @param size the size parameter
#'
#' @returns a probability
#' @export
make_NBtrunc = function(mu, size){
  F = function(x){dNBtrunc(x, mu=mu, size=size)}
  return(F)
}
