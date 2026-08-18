# F_obj

In `ramp.trace`, **`F_obj`** describes an object used by
[make_F_t](https://dd-harp.github.io/ramp.qa/reference/make_F_t.md) and
[make_function](https://dd-harp.github.io/ramp.qa/reference/make_function.md)
to construct functions:

- An **`F_obj`** is returned by a function `makepar_F_method`

  - the object is list

  - each item in the list is a parameter

  - the `class` of the object is set to `method`

- The constructor functions dispatch on `class(F_obj)`

  - [make_F_t](https://dd-harp.github.io/ramp.qa/reference/make_F_t.md)
    returns functions of the form \\F(t)\\

  - [make_function](https://dd-harp.github.io/ramp.qa/reference/make_function.md)
    returns functions of the form \\F(t,V)\\

## See also

[make_F_t](https://dd-harp.github.io/ramp.qa/reference/make_F_t.md),
[make_function](https://dd-harp.github.io/ramp.qa/reference/make_function.md)
