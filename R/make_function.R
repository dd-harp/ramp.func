#' @title Make a Function, \eqn{F(t,V)}
#'
#' @description Build a general trace function
#'
#' @param opts a named list
#' @return a function
#' @export
make_function = function(opts){
  UseMethod("make_function", opts)
}

#' @title Make a Function, \eqn{F(t)}
#'
#' @description Build a trace function
#'
#' @param opts a named list
#' @return a function
#' @export
make_F_t = function(opts){
  UseMethod("make_F_t", opts)
}

#' @title Make a Function, \eqn{F(a|d)}
#'
#' @description Build a trace function to simulate
#' exposure by age. The function substitutes age for
#' time: given a birthday, \eqn{d}, age is \eqn{a=t-d}. The
#' function is a product of:
#' + \eqn{x} --- the mean
#' + \eqn{\omega(a)} --- a function describing the relative biting rate by age
#' + \eqn{S(t)} --- a seasonal pattern function
#' + \eqn{T(t)} --- a trend pattern function
#' + \eqn{K(t)} --- a shock function
#' \deqn{F(a | d) = x \times \omega(a) \times S(t-d) \times T(t-d) \times K(t-d)}
#'
#' @param opts a named list
#' @return a function
#' @export
make_F_a = function(x, age_par, season_par, trend_par, shock_par){
  F_age = make_F_t(age_par)
  F_season = make_F_t(season_par)
  F_trend = make_F_t(trend_par)
  F_shock = make_F_t(shock_par)
  F = function(a, d){
    t = a+d
    x*F_age(a)*F_season(t)*F_trend(t)*F_shock(t)
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
make_function.list = function(opts){
  return(function(t, V=list()){0*t+1})
}
