#' @title Make an expontial function
#'
#' @description Build a function to model a
#' forced seasonal signal. The shape parameters determine
#' the timing, frequency, and relative intensity
#' over the season. The function is normalized
#' to have an annual value set by `norm`
#'
#' @inheritParams make_function
#' @importFrom stats integrate
#' @return a function
#' @keywords internal
#' @export
make_F_t.exp = function(F_obj){
  with(F_obj,{
    F = function(t){exp(rate*t)}
    return(F)
})}

#' @title Make a expal Function
#' @description Build a function to model a
#' forced seasonal signal. The shape parameters determine
#' the timing, frequency, and relative intensity
#' over the season. The function is normalized
#' to have an annual value set by `norm`
#' @inheritParams make_function
#' @importFrom stats integrate
#' @return a function
#' @keywords internal
#' @export
make_function.exp = function(F_obj){
  with(F_obj,{
    F = function(t, V=list()){exp(rate*t)}
    return(F)
})}

#' @title Make parameters for an exponential function
#' @description Return an object to configure
#' a function [make_function.exp]
#' @param rate the rate parameter
#' @param N the length of the functions return value
#' @return an exponential F object
#' @export
makepar_F_exp = function(rate = -1, N=1){
  pars <- list()
  class(pars) <- c("exp", "list")
  pars$rate = check_length(rate, N)
  pars$N=N
  return(pars)
}
