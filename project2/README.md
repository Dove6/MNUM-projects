# Project 2

## Task

Determine parameters for the best polynomial approximation of given points using the least-squares method. Check results (and errors, which equal the 2-norm of the residual vector) for various degrees of a polynomial.

Perform linear least-squares fitting on:

1. system of normal equations,
2. system of linear equations obtained in the process of QR decomposition

### Data

Samples aren't precise (because of measurement noise).

| ![`x_i`](https://latex.codecogs.com/gif.latex?x_i) | ![`y_i`](https://latex.codecogs.com/gif.latex?y_i) |
| -- | -------- |
| -5 | -32.9591 |
| -4 | -20.7011 |
| -3 | -12.6986 |
| -2 |  -5.1508 |
| -1 |  -1.6893 |
|  0 |   0.1266 |
|  1 |   0.0743 |
|  2 |  -0.8709 |
|  3 |  -1.7371 |
|  4 |  -3.9952 |
|  5 |  -4.8987 |

## Results

### Code
 - [approximatepolynomial.m](approximatepolynomial.m): wrapper for solvers,
 - [getdata.m](getdata.m): data provider (**x** and **y** vectors),
 - [modifiedgramschmidt.m](modifiedgramschmidt.m): implementation of modified Gram-Schmidt orthogonalization algorithm,
 - [project2.m](project2.m): for running solvers and processing results,
 - [residuum.m](residuum.m): residual vector calculcator,
 - [solvellsnormal.m](solvellsnormal.m): normal equations-based solver,
 - [solvellsqr.m](solvellsqr.m): QR decomposition-based solver,
 - [writedata.m](writedata.m): for writing results of approximation to files

### Report
The report is available in Polish: [report_pl.tex](report_pl.tex)
