function [t, result, errors] = RK4conststep(eqSys, tSpan, x0, stepSize)
    assert(length(tSpan) == 2, "TimeSpan must consist only of beginning and ending value");
    t = tSpan(1):stepSize:(tSpan(2) - eps);
    result = zeros(length(t), length(x0));
    result(1, :) = x0;
    errors = zeros(size(result));
    errors(1, :) = ones(1, length(x0)) * eps;
    errorConst = 16 / 15;

    for i=2:length(t)
        result(i, :) = RK4step(eqSys, result(i - 1, :), stepSize);
        % approximation error estimate
        helperResult = RK4step(eqSys, result(i - 1, :), stepSize / 2);
        helperResult = RK4step(eqSys, helperResult, stepSize / 2);
        errors(i, :) = abs(errorConst * (helperResult - result(i, :)));
        if any([isnan(errors(i, :)), isnan(result(i, :))])
            error("Method diverges.")
        end
    end
end
