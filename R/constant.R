
#' @title Make parameters for \eqn{F(t)=c}
#' @description Return an [make_function] object to set up
#' the constant function \eqn{F(t)=c}
#' @param c the constant
#' @return a [make_function] object
#'
#' @export
makepar_F_c = function(c){
  pars <- list()
  class(pars) <- "c"
  pars$c = c
  return(pars)
}

#' @title Make a Function
#' @description Build a function that returns a constant
#' @inheritParams make_function
#' @return a function that is the sum of two other functions
#' @keywords internal
#' @export
make_function.c = function(opts){
  F_c = function(t){0*t+opts$c}
  return(F_c)
}
