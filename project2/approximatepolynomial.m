function [a, approxErr, solverErr, solverCond] = approximatepolynomial(A, ySamples, solver)
    [a, solverErr, solverCond] = solver(A, ySamples);
    approxErr = residuum(A, a, ySamples);
end
