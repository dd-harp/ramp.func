#' @title Make a Function
#'
#' @description Build a trace function
#'
#' @param opts a named list
#' @return a function
#' @export
make_function = function(opts){
  UseMethod("make_function", opts)
}

#' @title Make function default
#' @description For lists that are not assigned a class,
#' return the default: \eqn{F(t)=1}.
#' @inheritParams make_function
#' @keywords internal
#' @return a function
#' @export
make_function.list = function(opts){
  return(function(t, V=list()){0*t+1})
}
