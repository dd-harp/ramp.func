#' @title seasonality
#' @description
#'
#' Seasonality pattern functions --- \eqn{S(t)}:
#'
#' + [sin] --- A generalized sinusoidal function was developed to model seasonal forcing
#'
#' @name seasonality
NULL

#' @title shocks
#' @description
#'
#' Shock functions --- \eqn{K(t)}:
#'
#' + [sharkfin] --- A function to model simple perturbations
#'
#' + [sharkbite] --- A function to model shocks as part of a **composed time series** function
#'
#' @name shocks
NULL

#' @title trends
#'
#' @description
#'
#' Trend pattern functions --- \eqn{T(t)}:
#'
#' + [splinef] --- A function to model simple perturbations
#'
#' + [splineX] ---
#'
#' + [spline2] ---
#'
#' @name trends
NULL


#' @title age
#'
#' @description
#'
#' Relative biting rates by age, \eqn{\omega(a)}:
#'
#' + [type2] --- A function of the form \deqn{\omega(a) = \frac{A(a+\tau)}{B+a+\tau}}
#'
#' @name age
NULL
