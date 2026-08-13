#' @title Forcing with Trivial Modules
#'
#' @description
#' Trivial modules were developed for each one
#' of the three dynamical components, making it
#' possible to develop studies of some focal process
#' with known inputs: a *trace function* approach.
#'
#' Three trivial modules and EIR forcing [xds_setup_eir]
#' construct trace functions as decomposable time series. The
#' value of a forced variable \eqn{x(t)} is computed
#' as a product of four configurable elements:
#' + \eqn{\bar x}: a mean value
#' + \eqn{S(t)}: a seasonal pattern
#' + \eqn{T(t)}: a trend
#' + \eqn{K(t)}: a shock
#'
#' \deqn{x(t) = \bar x \times S(t) \times T(t) \times K(t)}
#'
#' In the trivial modules, the functions are specified by
#' passing parameters generated for [make_function].
#' + `season_par` creates \eqn{S(t)} or `F_season` (*eg,* using [makepar_F_sin])
#' + `trend_par` creates \eqn{T(t)} or `F_trend` (*eg,* using [makepar_F_spline])
#' + `shock_par` creates \eqn{K(t)} or `F_shock` (*eg,* using [makepar_F_sharkbite])
#'
#' For a discussion of mechanistic approaches to forcing, see [Forcing]
#'
#' @seealso [trivial_XH], [trivial_MY], [trivial_L], [xds_setup_eir], [make_ts_function], and [Forcing]
#' @name xds_info_trivial_forcing
NULL

#' @title The trivial function
#' @description A function that returns 0
#' @param t an arbitrary input
#' @param V an arbitrary input
#' @return a vector of ones of length x
#' @keywords internal
#' @export
Zero_tV = function(t, V=list()){return(0*t)}

#' @title The trivial function
#' @description A function that returns 0
#' @param t an arbitrary input
#' @param V an arbitrary input
#' @return a vector of ones of length x
#' @keywords internal
#' @export
One_tV= function(t, V=list()){return(0*t+1)}

#' @title Get Variables
#'
#' @description A utility to write functions
#' that respond to state variables or exogenous
#' variables
#'
#' @note The method dispatches on `class(func)`
#'
#' @param t current simulation time
#' @param y variables
#' @param func a function that dispatches [get_variables] and pulls variables it needs
#' @param xds_obj an **`xds`** model object
#'
#' @return a vector of variables
#' @export
get_variables = function(t, y, func, xds_obj){
  UseMethod("get_variables", func)
}

#' @title Get Variables
#'
#' @description The null case for [get_variables]
#'
#' @inheritParams get_variables
#'
#' @return a set of variables
#' @keywords internal
#' @export
get_variables.na = function(t, y, func, xds_obj){
  return(numeric(0))
}

#' @title Exponential Function
#'
#' @description An exponential
#' function.
#'
#' @param d an arbitrary input
#'
#' @return a [numeric] vector of length d
#'
#' @keywords internal
#' @export
F_exp = function(d){return(exp(-d))}


#' @title The trivial function
#' @description A function that returns 0
#' @param t an arbitrary input
#' @return a vector of ones of length x
#' @keywords internal
#' @export
F_zero = function(t){return(0*t)}

#' @title parameters for make_function
#' @description Return an object to configure
#' a function [make_function.zero]
#' @return a function to return
#' @seealso [make_function.zero]
#' @export
makepar_F_zero = function(){
  pars <- list()
  class(pars) <- "zero"
  return(pars)
}

#' @title Make a Function that is the sum of Two other Functions
#' @description Return [F_zero]
#' @inheritParams make_function
#' @return a function that is the sum of two other functions
#' @keywords internal
#' @export
make_function.zero = function(opts){
  return(F_zero)
}

#' @title The trivial function
#' @description A function that returns 1
#' @param t an arbitrary input
#' @return a vector of ones of length x
#' @keywords internal
#' @export
F_one = function(t){return(0*t+1)}

#' @title parameters for make_function
#' @description Return an object to return [F_one]
#' @return a function for seasonality
#' @seealso [make_function.one]
#' @export
makepar_F_one = function(){
  pars <- list()
  class(pars) <- "one"
  return(pars)
}

#' @title Make a Function
#' @description Build a function that is the sum of two
#' other functions.
#' @inheritParams make_function
#' @return a function that is the sum of two other functions
#' @keywords internal
#' @export
make_function.one = function(opts){
  return(F_one)
}

#' @title Make a Function that is the sum of Two other Functions
#' @description Build a function that is the sum of two
#' other functions.
#' @inheritParams make_function
#' @keywords internal
#' @return a function that is the sum of two other functions
#' @keywords internal
#' @export
make_function.list = function(opts){
  return(F_one)
}


#' @title parameters for make_function
#' @description Return an object to return a value
#' @param val the value to return
#' @return a function for seasonality
#' @seealso [make_function.val]
#' @export
makepar_F_val = function(val){
  pars <- list()
  class(pars) <- "val"
  pars$val <- val
  return(pars)
}

#' @title Make a Function that is the sum of Two other Functions
#' @description Build a function that returns a constant value
#' @inheritParams make_function
#' @return a function that returns a constant value
#' @keywords internal
#' @export
make_function.val = function(opts){
  Fv = function(t){return(0*t + opts$val)}
  return(Fv)
}

#' @title The trivial function
#' @description A function that returns 1
#' @param t an arbitrary input
#' @return a vector of ones of length x
#' @keywords internal
#' @export
F_flat = function(t){return(0*t+1)}



#' @title Make a type2 function for age
#' @description Return an age pattern \eqn{\omega(a)}, a function of the form
#' \deqn{\omega(a) = \frac{A(a+\tau)}{B+a+\tau}}
#' where \eqn{\tau} is a shift so that \eqn{\omega(0) > 0}
#' and \eqn{A} and \eqn{B} are shape parameters
#'
#' @inheritParams make_function
#' @importFrom stats integrate
#' @seealso [makepar_F_type2]
#' @return a function for seasonality
#' @keywords internal
#' @export
make_function.type2 = function(opts){with(opts,{
  F = function(a){
    A*(a + shift)/(B*365+a+shift)
  }
  return(F)
})}

#' @title parameters for make_function
#' @description Return an object to configure
#' a function [make_function.type2]
#' @param shift a shift to set F(0)>0
#' @param A asymptote
#' @param B slope
#' @param N the length of the vector to return
#' @return a type 2 functional response
#' @seealso [make_function.type2]
#' @export
makepar_F_type2 = function(shift=30, A=1.8, B=5, N=1){
  pars <- list()
  class(pars) <- "type2"
  pars$shift = checkIt(shift, N)
  pars$A = abs(checkIt(A, N))
  pars$B = abs(checkIt(B, N))
  pars$N = N
  return(pars)
}




