
#' @title Make a Sharkfin Function
#' @description A sharkfin function is built in steps:
#' 1. take the product of two sigmoidal functions
#'      - the first one rises around day \eqn{D} with rate parameter \eqn{uk}
#'      - the second one decays around day \eqn{D+L} with rate \eqn{-dk}
#' 2. the product is raised a power \eqn{pw}
#' 3. the result is scaled so that the maximum is \eqn{mx}
#' For the default values, the function looks like a shark fin.
#' @inheritParams make_function
#' @return a function
#' @keywords internal
#' @export
make_function.sharkfin = function(opts){
  siggy <- function(t, k=1, D=1){
    x = pmax(pmin(k*(t-D),80),-80); exp(-x)/(1+exp(-x))}
  opts$normit = opts$mx
  for(i in 1:opts$N){
    F1 = with(opts,function(t){((1-siggy(t, uk[i], D[i]))*siggy(t,dk[i],D[i]+L[i]))^pw[i]})
    tt <- with(opts, c(D[i]:(D[i]+L[i])))
    mx <- max(F1(tt))
    opts$normit[i] <- opts$normit[i]/mx
  }
  F2 = with(opts,function(t){normit*((1-siggy(t, uk, D))*siggy(t, dk, D+L))^pw})
  F3 = function(t){if(length(t) == 1) return(F2(t)) else return(sapply(t, F2))}
  return(F3)
}


#' @title Make Parameters for a Sharkfin Function
#' @description Return an object for [make_function.sharkfin]
#' @param D the half-saturation day for scale-up
#' @param L the half-saturation day for decay
#' @param uk shape parameter for scale-up
#' @param dk shape parameter for decay
#' @param pw shape parameter, power
#' @param mx a maximum value
#' @param N the length of the vector to return
#' @return a function F_season
#' @export
makepar_F_sharkfin = function(D=100, L=180, uk = 1/7, dk=1/40, pw=1, mx=1, N=1){
  pars <- list()
  class(pars) <- "sharkfin"
  pars$D = check_length(D, N)
  pars$L = check_length(L, N)
  pars$uk = check_length(uk, N)
  pars$dk = check_length(dk, N)
  pars$pw = check_length(pw, N)
  pars$mx = check_length(mx, N)
  pars$N = N
  return(pars)
}

#' @title Make a sharkbite Function
#' @description A sharkbite function is built in steps:
#' 1. take the product of two sigmoidal functions
#'      - the first one rises around day \eqn{D} with rate parameter \eqn{uk}
#'      - the second one decays around day \eqn{D+L} with rate \eqn{-dk}
#' 2. the product is raised a power \eqn{pw}
#' 3. the result is scaled so that the maximum is \eqn{mx}
#' For the default values, the function looks like a shark fin.
#' @inheritParams make_function
#' @return a function
#' @keywords internal
#' @export
make_function.sharkbite = function(opts){
  siggy <- function(t, k=1, D=1){
    x = pmax(pmin(k*(t-D),80),-80); exp(-x)/(1+exp(-x))}
  opts$normit = opts$mx
  for(i in 1:opts$N){
    F1 = with(opts,function(t){((1-siggy(t, uk[i], D[i]))*siggy(t,dk[i],D[i]+L[i]))^pw[i]})
    tt <- with(opts, c(D[i]:(D[i]+L[i])))
    mx <- max(F1(tt))
    opts$normit[i] <- opts$normit[i]/mx
  }
  #  F2 = with(opts,function(t){normit*((1-siggy(t, uk, D))*siggy(t, dk, D+L))^pw})
  F2 = with(opts,function(t){1-normit*((1-siggy(t, uk, D))*siggy(t, dk, D+L))^pw})
  F3 = function(t){if(length(t) == 1) return(F2(t)) else return(sapply(t, F2))}
  return(F3)
}


#' @title Make Parameters for a sharkbite Function
#' @description Return an object for [make_function.sharkbite]
#' @param D the half-saturation day for scale-up
#' @param L the half-saturation day for decay
#' @param uk shape parameter for scale-up
#' @param dk shape parameter for decay
#' @param pw shape parameter, power
#' @param mx a maximum value
#' @param N the length of the vector to return
#' @return a function F_season
#' @export
makepar_F_sharkbite = function(D=100, L=180, uk = 1/7, dk=1/40, pw=1, mx=1, N=1){
  pars <- list()
  class(pars) <- "sharkbite"
  pars$D = check_length(D, N)
  pars$L = check_length(L, N)
  pars$uk = check_length(uk, N)
  pars$dk = check_length(dk, N)
  pars$pw = check_length(pw, N)
  pars$mx = check_length(mx, N)
  pars$N = N
  return(pars)
}
