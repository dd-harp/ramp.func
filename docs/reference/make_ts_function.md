# Make a Composed Time Series Function

Build a function that generates a time series with known functions. The
function returns a function of the form \\F_t(t)\\ or \\F_t(t, V(t))\\,
which is the a product of four configurable elements:

- \\\bar x\\: a mean value

- \\F_S(t)\\: a seasonal pattern

- \\F_T(t)\\: a trend

- \\F_K(t)\\: a shock

A normalizing constant is set such that the daily average over the
interval \\(t_0, t_1)\\ is 1: \$\$\int\_{t_0}^{t_1} F_t(t) dt =
t_1-t_0.\$\$

The user can pass any vector `times` and the interval is set to

- \\t_0 = \mbox{min(times)}\\, and

- \\t_1 = \mbox{max(times)}\\.

The component functions are specified by passing parameters for
[make_function](https://dd-harp.github.io/ramp.func/reference/make_function.md):

- `season_par` creates \\F_S(t)\\ or `F_season` (*eg,* using
  [makepar_F_sin](https://dd-harp.github.io/ramp.func/reference/makepar_F_sin.md))

- `trend_par` creates \\F_T(t)\\ or `F_trend` (*eg,* using
  [makepar_F_spline](https://dd-harp.github.io/ramp.func/reference/makepar_F_spline.md))

- `shock_par` creates \\F_K(t)\\ or `F_shock` (*eg,* using
  [makepar_F_sharkbite](https://dd-harp.github.io/ramp.func/reference/makepar_F_sharkbite.md))

## Usage

``` r
make_ts_function(
  avg = 1,
  season_par = list(),
  trend_par = list(),
  shock_par = list(),
  times = c(0, 365),
  norm_with_shocks = FALSE,
  N = 1,
  form = "tV",
  options = list()
)
```

## Arguments

- avg:

  the average

- season_par:

  seasonality function for

- trend_par:

  trend function parameters

- shock_par:

  trend function parameters

- times:

  normalize \\t_0 = \mbox{min(times)}\\ to \\t_1 = \mbox{max(times)}\\

- norm_with_shocks:

  if FALSE, set \\F_K(t)=1\\ for normalization

- N:

  the length of the return value

- form:

  functional form: "t" returns \\F(t)\\; "tV" returns \\F(t,V)\\

- options:

  configurable options

## Value

a function
