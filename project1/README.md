# Project 1

## Task

1. Write a solver for a system of *n* linear equations (in the form of **Ax=b**) using Gaussian elimination with partial pivoting.
2. Write another solver using the Jacobi method.

Test your implementations using *n* = 10, 20, 40, 80... equations (double the value until it takes too long to solve the system or solver fails).

Calculate the error for each solution (as the 2-norm of the residual vector) and plot it against *n*.

### Data

*i*, *j* = 1, 2, 3, ..., *n*

#### a)
![`a_{ij}=\begin{cases}7\quad\text{if }i=j\\3\quad\text{if }|i-j|=1\\0\quad\text{otherwise}\end{cases}`](https://latex.codecogs.com/gif.latex?a_{ij}=\begin{cases}7\quad\text{if&space;}i=j\\\3\quad\text{if&space;}|i-j|=1\\\0\quad\text{otherwise}\end{cases})  
![`b_i=5+0.2i`](https://latex.codecogs.com/gif.latex?b_i=5+0.2i)

#### b)
![`a_{ij}=\frac{5}{6(i+j-1)}`](https://latex.codecogs.com/gif.latex?a_{ij}=\frac{5}{6(i+j-1)})  
![`b_i=\begin{cases}\frac{1}{1.5i}\quad\text{if }i\text{ -- odd}\\0\quad\text{otherwise}\end{cases}`](https://latex.codecogs.com/gif.latex?b_i=\begin{cases}\frac{1}{1.5i}\quad\text{if&space;}i\text{&space;--&space;odd}\\\0\quad\text{otherwise}\end{cases})

## Results

### Code
 - [gaussiansolve.m](gaussiansolve.m): implementation of Gaussian elimination with partial pivoting,
 - [getdata1.m](getdata1.m), [getdata2.m](getdata2.m): data providers (returning **A** and **b** for a given *n*),
 - [jacobisolve.m](jacobisolve.m): implementation of Jacobi method,
 - [project1.m](project1.m): for plotting and printing out error data,
 - [residuum.m](residuum.m): residual vector calculcator,
 - [validateinput.m](validateinput.m): for making sure data has correct form,
 - [writecond.m](writecond.m): for writing matrix conditioning to files,
 - [writefinitesolve.m](writefinitesolve.m): for writing results of finite solvers to files,
 - [writeiterativesolve.m](writeiterativesolve.m): for writing results of iterative solvers to files,
 - [writesr.m](writesr.m): for writing spectral radii of matrices to files

### Report
The report is available in Polish: [report_pl.tex](report_pl.tex)
