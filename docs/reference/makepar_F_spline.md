# Make a spline [F_obj](https://dd-harp.github.io/ramp.qa/reference/F_obj.md)

Return a function obj A spline function \\T(t)\\ for
[trends](https://dd-harp.github.io/ramp.qa/reference/trends.md) is
specified by a set of \\n\\ interpolating points:

- time values \$\$t_1, t_2, \ldots, t_n,\$\$

- and corresponding \\y\\ values \$\$y_1, y_2, \ldots, y_n.\$\$

## Usage

``` r
makepar_F_spline(tt, yy, X = FALSE)
```

## Arguments

- tt:

  the nodes

- yy:

  the y values

- X:

  setup switch:
  FALSE=[splinef](https://dd-harp.github.io/ramp.qa/reference/splinef.md)
  \|
  TRUE=[splineX](https://dd-harp.github.io/ramp.qa/reference/splineX.md)
  \| 2=[spline2](https://dd-harp.github.io/ramp.qa/reference/spline2.md)

## Value

parameters to configure the `splinef` or `splineX` case of
`make_function`
