# Sharkbite

The `sharkbite` family of functions was designed to model *shocks* in a
**composed time series** function. The shock is designed to model effect
sizes of a perturbation.

The function is built in steps:

1.  take the product of two sigmoidal functions

    - the first one falls from 1 around day \\D\\ with rate parameter
      \\uk\\

    - the second one rises around day \\D+L\\ with rate \\-dk\\

2.  the product of is raised a power \\pw\\

3.  the result is scaled so that the maximum effect is \\mx\\ For the
    default values, the function looks like a shark bite.
