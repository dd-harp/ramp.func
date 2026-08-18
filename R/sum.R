
#' @title Make a Function that is the sum of Two other Functions
#' @description Build a function that is the sum of two
#' other functions.
#' @inheritParams make_function
#' @return a function that is the sum of two other functions
#' @keywords internal
#' @export
make_function.sum = function(F_obj){
  F1 = make_function(F_obj$opts1)
  F2 = make_function(F_obj$opts2)
  F3 = function(t,V=list()){F1(t,V)+F2(t,V)}
  return(F3)
}


#' @title Make a Function that is the sum of Two other Functions
#' @description Build a function that is the sum of two
#' other functions.
#' @inheritParams make_F_t
#' @return a function that is the sum of two other functions
#' @keywords internal
#' @export
make_F_t.sum = function(F_obj){
  F1 = make_function(F_obj$opts1)
  F2 = make_function(F_obj$opts2)
  F3 = function(t){F1(t)+F2(t)}
  return(F3)
}


#' @title parameters for make_function
#' @description Return an object to configure
#' a function [make_function.sum]
#' @param opts1 options for first function
#' @param opts2 options for the second function
#' @return a function
#' @export
makepar_F_sum = function(opts1, opts2){
  pars <- list()
  class(pars) <- "sum"
  pars$opts1 = opts1
  pars$opts2 = opts2
  return(pars)
}
