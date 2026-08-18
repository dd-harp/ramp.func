# Sharkfin

The `sharkfin` family of functions was designed to model perturbations
to a system.

The function is built in steps:

1.  take the product of two sigmoidal functions

    - the first one rises around day \\D\\ with rate parameter \\uk\\

    - the second one decays around day \\D+L\\ with rate \\-dk\\

2.  the product is raised a power \\pw\\

3.  the result is scaled so that the maximum is \\mx\\ For the default
    values, the function looks like a shark fin.
