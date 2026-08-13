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




