# Basic Functions

``` r

library(ramp.func)
```

## Constant

## Sigmoidal Functions

``` r

ps1 <- makepar_F_sigmoid()
Fs1 <- make_function(ps1)
```

``` r

tt <- seq(0, 365, by=5)
plot(tt, Fs1(tt), type ="l", xlab = "Time (in Days)", ylab = expression(Fs1(t)))
```

![](Basic_files/figure-html/unnamed-chunk-3-1.png)
