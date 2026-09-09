
#' @title Make a Function, \eqn{F(t,V)}
#'
#' @description Build a general trace function of time \eqn{t}
#' and variables (optional) \eqn{V}.
#'
#' @param F_obj a function object, [F_obj]
#'
#' @return a function
#' @export
make_kernel = function(F_obj){
  UseMethod("make_kernel", F_obj)
}

#' @title Make a Function, \eqn{F(t)}
#'
#' @description Construct a trace function of the form \eqn{F(t)} from [F_obj]
#'
#' @inheritParams make_function
#' @keywords internal
#' @return a function
#' @export
make_kernel.d = function(F_obj){
  make_K_d(F_obj)
}

#' @title Make a Function, \eqn{F(t)}
#'
#' @description Construct a trace function of the form \eqn{F(t)} from [F_obj]
#'
#' @inheritParams make_function
#' @keywords internal
#' @return a function
#' @export
make_kernel.dV = function(F_obj){
  make_K_dV(F_obj)
}

#' @title Make a Function, \eqn{F(t)}
#'
#' @description Construct a trace function of the form \eqn{F(t)} from [F_obj]
#'
#' @inheritParams make_function
#' @return a function
#' @export
make_K_d = function(F_obj){
  UseMethod("make_K_d", F_obj)
}

#' @title Make a Function, \eqn{F(t)}
#'
#' @description Construct a trace function of the form \eqn{F(t)} from [F_obj]
#'
#' @inheritParams make_function
#' @return a function
#' @export
make_K_dV = function(F_obj){
  UseMethod("make_K_dV", F_obj)
}
