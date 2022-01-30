function [x, rnorm, rcnd] = solvellsnormal(A, b)
    x = linsolve(A' * A, A' * b);
    rnorm = residuum(A' * A, x, A' * b);
    rcnd = rcond(A' * A);
end
