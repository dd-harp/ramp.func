# Cohort Dynamics

``` r

library(ramp.trace)
```

## Example

To illustrate, we set up the same model using three different setup
functions.

``` r

Sp <- makepar_F_sin()
F_s <- make_function(Sp)
Tp <- makepar_F_spline(tt=365*c(0:5), yy=c(1,1,1.6,.3,.7,1))
F_t <- make_function(Tp)
```

``` r

tt = seq(0, 5*365, by = 10)
plot(tt, F_s(tt), type ="l", ylab = "Seasonality, Trend", xlab = "Time (in Days)")
lines(tt, F_t(tt), type ="l")
```

![](Cohorts_files/figure-html/unnamed-chunk-4-1.png)
