function root = regulafalsi(func, startRange, valueTolerance, rangeWidthTolerance)
    assert(size(startRange, 2) == 2, ...
        "startRange: Expected vector of size 2");
    assert(func(startRange(1)) * func(startRange(2)) < 0, ...
        "func, startRange: Expected function values to be opposite at the ends of specified range");
    assert(valueTolerance > 0);
    assert(rangeWidthTolerance > 0);

    a = min(startRange);
    b = max(startRange);

    while min(abs(func(a)), abs(func(b))) > valueTolerance && b - a > rangeWidthTolerance
        c = (a * func(b) - b * func(a)) / (func(b) - func(a));
        if func(a) * func(c) < 0
            b = c;
        else
            a = c;
        end
        [a, b]
    end

    if abs(func(a)) < abs(func(b))
        root = a;
    else
        root = b;
    end
end
