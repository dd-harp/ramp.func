# Check the Length

Check the length of a vector \\x\\:

- If it is a scalar and `fixit = TRUE`, then return the value as a
  vector of length \\N\\

- Otherwise, if it is a vector, stop if it's length is not \\N\\

## Usage

``` r
check_length(x, N, fixit = TRUE)
```

## Arguments

- x:

  a [numeric](https://rdrr.io/r/base/numeric.html) object

- N:

  an integer, the length

- fixit:

  a [logical](https://rdrr.io/r/base/logical.html) value, if TRUE force
  length to N

## Value

a vector of length \\N\\
