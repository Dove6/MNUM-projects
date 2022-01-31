function y = polynomialf(x, coeffs)
    % coeffs should be ordered from greatest to smallest index
    % e.g. [a4, a3, a2, a1, a0]
    y = sum(x .^ flip(0:(length(coeffs) - 1)) ...
        .* coeffs);
end
