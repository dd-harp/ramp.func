# parameters for make_function

Return an object to configure a function
[make_function.sin](https://dd-harp.github.io/ramp.func/reference/make_function.sin.md)

## Usage

``` r
makepar_F_triggy(
  phase_par = makepar_F_c(0),
  bottom = 0,
  pw = 1,
  period = 365,
  norm = 365,
  N = 1
)
```

## Arguments

- phase_par:

  a function object for the phase parameter

- bottom:

  shape parameter

- pw:

  shape parameter

- period:

  the period of the sin function

- norm:

  the normalization period

- N:

  the length of the vector to return

## Value

a function for seasonality

## See also

[make_function.sin](https://dd-harp.github.io/ramp.func/reference/make_function.sin.md)
