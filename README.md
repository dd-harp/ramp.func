---
header-includes:
- \usepackage{mathjaxr}
- \usepackage{euscript}
- \usepackage{mathscr}
--- 

# **`ramp.func`** 

## The RAMP Function Library

## Install **`ramp.func`** 

To install the latest version from GitHub, run the following lines of code in an R session.

```
library(devtools)
devtools::install_github("dd-harp/ramp.func")
```

## Trace Functions

In **`ramp.func`**, the term [***trace function***](https://dd-harp.github.io/ramp.func/articles/TraceFunctions.html) describes any function that sets the value of a parameter, variable, or term in a dynamical system. 
In models of malaria epidemiology, transmission dynamics, and control, it is often useful to isolate one of the dynamical components to study it in isolation, 
rather than study it as part of a dynamical system that is coupled to some other complex process. 
Typically, the trace function holds information from some other process: 
dynamical terms (*e.g.* the entomological inoculation rate), 
variables describing weather or vector control, or perturbations to a system.

The functions defined herein are used by other `ramp` packages:  

+ These functions are used by `ramp.xds` and its satellite package `ramp.forcing` to configure forcing in the trivial modules. 

+ These functions are used by `ramp.falciparum` for exposure exposure. 

## Kernels

In **`ramp.xds`**, the term ***kernel*** describes any function we use to generate a probability mass function to model a spatial process:

+ Mosquito dispersal among patches in **`ramp.xds`** 

+ Mosquito disperssal among points in **`ramp.micro`** 

+ Human time spent matrices

## Functional Responses

In developing a mathematical framework to model mosquito-transmitted pathogens, the `ramp` packages draw inspiration from ecology and other disciplines. 
One idea from ecology is a *functional response,* the shape of a function describing a consumption rate in response to resource availability.
More generally, it is any function describing how a rate or probability varies in relation to some other variable. 
The functional response library here serves other roles as well: 

+ blood feeding rates or egg laying rates in relation to the availability of blood hosts or aquatic habitats.

+ mosquito mortality rates in relation to temperature. 
