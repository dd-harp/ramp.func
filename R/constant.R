
#' @title Make [F_obj] for \eqn{F(t)=c}
#' @description Return an [make_function] object to set up
#' the constant function \eqn{F(t)=c}
#' @param c the constant
#'
#' @return a [make_function] object
#'
#' @export
makepar_F_c = function(c=1){
  pars <- list()
  class(pars) = c('', 'list')
  pars$c = c
  return(pars)
}

#' @title Make a Function
#' @description Build a function Build a function \eqn{F(t)=c}
#' @inheritParams make_F_t
#' @return a function
#' @keywords internal
#' @export
make_F_t.c = function(F_obj){
  F_c = function(t){0*t+F_obj$c}
  return(F_c)
}

#' @title Make a Function
#' @description Build a function \eqn{F(t, V)=c}
#' @inheritParams make_function
#' @return a function
#' @keywords internal
#' @export
make_function.c = function(F_obj){
  F_c = function(t, V=list()){0*t+F_obj$c}
  return(F_c)
}
