function [x, rnorm, rcnd] = solvellsqr(A, b)
    [Q_, R_, d] = modifiedgramschmidt(A);
    x = linsolve(R_, inv(diag(d)) * Q_' * b);
    rnorm = residuum(R_, x, inv(diag(d)) * Q_' * b);
    rcnd = rcond(R_);
end
