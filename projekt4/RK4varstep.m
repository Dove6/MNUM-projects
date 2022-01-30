function [t, result, errors] = RK4varstep(eqSys, tSpan, x0, initStepSize, minStepSize, absTolerance, relTolerance)
    assert(length(absTolerance) == 1, "Absolute tolerance must be a scalar value");
    assert(absTolerance > 0, "Absolute tolerance must be positive");
    assert(length(relTolerance) == 1, "Relative tolerance must be a scalar value");
    assert(relTolerance > 0, "Relative tolerance must be positive");
    assert(length(tSpan) == 2, "TimeSpan must consist only of beginning and ending value");
    t(1) = tSpan(1);
    result(1, :) = x0;
    errors(1, :) = ones(1, length(x0)) * eps;
    errorConst = 16 / 15;
    safetyCoeff = 0.9;
    maxStepMultiplier = 5;

    stepSize = initStepSize;
    i = 2;
    while t(i - 1) < tSpan(2)
        t(i) = t(i - 1) + stepSize;
        result(i, :) = RK4step(eqSys, result(i - 1, :), stepSize);
        % approximation error estimate
        helperResult = RK4step(eqSys, result(i - 1, :), stepSize / 2);
        helperResult = RK4step(eqSys, helperResult, stepSize / 2);
        errors(i, :) = abs(errorConst * (helperResult - result(i, :)));
        % step size correction
        tolerance = abs(result(i, :)) * relTolerance + absTolerance;
        alpha = min((tolerance ./ errors(i, :)) .^ (1 / 5));
        if isnan(alpha)
            alpha = 0.99;
        end
        if safetyCoeff * alpha >= 1
            stepSize = min([safetyCoeff * alpha * stepSize, maxStepMultiplier * stepSize, tSpan(2) - t(i)]);
            i = i + 1;
        else
            stepSize = safetyCoeff * alpha * stepSize;
            assert(stepSize > minStepSize, "Step below the specified limit");
        end
    end
end
