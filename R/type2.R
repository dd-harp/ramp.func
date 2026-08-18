
#' @title Make a type2 function for age
#' @description Return an age pattern \eqn{\omega(a)}, a function of the form
#' \deqn{\omega(a) = \frac{A(a+\tau)}{B+a+\tau}}
#' where \eqn{\tau} is a shift so that \eqn{\omega(0) > 0}
#' and \eqn{A} and \eqn{B} are shape parameters
#'
#' @inheritParams make_function
#' @importFrom stats integrate
#' @seealso [makepar_F_type2]
#' @return a function for seasonality
#' @keywords internal
#' @export
make_function.type2 = function(F_obj){with(F_obj,{
  F = function(a, V=list()){
    A*(a + shift)/(B*365+a+shift)
  }
  return(F)
})}

#' @title Make a type2 function for age
#' @description Return an age pattern \eqn{\omega(a)}, a function of the form
#' \deqn{\omega(a) = \frac{A(a+\tau)}{B+a+\tau}}
#' where \eqn{\tau} is a shift so that \eqn{\omega(0) > 0}
#' and \eqn{A} and \eqn{B} are shape parameters
#'
#' @inheritParams make_function
#' @importFrom stats integrate
#' @seealso [makepar_F_type2]
#' @return a function for seasonality
#' @keywords internal
#' @export
make_F_t.type2 = function(F_obj){with(F_obj,{
  F = function(a){
    A*(a + shift)/(B*365+a+shift)
  }
  return(F)
})}

#' @title parameters for make_function
#' @description Return an object to configure
#' a function [make_function.type2]
#' @param shift a shift to set F(0)>0
#' @param A asymptote
#' @param B slope
#' @param N the length of the vector to return
#' @return a type 2 functional response
#' @seealso [make_function.type2]
#' @export
makepar_F_type2 = function(shift=30, A=1.8, B=5, N=1){
  pars <- list()
  class(pars) <- "type2"
  pars$shift = check_length(shift, N)
  pars$A = abs(check_length(A, N))
  pars$B = abs(check_length(B, N))
  pars$N = N
  return(pars)
}
