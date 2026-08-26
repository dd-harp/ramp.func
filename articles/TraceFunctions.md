# Trace Functions

Malaria (and other mosquito-transmitted pathogens) can be understood as
*complex adaptive systems:* they are non-linear interactions among
humans, parasites, mosquitoes, and managers that are forced by weather,
landscapes and hydrology, and some biotic factors.

Dynamical systems developed to understand malaria epidemiology, malaria
transmission dynamics, and mosquito ecology are naturally modular. Given
the complexity, it is sometimes difficult to tease apart effects of
forcing by malaria control, weather, or biotic factors. In developing or
analyzing these models, it is often useful to isolate some part of the
system, and *force* the rest using a function that stands in place of
another complex module. We call these functions **trace functions.**

## Constructing Functions

The trace function library has two core constructors:

- `make_F_t(F_obj)` returns a function of the form \\F(t)\\

- `make_function(F_obj)` returns a function of the form \\F(t,V)\\

Both functions construct a function using an object called `F_obj`.
These two function classes are, in turn, used by two other core
functions:

- `make_ts_function` constructs a [*composed time series
  function*](https://dd-harp.github.io/ramp.func/articles/TimeSeries.html).

- `make_F_a` constructs a cohort forcing function, a function to study
  [cohort
  dynamics](https://dd-harp.github.io/ramp.func/articles/Cohorts.html)
  in a cohort as it ages, as a function of:

  - a composed time series function describing average exposure in a
    population;

  - a function describing relative biting rates by age.

## Supported Software

This package supports the `ramp` suite, which has two parts:

- [**SimBA**](https://faculty.washington.edu/smitdave/simba/) – a set of
  six other packages developed for simulation-based analytics

- **`ramp.falciparum`** — takes a deep dive into malaria epidemiology

- **`ramp.micro`** – explores micro-simulation for mosquito ecology and
  malaria transmission.

**`ramp.func`** — was originally developed within other `ramp` software
packages. A set of time series functions to model forcing was originally
devised for **`ramp.falciparum`**, which takes a deep dive into
falciparum malaria epidemiology. Later, the same functionality was built
into **`ramp.xds`** and **`ramp.micro`**. To avoid maintaining duplicate
software libraries, we developed **`ramp.func`**.

In addition to the time-series function library, **`ramp.func`** also
includes a function library to support development of spatial kernel
functions.

### **SimBA**

In **SimBA,** we can use the **trace function** library to build
functions that set the value of one or more **dynamical terms,**
configured using one of the **trivial modules** in **`ramp.xds`**.

- \\\Lambda(t)\\ — the emergence rate of adult, female mosquitoes

- \\\eta(t)\\ — egg laying by adult mosquitoes

- \\E(t)\\ — the daily entomological inoculation rate (EIR)

- \\\kappa(t)\\ — the net infectiousness (NI)

In **`ramp.forcing`**, these functions can be used to construct
non-autonomous dynamical systems, where parameters can vary with respect
to time, including models for exogenous variables, intervention
coverage, parameter values, or functional responses to weather.

In **`ramp.work`**, we use trace functions to fit models to time series
data.

### **`ramp.falciparum`**

Alternatively, in **`ramp.falciparum`**, where we take a deep dive into
malaria epidemiology, we often find it useful to construct functions to
model exposure in cohorts as a function of age (see
[Cohorts](https://dd-harp.github.io/ramp.func/articles/Cohorts.md)).

### **`ramp.micro`**

Microsimulation models force models for adult mosquito ecology using the
term \\\Lambda(t)\\ (like SimBA).
