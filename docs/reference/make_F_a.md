# Make a Function, \\F(a,d)\\

Construct a trace function to simulate exposure by age using
[make_F_t](https://dd-harp.github.io/ramp.func/reference/make_F_t.md).

The function substitutes age for time: given a birthday, \\d\\, age is
\\a=t-d\\. The function is a product of:

- \\\bar X\\ — or `avg` the approximate mean value

- \\F\_\omega(a)\\ — a function describing the relative biting rate by
  age

- \\F_S(t)\\ — a seasonal pattern function

- \\F_T(t)\\ — a trend pattern function

- \\F_K(t)\\ — a shock function \$\$F(a, d) = x \times \omega(a) \times
  F_S(t-d) \times F_T(t-d) \times F_K(t-d)\$\$

For convenience, \\d\\ is an optional argument with a default value
\\d=0\\

## Usage

``` r
make_F_a(
  avg,
  age_par = makepar_F_c(1),
  season_par = makepar_F_c(1),
  trend_par = makepar_F_c(1),
  shock_par = makepar_F_c(1)
)
```

## Arguments

- avg:

  the function average

- age_par:

  an [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md) for
  relative biting rate by age

- season_par:

  an [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md) for
  the seasonal pattern (see
  [seasonality](https://dd-harp.github.io/ramp.func/reference/seasonality.md))

- trend_par:

  an [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md) for
  the trend (see
  [trends](https://dd-harp.github.io/ramp.func/reference/trends.md))

- shock_par:

  an [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md) for
  a perturbation (see
  [shocks](https://dd-harp.github.io/ramp.func/reference/shocks.md))

## Value

a function
