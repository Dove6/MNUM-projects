function root = newton(func, derivative, startPoint, valueTolerance)
    assert(valueTolerance > 0);

    root = startPoint;

    while abs(func(root)) > valueTolerance
        root = root - func(root) / derivative(root)
    end
end
