# Make a Sine-based Seasonality Function

Return a seasonal pattern \\F_S(t)\\, a function of the form \$\$S(t) =
c \left(1+\epsilon + \sin\left(\frac{2 \pi
(t-\tau)}{365}\right)\right)^p\$\$ where \\c\\ is a normalizing
constant, and

- \\\epsilon \geq 0\\ or `bottom`

- \\\tau\\ or `phase`

- \\p\\ or `pw`

The algorithm sets the constant \\c\\ or `norm` such that
\$\$\int_0^{365} F_S(t) dt=c\$\$ where the default is `norm=365.`

## Usage

``` r
# S3 method for class 'sin'
make_F_t(F_obj)
```

## Arguments

- F_obj:

  a function object,
  [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md)

## Value

a function for seasonality

## See also

[makepar_F_sin](https://dd-harp.github.io/ramp.func/reference/makepar_F_sin.md)
