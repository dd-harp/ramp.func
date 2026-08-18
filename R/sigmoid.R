#' @title Make a Sigmoidal Function
#'
#' @description Build a function to model a
#' forced seasonal signal. The shape parameters determine
#' the timing, frequency, and relative intensity
#' over the season. The function is normalized
#' to have an annual value set by `norm`
#'
#' @inheritParams make_function
#' @importFrom stats integrate
#' @return a function
#' @keywords internal
#' @export
make_F_t.sigmoid = function(F_obj){
  F_obj$normit = rep(1, F_obj$N)
  for(i in 1:F_obj$N){
    F1 = with(F_obj,function(t){1e-15+exp(k[i]*(t-D[i]))/(1+exp(k[i]*(t-D[i])))})
    over_T = ifelse(T>0, integrate(F1, 0, T)$val, 1)
    F_obj$normit[i] <- F_obj$normit[i]/over_T
  }
  F2 = with(F_obj,function(t){1e-15+exp(k*(t-D))/(1+exp(k*(t-D)))})
  F3 = function(t){if(length(t) == 1) return(F2(t)) else return(sapply(t, F2))}
  return(F3)
}

#' @title Make a Sigmoidal Function
#' @description Build a function to model a
#' forced seasonal signal. The shape parameters determine
#' the timing, frequency, and relative intensity
#' over the season. The function is normalized
#' to have an annual value set by `norm`
#' @inheritParams make_function
#' @importFrom stats integrate
#' @return a function
#' @keywords internal
#' @export
make_function.sigmoid = function(F_obj){
  F_obj$normit = rep(1, F_obj$N)
  for(i in 1:F_obj$N){
    F1 = with(F_obj,function(t){1e-15+exp(k[i]*(t-D[i]))/(1+exp(k[i]*(t-D[i])))})
    over_T = ifelse(T>0, integrate(F1, 0, T)$val, 1)
    F_obj$normit[i] <- F_obj$normit[i]/over_T
  }
  F2 = with(F_obj,function(t, V=list()){1e-15+exp(k*(t-D))/(1+exp(k*(t-D)))})
  F3 = function(t, V=list()){if(length(t) == 1) return(F2(t,V)) else return(sapply(t, F2,V=V))}
  return(F3)
}

#' @title Make Parameters for a Sigmoidal Function
#' @description Return an object to configure
#' a function [make_function.sigmoid]
#' @param k the rate parameter
#' @param D the half-saturation day
#' @param Tl length of interval to normalize over
#' @param N the length of the vector to return
#' @return a sigmoidal function
#' @export
makepar_F_sigmoid = function(k=1/7, D=100, Tl=0, N=1){
  pars <- list()
  class(pars) <- c("sigmoid", "list")
  pars$k = check_length(k, N)
  pars$D = check_length(D, N)
  pars$Tl=Tl
  pars$N=N
  return(pars)
}
