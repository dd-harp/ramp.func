
#' @title Make a Sine-based Seasonality Function
#' @description Return a seasonal pattern \eqn{S(t)}, a function of the form
#' \deqn{S(t) = c \left(1+\epsilon + \sin\left(\frac{2 \pi (t-\tau)}{365}\right)\right)^p}
#' where \eqn{c} is a normalizing constant, and
#' + \eqn{\epsilon \geq 0} or `bottom`
#' + \eqn{\tau} or `phase`
#' + \eqn{p} or `pw`
#'
#' The algorithm sets the constant \eqn{c} or `norm`
#' such that \deqn{\int_0^{365} S(t) dt=c} where the default is `norm=365.`
#' @inheritParams make_function
#' @importFrom stats integrate
#' @seealso [makepar_F_sin]
#' @return a function for seasonality
#' @keywords internal
#' @export
make_function.sin = function(opts){
  opts$normit = with(opts, rep(norm, N))
  for(i in 1:opts$N){
    F1 = with(opts,function(t){(1+abs(bottom[i])+sin(2*pi*(t)/365))^pw[i]})
    over_year <- integrate(F1, 0, 365)$val
    opts$normit[i] <- opts$normit[i]/over_year
  }
  F2 = with(opts,function(t){(1+abs(bottom) + sin(2*pi*(t-phase+91)/365))^pw*normit})
  F3 = function(t){if(length(t) == 1) return(F2(t)) else return(sapply(t, F2))}
  return(F3)
}

#' @title parameters for make_function
#' @description Return an object to configure
#' a function [make_function.sin]
#' @param phase the phase for a seasonal function
#' @param bottom shape parameter
#' @param pw shape parameter
#' @param norm the normalization period
#' @param N the length of the vector to return
#' @return a function for seasonality
#' @seealso [make_function.sin]
#' @export
makepar_F_sin = function(phase=0, bottom=0, pw=1, norm=365, N=1){
  pars <- list()
  class(pars) <- "sin"
  pars$phase = check_length(phase, N)
  pars$bottom = abs(check_length(bottom, N))
  pars$pw = abs(check_length(pw, N))
  pars$norm = norm
  pars$N = N
  return(pars)
}
