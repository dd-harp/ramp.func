# Make a sharkbite Function

A sharkbite function is built in steps:

1.  take the product of two sigmoidal functions

    - the first one rises around day \\D\\ with rate parameter \\uk\\

    - the second one decays around day \\D+L\\ with rate \\-dk\\

2.  the product is raised a power \\pw\\

3.  the result is scaled so that the maximum is \\mx\\ For the default
    values, the function looks like a shark fin.

## Usage

``` r
# S3 method for class 'sharkbite'
make_F_t(F_obj)
```

## Arguments

- F_obj:

  a function object,
  [F_obj](https://dd-harp.github.io/ramp.func/reference/F_obj.md)

## Value

a function
