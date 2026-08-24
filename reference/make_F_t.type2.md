# Make a type2 function for age

Return an age pattern \\F\_\omega(a)\\, a function of the form
\$\$F\_\omega(a) = \frac{A(a+\tau)}{B+a+\tau}\$\$ where \\\tau\\ is a
shift so that \\\omega(0) \> 0\\ and \\A\\ and \\B\\ are shape
parameters

## Usage

``` r
# S3 method for class 'type2'
make_F_t(F_obj)
```

## Arguments

- F_obj:

  a function object,
  [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md)

## Value

a function for seasonality

## See also

[makepar_F_type2](https://dd-harp.github.io/ramp.func/reference/makepar_F_type2.md)
