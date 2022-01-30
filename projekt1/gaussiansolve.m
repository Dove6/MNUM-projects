function x = gaussiansolve(A, b)
    validateinput(A, b);
    n = size(A, 1);

    % elimination
    for k = 1:(n - 1)
        % choosing pivot every iteration to minimize numeric errors
        [~, pivot_row] = max(abs(A(k:n, k)));
        pivot_row = pivot_row + k - 1;
        A([k, pivot_row], :) = A([pivot_row, k], :);
        b([k, pivot_row], :) = b([pivot_row, k], :);
        for i = (k + 1):n
            % storing L matrix in zeroed part of U matrix
            A(i, k) = A(i, k) / A(k, k);
            A(i, (k + 1):n) = A(i, (k + 1):n) - A(i, k) .* A(k, (k + 1):n);
            b(i) = b(i) - A(i, k) .* b(k);
        end
    end

    % back-substitution
    x = zeros(n, 1);
    x(n) = b(n) / A(n, n);
    for k = flip(1:(n - 1))
        x(k) = (b(k) - sum(A(k, (k+1):n) .* x((k+1):n)')) ./ A(k, k);
    end
end

function out = LfromLU(LU)
    out = eye(size(LU, 1)) + tril(LU, -1);
end

function out = UfromLU(LU)
    out = triu(LU);
end
