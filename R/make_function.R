#' @title Make a Function
#' @description Build a function of time for trace functions
#' exogenous forcing by weather, vector control, or mass
#' health interventions
#' @param opts a named list
#' @return a function
#' @export
make_function = function(opts){
  UseMethod("make_function", opts)
}
