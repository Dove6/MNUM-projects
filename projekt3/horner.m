function q = horner(a, root)
    % coeffs should be ordered from greatest to smallest index
    % e.g. [a4, a3, a2, a1, a0]
    q = zeros(1, length(a));
    for i=2:length(q)
        q(i) = a(i - 1) + q(i - 1) * root;
    end
    q = q(2:end);
end
