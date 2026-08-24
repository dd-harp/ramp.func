# Composed Time Series

In studies, we will often find it useful to construct functions that
output the value of some exogenous variable over time. This package —
**`ramp.func`** — has utilities to construct and modify ***composed time
series*** functions. Each function is the product of four components:

\\ x(t) = \bar x \times F_S(t) \times F_T(t) \times F_K(t) \\

where

- \\\bar x\\ is a scaling parameter. It is close to the mean value of an
  unperturbed system. It is the mean over an interval \\(t_0, t_1)\\
  only if \\F_K(t)=1\\ and \\\int\_{t_0}^{t_1} F_S(t)\\ F_T(t)\\ dt =
  t_1-t_0\\

- \\F_S(t)\>0\\ is a **seasonal** pattern function, normalized over the
  interval such that \\\int\_{t_0}^{t_1} F_S(t) \\dt = t_1 - t_0\\

- \\F_T(t)\>0\\ is a **trend** pattern function, normalized over the
  interval such that \\\int\_{t_0}^{t_1} F_T(t) \\ dt = t_1 - t_0\\

- \\F_K(t)\>0\\ is a **shock** function
