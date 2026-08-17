# Make a Function, \\F(a\|d)\\

Build a trace function to simulate exposure by age. The function
substitutes age for time: given a birthday, \\d\\, age is \\a=t-d\\. The
function is a product of:

- \\x\\ — the mean

- \\\omega(a)\\ — a function describing the relative biting rate by age

- \\S(t)\\ — a seasonal pattern function

- \\T(t)\\ — a trend pattern function

- \\K(t)\\ — a shock function \$\$F(a \| d) = x \times \omega(a) \times
  S(t-d) \times T(t-d) \times K(t-d)\$\$

## Usage

``` r
make_F_a(x, age_par, season_par, trend_par, shock_par)
```

## Arguments

- opts:

  a named list

## Value

a function
