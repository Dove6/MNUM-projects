function rnorm = residuum(A, x, b)
    rnorm = norm(A * x - b);
end
