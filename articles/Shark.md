# Shark Functions

``` r

library(ramp.func)
```

``` r

c1 <- makepar_F_sharkfin()
C1<- make_function(c1)
```

``` r

tt <- seq(0, 565, by=5)
plot(tt, C1(tt), type ="l", xlab = "Time (in Days)", ylab = expression(Fs1(t)))
```

![](Shark_files/figure-html/unnamed-chunk-3-1.png)

``` r

c2a <- makepar_F_sharkfin(L = 90, dk = 1/110)
c2b <- makepar_F_sharkfin(L = 180, dk = 1/40)
```

``` r

c2 <- makepar_F_sharkfin(L = c(90, 180), dk = c(1/110, 1/40), pw=c(2,1), N=2)
```

``` r

C2<- make_function(c2)
```

``` r

C2t <- C2(tt)
```

``` r

plot(tt, C2t[1,], type ="l", xlab = "Time (in Days)", ylab = expression(Fs1(t)))
lines(tt, C2t[2,])
```

![](Shark_files/figure-html/unnamed-chunk-8-1.png)
