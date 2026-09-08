
#' @title Make a Function,
#' @description Construct a trace function to simulate
#' exposure by age, \eqn{a}, in a cohort born on day \eqn{d},
#' (and since age is related to time, \eqn{t}, by the formula \eqn{t = a+d}), then we compute
#'
#' \deqn{F(a, d) =
#' \begin{cases}
#' 0 & \mbox{if } a <0 \\
#' \bar E \times F_\omega(a) \times F_t(a+d) & \mbox{if } a >=0
#' \end{cases}.
#' }
#'
#'  and
#'
#' + \eqn{\bar E} --- or `avg` the approximate mean value
#'
#' + \eqn{F_\omega(a)} --- a function describing the relative biting rate by age
#'
#' + \eqn{F_t(t)} --- the temporal pattern function.
#'
#' The temporal pattern function \eqn{F_t} is a composed time series function:
#' \deqn{F_t(t) = x \times F_S(t) \times F_T(t) \times F_K(t)}
#'
#' where
#'
#' + x --- a normalizing constant
#' + \eqn{F_S(t)} --- a seasonal pattern function
#' + \eqn{F_T(t)} --- a trend pattern function
#' + \eqn{F_K(t)} --- a shock function
#'
#' The normalizing constant is set such that the daily average over the interval is 1:
#' \deqn{\int_{t_0}^{t_1} F_t(t) dt = t_1-t_0.}
#'
#' By default \eqn{t_0=d} and \eqn{t_1=d+A}, but if the user
#' passes a non-NULL value for `times` then the boundaries for
#' the normalizing interval are
#' set to
#' + \eqn{t_0 = \mbox{min(times)}}, and
#' + \eqn{t_1 = \mbox{max(times)}}.
#'
#' For convenience in constructing counterfactuals, normalization can be done
#' with or without the shock function.
#'
#' By default, \eqn{d=0}
#'
#' @note A named list of options is an alternative way of passing arguments.
#'
#' @param A the maximum age (in days)
#' @param bday the cohort birthday \eqn{(d)}
#' @param avg the average exposure, \eqn{\bar E}
#' @param age_par an [F_obj] for relative biting rate by age to construct \eqn{F_\omega} (see [age])
#' @param season_par an [F_obj] for the seasonal pattern to construct \eqn{F_S} (see [seasonality])
#' @param trend_par an [F_obj] for the trend to construct \eqn{F_T} (see [trends])
#' @param shock_par an [F_obj] for to construct a perturbation function \eqn{F_K} (see [shocks])
#' @param norm_with_shocks if FALSE, set {\eqn{F_K(t)=1}} for normalization
#' @param times if not NULL, normalize \eqn{F_t} from \eqn{t_0 = \mbox{min(times)}} to \eqn{t_1 = \mbox{max(times)}}
#' @param form functional form: "t" returns \eqn{F(t)}; "tV" returns \eqn{F(t,V)}
#' @param options a list of setup options
#'
#' @return a function
#' @export
make_F_a = function(A=5*365, bday=0, avg=1,
                    age_par=makepar_F_type2(),
                    season_par=makepar_F_c(1),
                    trend_par=makepar_F_c(1),
                    shock_par=makepar_F_c(1),
                    norm_with_shocks = TRUE,
                    times=NULL,
                    form = "t",
                    options = list()){
  with(options,{
    t0 = bday; t1=bday+A
    if(!is.null(times)){
      t0=min(times); t1=max(times)
    }

    if(is.numeric(trend_par)){
      yy <- trend_par
      tt <- seq(0, A, length.out=length(yy))
      trend_par <- makepar_F_spline(tt, yy, 2)
    }

    F_age = make_F_t(age_par)
    F_season = make_F_t(season_par)
    F_trend = make_F_t(trend_par)
    F_shock = make_F_t(shock_par)

    if(norm_with_shocks) F_K = F_shock
    if(!norm_with_shocks) F_K = make_F_t(makepar_F_c(1))

    Ft = function(t){
      F_season(t)*F_trend(t)*F_K(t)
    }

    normit = (t1-t0)/integrate(Ft, t0, t1)$value

    if(form == "t"){
      Fa = function(a, d=0){
        t = a+d
        val = normit*avg*F_age(a)*F_season(t)*F_trend(t)*F_shock(t)
        val[a<0]=0
        return(val)
      }
      return(Fa)
    }
    if(form == "tV"){
      Fa = function(a, d=0, V=list()){
        t = a+d
        val = normit*avg*F_age(a)*F_season(t, V)*F_trend(t,V)*F_shock(t, V)
        val[a<0]=0
        return(val)
      }
      return(Fa)
    }
})}
