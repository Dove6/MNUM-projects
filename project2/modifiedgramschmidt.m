function [Q_, R_, d] = modifiedgramschmidt(A)
    [m, n] = size(A);
    Q_ = zeros(m, n);
    R_ = eye(n);
    d = zeros(n, 1);

    for i = 1:n
        Q_(:, i) = A(:, i);
        d(i) = Q_(:, i)' * Q_(:, i);
        for j = (i + 1):n
            R_(i, j) = Q_(:, i)' * A(:, j) / d(i);
            A(:, j) = A(:, j) - R_(i, j) * Q_(:, i);
        end
    end
end
