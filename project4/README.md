# Project 4

## Task

Given a system of ordinary differential equations that describe the movement of a point and a set of initial conditions, determine the point's trajectory for *t* in range ⟨0; 20⟩.

Implement the following methods:
1. classic Runge-Kutta method (with fixed step),
2. a predictor-corrector method based on 4-step Adams methods (with fixed step),
3. adaptive RK4 method (with dynamic step)

Estimate approximation error on every step.

For fixed-step methods, find optimal step size. Plot all methods in comparison to the built-in `ode45`.

### Data
![`\begin{cases}x_1'=x_2+x_1(0.9-x_1^2-x_2^2)\\\x_2'=-x_1+x_2(0.9-x_1^2-x_2^2)\end{cases}`](https://latex.codecogs.com/gif.latex?\begin{cases}x_1'=x_2+x_1(0.9-x_1^2-x_2^2)\\\x_2'=-x_1+x_2(0.9-x_1^2-x_2^2)\end{cases})

Initial conditions:  
a) ![`x=\begin{bmatrix}10&9\end{bmatrix}^T`](https://latex.codecogs.com/gif.latex?x=\begin{bmatrix}10&9\end{bmatrix}^T)  
b) ![`x=\begin{bmatrix}0&7\end{bmatrix}^T`](https://latex.codecogs.com/gif.latex?x=\begin{bmatrix}0&7\end{bmatrix}^T)  
c) ![`x=\begin{bmatrix}7&0\end{bmatrix}^T`](https://latex.codecogs.com/gif.latex?x=\begin{bmatrix}7&0\end{bmatrix}^T)  
d) ![`x=\begin{bmatrix}0.001&0.001\end{bmatrix}^T`](https://latex.codecogs.com/gif.latex?x=\begin{bmatrix}0.001&0.001\end{bmatrix}^T)

## Results

### Code
 - [APC4conststep.m](APC4conststep.m): implementation of Adams-based predictor-corrector (with fixed step),
 - [RK4conststep.m](RK4conststep.m): implementation of RK4 (with fixed step),
 - [RK4step.m](RK4step.m): implementation of a single step of RK4,
 - [RK4varstep.m](RK4varstep.m): implementation of adaptive RK4 (with dynamic step),
 - [equationsystem.m](equationsystem.m), [getinitialposition.m](getinitialposition.m), [getrange.m](getrange.m): data providers (system of ODEs, initial conditions, time range),
 - [project4.m](project4.m): for plotting and printing out results and comparisons

### Report
The report is available in Polish: [report_pl.tex](report_pl.tex)
