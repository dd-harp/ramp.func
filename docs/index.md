# **`ramp.trace`** - The RAMP Trace Function Library

## Install **`ramp.trace`**

To install the latest version from GitHub, run the following lines of
code in an R session.

    library(devtools)
    devtools::install_github("dd-harp/ramp.trace")

## Trace Functions

The term **trace function** herein describes a function that sets the
value of some quantity in a mathematical model. In models of malaria
epidemiology, transmission dynamics, and control, it is often useful to
isolate one of the dynamical components to study it in isolation, rather
than study it as part of a dynamical system that is coupled to some
other complex process. The functions defined herein are used by other
`ramp` packages that are part of **SimBA**:

- These functions are used by `ramp.xds` and its satellite package
  `ramp.forcing` to configure forcing in the trivial modules.

- These functions are used by `ramp.falciparum` to configure exposure.
