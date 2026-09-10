# Make a step function object

The function \\F(d)\\ or \\F(d,V)\\ returns \\c_0\\ if \\d\leq x\\

## Usage

``` r
makepar_F_step(step_at = 1, c0 = 1, c1 = 0, leq = TRUE, V = TRUE)
```

## Arguments

- step_at:

  the value of \\d\\ where the step occurs

- c0:

  the return value for \\d\\ greater than `step_at`

- c1:

  the return value for \\d\\ greater than `step_at`

- leq:

  if TRUE, return `c0` for \\d=\\ `step_at`

- V:

  if TRUE, then return \\F(d, V)\\, else return \\F(d)\\

## Value

a function
