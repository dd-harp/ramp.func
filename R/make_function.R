#' @title F_obj
#'
#' @description
#' In `ramp.func`, **`F_obj`** describes an object used by [make_F_t] and [make_function] to construct
#' functions:
#'
#' + An **`F_obj`** is returned by a function `makepar_F_method`
#'    + the object is list
#'    + each item in the list is a parameter
#'    + the `class` of the object is set to `method`
#' + The constructor functions dispatch on `class(F_obj)`
#'    + [make_F_t] returns functions of the form \eqn{F(t)}
#'    + [make_function] returns functions of the form \eqn{F(t,V)}
#'
#' @seealso [make_F_t], [make_function]
#' @name F_obj
NULL

#' @title Make a Function, \eqn{F(t,V)}
#'
#' @description Build a general trace function of time \eqn{t}
#' and variables (optional) \eqn{V}.
#'
#' @param F_obj a function object
#' @return a function
#' @export
make_function = function(F_obj){
  UseMethod("make_function", F_obj)
}

#' @title Make a Function, \eqn{F(t)}
#'
#' @description Construct a trace function of the form \eqn{F(t)} from [F_obj]
#'
#' @inheritParams make_function
#' @return a function
#' @export
make_F_t = function(F_obj){
  UseMethod("make_F_t", F_obj)
}


#' @title Make function default
#' @description For lists that are not assigned a class,
#' return the default: \eqn{F(t)=1}.
#' @inheritParams make_function
#' @keywords internal
#' @return a function
#' @export
make_function.list = function(F_obj){
   make_function(makepar_F_c(1))
}

#' @title Make function default
#' @description For lists that are not assigned a class,
#' return the default: \eqn{F(t)=1}.
#' @inheritParams make_function
#' @keywords internal
#' @return a function
#' @export
make_F_t.list = function(F_obj){
  make_F_t(makepar_F_c(1))
}

