
#' @title Make a spline function
#' @description A spline function passes time points `tt` and
#' associated values `yy` and returns a spline function
#' @inheritParams make_function
#' @return a function
#' @keywords internal
#' @export
make_function.splinef = function(opts){
  ff <- function(t,V=list()){
    stats::spline(opts$tt, opts$yy, xout = t)$y
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
make_function.splineX = function(opts){
  ff <- function(t,V=list()){
    exp(stats::spline(opts$tt, opts$yy, xout = t)$y)
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
make_function.spline2 = function(opts){
  ff <- function(t){
    (stats::spline(opts$tt, opts$yy, xout = t)$y)^2
  }
  return(ff)
}


#' @title Make Parameters for a Spline
#' @description Return an object for [make_function.splinef] or [make_function.splineX]
#' @param tt the nodes
#' @param yy the y values
#' @param X a switch to configure for splinef or splineX
#' @return parameters to configure the `splinef` or `splineX` case of `make_function`
#' @export
makepar_F_spline = function(tt, yy, X=FALSE){
  pars <- list()
  class(pars) = "splinef"
  if(X==TRUE) class(pars) = "splineX"
  if(X==2) class(pars) = "spline2"
  pars$tt = tt
  pars$yy = yy
  return(pars)
}
