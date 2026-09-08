# Make a Function,

Construct a trace function to simulate exposure by age, \\a\\, in a
cohort born on day \\d\\, (and since age is related to time, \\t\\, by
the formula \\t = a+d\\), then we compute

\$\$F(a, d) = \begin{cases} 0 & \mbox{if } a \<0 \\ \bar E \times
F\_\omega(a) \times F_t(a+d) & \mbox{if } a \>=0 \end{cases}. \$\$

and

- \\\bar E\\ — or `avg` the approximate mean value

- \\F\_\omega(a)\\ — a function describing the relative biting rate by
  age

- \\F_t(t)\\ — the temporal pattern function.

The temporal pattern function \\F_t\\ is a composed time series
function: \$\$F_t(t) = x \times F_S(t) \times F_T(t) \times F_K(t)\$\$

where

- x — a normalizing constant

- \\F_S(t)\\ — a seasonal pattern function

- \\F_T(t)\\ — a trend pattern function

- \\F_K(t)\\ — a shock function

The normalizing constant is set such that the daily average over the
interval is 1: \$\$\int\_{t_0}^{t_1} F_t(t) dt = t_1-t_0.\$\$

By default \\t_0=d\\ and \\t_1=d+A\\, but if the user passes a non-NULL
value for `times` then the boundaries for the normalizing interval are
set to

- \\t_0 = \mbox{min(times)}\\, and

- \\t_1 = \mbox{max(times)}\\.

For convenience in constructing counterfactuals, normalization can be
done with or without the shock function.

By default, \\d=0\\

## Usage

``` r
make_F_a(
  A = 5 * 365,
  bday = 0,
  avg = 1,
  age_par = makepar_F_type2(),
  season_par = makepar_F_c(1),
  trend_par = makepar_F_c(1),
  shock_par = makepar_F_c(1),
  norm_with_shocks = TRUE,
  times = NULL,
  form = "t",
  options = list()
)
```

## Arguments

- A:

  the maximum age (in days)

- bday:

  the cohort birthday \\(d)\\

- avg:

  the average exposure, \\\bar E\\

- age_par:

  an [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md) for
  relative biting rate by age to construct \\F\_\omega\\ (see
  [age](https://dd-harp.github.io/ramp.func/reference/age.md))

- season_par:

  an [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md) for
  the seasonal pattern to construct \\F_S\\ (see
  [seasonality](https://dd-harp.github.io/ramp.func/reference/seasonality.md))

- trend_par:

  an [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md) for
  the trend to construct \\F_T\\ (see
  [trends](https://dd-harp.github.io/ramp.func/reference/trends.md))

- shock_par:

  an [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md) for
  to construct a perturbation function \\F_K\\ (see
  [shocks](https://dd-harp.github.io/ramp.func/reference/shocks.md))

- norm_with_shocks:

  if FALSE, set \\F_K(t)=1\\ for normalization

- times:

  if not NULL, normalize \\F_t\\ from \\t_0 = \mbox{min(times)}\\ to
  \\t_1 = \mbox{max(times)}\\

- form:

  functional form: "t" returns \\F(t)\\; "tV" returns \\F(t,V)\\

- options:

  a list of setup options

## Value

a function

## Note

A named list of options is an alternative way of passing arguments.
