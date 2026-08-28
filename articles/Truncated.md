# Probability Mass Functions

In developing Tweedie functions for queuing models (see
`ramp.falciparum`), we use zero truncated functions to model the
multiplicity of exposure (MoE).

``` r

library(ramp.func)
```

## Zero Truncated Poisson

``` r

x <- 1:20
dx <- dPOIStrunc(1:20, 1)
sum(dx)
```

    ## [1] 1

``` r

sum(x*dx)
```

    ## [1] 1.581977

``` r

F_moe <- make_POIStrunc(1)
plot(F_moe(1:20), type = "h", lwd=2, 
     ylim = c(0, F_moe(1)), xlab = "x", 
     ylab = expression(F[MoE]))
```

![](Truncated_files/figure-html/unnamed-chunk-4-1.png)

## Zero Truncated Negative Binomial

``` r

x <- 1:40
dx <- dNBtrunc(x, 1, .5)
sum(dx)
```

    ## [1] 1

``` r

sum(x*dx)
```

    ## [1] 2.366024

``` r

F_moe <- make_NBtrunc(1, .5)
plot(F_moe(1:20), type = "h", lwd=2, 
     ylim = c(0, F_moe(1)), xlab = "x", 
     ylab = expression(F[MoE]))
```

![](Truncated_files/figure-html/unnamed-chunk-7-1.png)
