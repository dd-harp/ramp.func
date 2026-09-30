
#' @title Make a Sinusoidal Function
#' @description Build a function that is the
#' product of two other functions
#' @inheritParams make_function
#' @return a function that is the product of two other functions
#' @keywords internal
#' @export
make_function.product = function(F_obj){
  F1 = make_function(F_obj$opts1)
  F2 = make_function(F_obj$opts2)
  F3 = function(t, V=list()){F1(t, V)*F2(t, V)}
  P <- F_obj$P
  if(P>0){
    integrate(F3, 0, P, rel.tol = F_obj$tol)$value -> c
    F4 = function(t, V=list()){F3(t, V)*P/c}
    return(F4)
  }
  return(F3)
}


#' @title Make a Sinusoidal Function
#' @description Build a function that is the
#' product of two other functions
#' @inheritParams make_function
#' @return a function that is the product of two other functions
#' @keywords internal
#' @export
make_F_t.product = function(F_obj){
  F1 = make_function(F_obj$opts1)
  F2 = make_function(F_obj$opts2)
  F3 = function(t){F1(t)*F2(t)}
  P <- F_obj$P
  if(P>0){
    integrate(F3, 0, P, rel.tol=F_obj$tol)$value -> c
    F3 = function(t){F3(t)*P/c}
  }
  return(F3)
}


#' @title parameters for make_function
#' @description Return an object to configure
#' a function [make_function.product].
#'
#' The parameter `P` facilitates Palization
#' over some period of time.  If
#' \eqn{P>0}, then a constant is set such that
#' \eqn{\int_0^P F(t) dt = P}
#'
#' @param opts1 options for first function
#' @param opts2 options for second function
#' @param P the period to normalize over
#' @param tol relative tolerance (for integration)
#'
#' @return a function
#' @export
makepar_F_product = function(opts1, opts2, P=0, tol = 1e-3){
  pars <- list()
  class(pars) <- "product"
  pars$opts1 <- opts1
  pars$opts2 <- opts2
  pars$P <- P
  pars$tol <- tol
  return(pars)
}

#' @title Make a Sinusoidal Function
#' @description Build a function that is the
#' product of two other functions
#' @inheritParams make_function
#' @return a function that is the product of two other functions
#' @keywords internal
#' @export
make_F_t.nproduct = function(F_obj){
  F1 = make_function(F_obj$opts1)
  F2 = make_function(F_obj$opts2)
  F3 = function(t){1-(1-F1(t))*(1-F2(t))}
  P <- F_obj$P
  if(P>0){
    integrate(F3, 0, P, rel.tol = F_obj$tol)$value -> c
    F4 = function(t){F3(t)*P/c}
    return(F4)
  }
  return(F3)
}

#' @title Make a Sinusoidal Function
#' @description Build a function that is the
#' product of two other functions
#' @inheritParams make_function
#' @return a function that is the product of two other functions
#' @keywords internal
#' @export
make_function.nproduct = function(F_obj){
  F1 = make_function(F_obj$opts1)
  F2 = make_function(F_obj$opts2)
  F3 = function(t, V=list()){1-(1-F1(t))*(1-F2(t))}
  P <- F_obj$P
  if(P>0){
    integrate(F3, 0, P, rel.tol = F_obj$tol)$value -> c
    F4 = function(t, V=list()){F3(t, V)*P/c}
    return(F4)
  }
  return(F3)
}


#' @title parameters for make_function
#' @description Return an object to configure
#' a function [make_function.product]
#' @param opts1 options for first function
#' @param opts2 options for second function
#' @param P the period to Palize over
#' @param tol relative tolerance (for integration)
#'
#' @return a function
#' @export
makepar_F_nproduct = function(opts1, opts2, P=0, tol=1e-3){
  pars <- list()
  class(pars) <- "nproduct"
  pars$opts1 <- opts1
  pars$opts2 <- opts2
  pars$P <- P
  pars$tol <- tol
  return(pars)
}
