
#' @title Make a step function object
#'
#' @description The function \eqn{F(d)} or
#' \eqn{F(d,V)} returns \eqn{c_0} if \eqn{d\leq x}
#'
#' @param step_at the value of \eqn{d} where the step occurs
#' @param c0 the return value for \eqn{d} greater than `step_at`
#' @param c1 the return value for \eqn{d} greater than `step_at`
#' @param leq if TRUE, return `c0` for \eqn{d=} `step_at`
#' @param V if TRUE, then return \eqn{F(d, V)}, else return \eqn{F(d)}
#' @return a function
#' @export
makepar_F_step = function(step_at=1, c0=1, c1=0, leq=TRUE, V=TRUE){
  pars <- list()
  class(pars) <- "step"
  if(V) class(pars) = c(class(pars), "dV")
  if(!V) class(pars) = c(class(pars), "d")
  pars$x = step_at
  pars$c0 = c0
  pars$c1 = c1
  pars$leq=leq
  pars$V=V
  return(pars)
}

#' @title Make a Kernel \eqn{F(d,V)}
#'
#' @description Return a step
#' function
#'
#' @param F_obj a function object
#'
#' @return a step function
#'
#' @keywords internal
#' @export
make_K_dV.step = function(F_obj){with(F_obj,{
  if(leq){
    F_K = function(d, V=list()){
      K = 0*d + c1
      K[d<=x] = c0
      return(K)
    }
  } else {
    F_K = function(d, V=list()){
      K = 0*d + c1
      K[d<x] = c0
      return(K)
    }
  }
  return(F_K)
})}

#' @title Make a Kernel \eqn{F(d)}
#'
#' @description Return a step
#' function
#'
#' @param F_obj a function object
#'
#' @keywords internal
#' @return a step function
#'
#' @export
make_K_d.step = function(F_obj){with(F_obj,{
  if(leq){
    F_K = function(d){
      K = 0*d + c1
      K[d<=x] = c0
      return(K)
    }
  } else {
    F_K = function(d){
      K = 0*d + c1
      K[d<x] = c0
      return(K)
    }
  }
  return(F_K)
})}
