function roots = task2(valueTolerance)
    assert(valueTolerance > 0);

    a = [-1, -7, 7, 3, 9];
    roots = zeros(1, length(a) - 1);

    q = a;
    for i=1:length(roots)
        roots(i) = mullerpolynomial(q, 0, valueTolerance)
        % polishing
        if i > 1
            roots(i) = newton(@(x) polynomialf(x, q), @(x) polynomiald1(x, q), roots(i), valueTolerance)
        end
        q = horner(q, roots(i));
    end
end
