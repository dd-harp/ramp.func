
#' @title Make a Sinusoidal Function
#' @description Build a function that is the
#' product of two other functions
#' @inheritParams make_function
#' @return a function that is the product of two other functions
#' @keywords internal
#' @export
make_function.product = function(opts){ d
  F1 = make_function(opts$opts1)
  F2 = make_function(opts$opts2)
  F3 = function(t, V=list()){F1(t, V)*F2(t, V)}
  return(F3)
}


#' @title Make a Sinusoidal Function
#' @description Build a function that is the
#' product of two other functions
#' @inheritParams make_function
#' @return a function that is the product of two other functions
#' @keywords internal
#' @export
make_F_t.product = function(opts){
  F1 = make_function(opts$opts1)
  F2 = make_function(opts$opts2)
  F3 = function(t){F1(t)*F2(t)}
  return(F3)
}


#' @title parameters for make_function
#' @description Return an object to configure
#' a function [make_function.product]
#' @param opts1 options for first function
#' @param opts2 options for second function
#' @return a function
#' @export
makepar_F_product = function(opts1, opts2){
  pars <- list()
  class(pars) <- "product"
  pars$opts1 <- opts1
  pars$opts2 <- opts2
  return(pars)
}

#' @title Make a Sinusoidal Function
#' @description Build a function that is the
#' product of two other functions
#' @inheritParams make_function
#' @return a function that is the product of two other functions
#' @keywords internal
#' @export
make_function.nproduct = function(opts){
  F1 = make_function(opts$opts1)
  F2 = make_function(opts$opts2)
  F3 = function(t){1-(1-F1(t))*(1-F2(t))}
  return(F3)
}

#' @title parameters for make_function
#' @description Return an object to configure
#' a function [make_function.product]
#' @param opts1 options for first function
#' @param opts2 options for second function
#' @return a function
#' @export
makepar_F_nproduct = function(opts1, opts2){
  pars <- list()
  class(pars) <- "nproduct"
  pars$opts1 <- opts1
  pars$opts2 <- opts2
  return(pars)
}
