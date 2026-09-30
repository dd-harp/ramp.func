# parameters for make_function

Return an object to configure a function
[make_function.product](https://dd-harp.github.io/ramp.func/reference/make_function.product.md).

The parameter `P` facilitates Palization over some period of time. If
\\P\>0\\, then a constant is set such that \\\int_0^P F(t) dt = P\\

## Usage

``` r
makepar_F_product(opts1, opts2, P = 0, tol = 0.001)
```

## Arguments

- opts1:

  options for first function

- opts2:

  options for second function

- P:

  the period to normalize over

- tol:

  relative tolerance (for integration)

## Value

a function
