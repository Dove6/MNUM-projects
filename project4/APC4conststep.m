function [t, result, errors] = APC4conststep(eqSys, tSpan, x0, stepSize)
    assert(length(tSpan) == 2, "TimeSpan must consist only of beginning and ending value");
    t = tSpan(1):stepSize:(tSpan(2) - eps);
    result = zeros(length(t), length(x0));
    result(1, :) = x0;
    evalResult = zeros(length(t), length(x0));
    evalResult(1, :) = eqSys(result(1, :));
    errors = zeros(size(result));
    errors(1, :) = ones(1, length(x0)) * eps;

    % Adams Predictor-Corrector (4-step)
    explicitBeta = [55 / 24, -59 / 24, 37 / 24, -9 / 24];
    implicitBeta = [251 / 720, 646 / 720, -264 / 720, 106 / 720, -19 / 720];
    % c*_{p+1} / (c_{p+1} - c*_{p+1}) = (19 / 720) / ((-251 / 720) - (19 / 720))
    errorConst = -19 / 270;

    % Adams PC needs k starting points, k = 4
    [~, RK4result, RK4errors] = RK4conststep(eqSys, [t(1), t(4) + stepSize / 2], x0, stepSize);
    result(2:4, :) = RK4result(2:4, :);
    errors(2:4, :) = RK4errors(2:4, :);
    evalResult(2, :) = eqSys(result(2, :));
    evalResult(3, :) = eqSys(result(3, :));
    evalResult(4, :) = eqSys(result(4, :));

    for i=5:length(t)
        % predictor (P_4)
        prediction = result(i - 1, :) + stepSize * (explicitBeta * evalResult((i - 4):(i - 1), :));
        % evaluator (E)
        evalResult(i, :) = eqSys(prediction);
        % corrector (C_4)
        result(i, :) = result(i - 1, :) + stepSize * (implicitBeta * evalResult((i - 4):i, :));
        % evaluator (E)
        evalResult(i, :) = eqSys(result(i, :));
        % approximation error estimate
        errors(i, :) = abs(errorConst * (prediction - result(i, :)));
        if any([isnan(errors(i, :)), isnan(result(i, :))])
            error("Method diverges.")
        end
    end
end
