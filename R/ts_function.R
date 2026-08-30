
#' Make a Time Series Function
#'
#' @description
#' Build a function that generates a time series
#' with known functions. The value of
#' variable \eqn{x(t)} is computed
#' as a product of four configurable elements:
#' + \eqn{\bar x}: a mean value
#' + \eqn{F_S(t)}: a seasonal pattern
#' + \eqn{F_T(t)}: a trend
#' + \eqn{F_K(t)}: a shock
#'
#' \deqn{x(t) = \bar x \times F_S(t) \times F_T(t) \times F_K(t)}
#'
#' The component functions are specified by
#' passing parameters for [make_function]:
#' + `season_par` creates \eqn{F_S(t)} or `F_season` (*eg,* using [makepar_F_sin])
#' + `trend_par` creates \eqn{F_T(t)} or `F_trend` (*eg,* using [makepar_F_spline])
#' + `shock_par` creates \eqn{F_K(t)} or `F_shock` (*eg,* using [makepar_F_sharkbite])
#'
#' @param options configurable options
#' @param N the length of the return value
#' @param scale scale parameter, usually the average
#' @param season_par seasonality function for
#' @param trend_par trend function parameters
#' @param shock_par trend function parameters
#'
#' @return a function
#' @export
make_ts_function = function(options=list(),
                            N=1,
                            scale=1,
                            season_par = list(),
                            trend_par = list(),
                            shock_par = list()){
  with(options,{
    scale = check_length(scale, N)

    F_season = make_function(season_par)
    F_trend = make_function(trend_par)
    F_shock = make_function(shock_par)

    return(function(t, V=list()){scale*F_season(t,V)*F_trend(t,V)*F_shock(t,V)})
  })}
