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
