# Project 3

## Task

1. Find all zeros of the function:  
![`f_1(x)=3.1-3x-e^{-x}`](https://latex.codecogs.com/gif.latex?f_1(x)=3.1-3x-e^{-x})  
for *x* in range ⟨-5; 10⟩ using  
a) *regula falsi* method,  
b) Newton's method.  
Compare methods. Plot the function and starting points/ranges of methods.
2. Find all real and complex roots of the polynomial:  
![`f_2(x)=-x^4-7x^3+7x^2+3x+9`](https://latex.codecogs.com/gif.latex?f_2(x)=-x^4-7x^3+7x^2+3x+9)  
using derivative-based Muller's method.

## Results

### Code
 - [exponentialf.m](exponentialf.m), [exponentiald1.m](exponentiald1.m): the first function (exponential0) and its first derivative,
 - [horner.m](horner.m): polynomial division using Horner's scheme,
 - [mullerpolynomial.m](mullerpolynomial.m): implementation of Muller's method,
 - [newton.m](newton.m): implementation of Newton's method,
 - [polynomialf.m](polynomialf.m), [polynomiald1.m](polynomiald1.m), [polynomiald2.m](polynomiald2.m): the second function (polynomial) and its first and second derivative,
 - [regulafalsi.m](regulafalsi.m): implementation of *regula falsi* method,
 - [task1.m](task1.m): original function plotter,
 - [task2.m](task2.m): wrapper for Muller's method with deflation and root polishing

### Report
The report is available in Polish: [report_pl.tex](report_pl.tex)
