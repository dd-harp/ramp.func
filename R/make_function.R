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
#' @param F_obj a function object, [F_obj]
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

#' @title Make a Function, \eqn{F(a,d)}
#'
#' @description Construct a trace function to simulate
#' exposure by age using [make_F_t].
#'
#' The function substitutes age for
#' time: given a birthday, \eqn{d}, age is \eqn{a=t-d}. The
#' function is a product of:
#' + \eqn{\bar X} --- or `avg` the approximate mean value
#' + \eqn{F_\omega(a)} --- a function describing the relative biting rate by age
#' + \eqn{F_S(t)} --- a seasonal pattern function
#' + \eqn{F_T(t)} --- a trend pattern function
#' + \eqn{F_K(t)} --- a shock function
#' \deqn{F(a, d) = x \times \omega(a) \times F_S(t-d) \times F_T(t-d) \times F_K(t-d)}
#'
#' For convenience, \eqn{d} is an optional argument with a default value \eqn{d=0}
#'
#'
#' @param avg the function average
#' @param age_par an [F_obj] for relative biting rate by age
#' @param season_par an [F_obj] for the seasonal pattern (see [seasonality])
#' @param trend_par an [F_obj] for the trend (see [trends])
#' @param shock_par an [F_obj] for a perturbation (see [shocks])
#'
#'
#' @return a function
#' @export
make_F_a = function(avg,
                    age_par=makepar_F_c(1),
                    season_par=makepar_F_c(1),
                    trend_par=makepar_F_c(1),
                    shock_par=makepar_F_c(1)){
  F_age = make_F_t(age_par)
  F_season = make_F_t(season_par)
  F_trend = make_F_t(trend_par)
  F_shock = make_F_t(shock_par)
  F = function(a, d=0){
    stopifnot(a>=0)
    t = a+d
    avg*F_age(a)*F_season(t)*F_trend(t)*F_shock(t)
  }
  return(F)
}

#' @title Make function default
#' @description For lists that are not assigned a class,
#' return the default: \eqn{F(t)=1}.
#' @inheritParams make_function
#' @keywords internal
#' @return a function
#' @export
make_function.list = function(F_obj){
  return(function(t, V=list()){0*t+1})
}
