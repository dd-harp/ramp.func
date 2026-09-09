# Shocks

------------------------------------------------------------------------

**Shocks — A Function Library**

- [Shark
  Functions](https://dd-harp.github.io/ramp.func/articles/Shark.html)

  - [`sharkfin`](https://dd-harp.github.io/ramp.func/articles/Shark.html)
    — the product of two sigmoidal functions

  - [`sharkbite`](https://dd-harp.github.io/ramp.func/articles/Shark.html)
    — the complement of a `sharkfin`

------------------------------------------------------------------------

In **`ramp.func`** a shock is a *perturbation* to a system. In malaria,
mass distribution of bed nets, mass spraying (indoors or out), mass
treatment, and mass vaccination are all *events* that perturb a system.
The **`ramp.func`** library includes some functions that are smooth and
differentiable, making it possible to simulate events like mass
treatment using ordinary differential equations. The library includes
functions to control the total size of a perturbation using intuitive
metrics: for example, simulate mass treatment over two weeks that
reaches 90% of a population.
