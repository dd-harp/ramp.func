
#' @title splinef
#'
#' @description
#' A [spline] function \eqn{F_T(t)} for [trends] is specified by a set of \eqn{n} interpolating points:
#' + time
#' values \deqn{t_1, t_2, \ldots, t_n,}
#' + and corresponding
#' \eqn{y} values \deqn{y_1, y_2, \ldots, y_n.}
#'
#' @seealso [stats::spline], [makepar_F_spline]
#' @name splinef
NULL

#' @title splineX
#'
#' @description
#' A spline function \eqn{F_T(t)} for [trends] is specified by a set of  \eqn{n} interpolating points:
#' + time
#' values \deqn{t_1, t_2, \ldots, t_n,}
#' + and corresponding
#' \eqn{y} values \deqn{y_1, y_2, \ldots, y_n.}
#'
#'
#' For `splineX`, the return value is \deqn{e^{F_T(t)}}
#'
#' @seealso [stats::spline], [makepar_F_spline]
#' @name splineX
NULL


#' @title spline2
#'
#' @description
#' A spline function \eqn{F_T(t)} for [trends] is specified by a set of  \eqn{n} interpolating points:
#' + time
#' values \deqn{t_1, t_2, \ldots, t_n,}
#' + and corresponding
#' \eqn{y} values \deqn{y_1, y_2, \ldots, y_n.}
#'
#' For `spline2` the function return value is \deqn{F_T(t)^2}
#'
#' @seealso [stats::spline], [makepar_F_spline]
#' @name spline2
NULL


#' @title Make a spline [F_obj]
#' @description
#' Return a function obj
#' A spline function \eqn{F_T(t)} for [trends] is specified by a set of  \eqn{n} interpolating points:
#' + time
#' values \deqn{t_1, t_2, \ldots, t_n,}
#' + and corresponding
#' \eqn{y} values \deqn{y_1, y_2, \ldots, y_n.}
#' @param tt the nodes
#' @param yy the y values
#' @param X setup switch: FALSE=[splinef] | TRUE=[splineX] | 2=[spline2]
#' @return parameters to configure the `splinef` or `splineX` case of `make_function`
#' @export
makepar_F_spline = function(tt, yy, X=FALSE){
  pars <- list()
  class(pars) = c("splinef", "list")
  if(X==TRUE) class(pars) = "splineX"
  if(X==2) class(pars) = "spline2"
  pars$tt = tt
  pars$yy = yy
  return(pars)
}

#' @title Make a spline function
#' @description A spline function passes time points `tt` and
#' associated values `yy` and returns a spline function
#' @inheritParams make_function
#' @return a function
#' @keywords internal
#' @export
make_function.splinef = function(F_obj){
  ff <- function(t,V=list()){
    stats::spline(F_obj$tt, F_obj$yy, xout = t)$y
  }
  return(ff)
}


#' @title Make a spline function
#' @description A spline function passes time points `tt` and
#' associated values `yy` and returns a spline function
#' @inheritParams make_function
#' @return a function
#' @keywords internal
#' @export
make_F_t.splinef = function(F_obj){
  ff <- function(t){
    stats::spline(F_obj$tt, F_obj$yy, xout = t)$y
  }
  return(ff)
}

#' @title Make a spline function
#' @description A spline function passes time points `tt` and
#' associated values `yy` and returns a spline function
#' @inheritParams make_function
#' @return a function
#' @keywords internal
#' @export
make_function.splineX = function(F_obj){
  ff <- function(t,V=list()){
    exp(stats::spline(F_obj$tt, F_obj$yy, xout = t)$y)
  }
  return(ff)
}

#' @title Make a spline function
#' @description A spline function passes time points `tt` and
#' associated values `yy` and returns a spline function
#' @inheritParams make_function
#' @return a function
#' @keywords internal
#' @export
make_F_t.splineX = function(F_obj){
  ff <- function(t){
    exp(stats::spline(F_obj$tt, F_obj$yy, xout = t)$y)
  }
  return(ff)
}


#' @title Make a spline function
#' @description A spline function passes time points `tt` and
#' associated values `yy` and returns a spline function
#' @inheritParams make_function
#' @return a function
#' @keywords internal
#' @export
make_function.spline2 = function(F_obj){
  ff <- function(t, V=list()){
    (stats::spline(F_obj$tt, F_obj$yy, xout = t)$y)^2
  }
  return(ff)
}

#' @title Make a spline function
#' @description A spline function passes time points `tt` and
#' associated values `yy` and returns a spline function
#' @inheritParams make_function
#' @return a function
#' @keywords internal
#' @export
make_F_t.spline2 = function(F_obj){
  ff <- function(t){
    stats::spline(F_obj$tt, F_obj$yy, xout = t)$y
  }
  return(ff)
}
