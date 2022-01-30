function [] = projekt4(taskNo)
    if taskNo == 1
        zadanie1();
    elseif taskNo == 2
        zadanie2();
    elseif taskNo == 3
        zadanie3();
    else
        error("TaskNo must be one of: 1, 2, 3");
    end
end

function [] = zadanie1()
    % Absolute maximum:
    % * 0.01327215
    % * 0.049965
    % * 0.049965
    % * 2.225

    conststepwrapper(1, "a", 0.0075, 0.01327, ["northwest", "northeast"]);
    conststepwrapper(1, "b", 0.0175, 0.04996, ["northeast", "northeast"]);
    conststepwrapper(1, "c", 0.0175, 0.04996, ["northeast", "northeast"]);
    conststepwrapper(1, "d", 0.1, 0.5, ["northeast", "southeast"]);
end

function [] = zadanie2()
    % Absolute maximum:
    % * 0.006790043245
    % * 0.0255
    % * 0.0255
    % * 2.488445; watch out: 0.19647 - 0.74075

    conststepwrapper(2, "a", 0.001, 0.004, ["northwest", "northeast"]);
    conststepwrapper(2, "b", 0.001, 0.01, ["northeast", "northeast"]);
    conststepwrapper(2, "c", 0.001, 0.01, ["northeast", "northeast"]);
    conststepwrapper(2, "d", 0.001, 0.05, ["northeast", "southeast"]);
end

function [] = zadanie3()
    % OK parameters:
    % * 0.01, 10e-15, 10e-5, 10e-5
    % * 0.1, 10e-15, 10e-10, 10e-7
    % * 0.1, 10e-15, 10e-7, 10e-6
    % * 0.1, 10e-15, 10e-8, 10e-7

    varstepwrapper("a", 0.01, 10e-15, 10e-5, 10e-5, ["northwest", "southeast"]);
    varstepwrapper("b", 0.1, 10e-15, 10e-10, 10e-7, ["northeast", "southeast"]);
    varstepwrapper("c", 0.1, 10e-15, 10e-7, 10e-6, ["northeast", "southeast"]);
    varstepwrapper("d", 0.1, 10e-15, 10e-8, 10e-7, ["northeast", "southeast"]);
end

function [] = conststepwrapper(taskNo, example, optimalStep, tooBigStep, legendLocation)
    assert(length(legendLocation) == 2, ...
        "LegendLocation must contain two strings: one for graph and one for error comparison");
    if taskNo == 1
        method = @RK4conststep;
        methodName = 'RK4';
    elseif taskNo == 2
        method = @APC4conststep;
        methodName = 'APC4';
    else
        error("TaskNo must be one of: 1, 2");
    end
    tic;
    [tChosen, yChosen, errChosen] = method(@equationsystem, getrange(), getinitialposition(example), optimalStep);
    timeChosen = toc;
    [~, yBigger, ~] = method(@equationsystem, getrange(), getinitialposition(example), tooBigStep);
    [~, yOde] = ode45(@(t, x) equationsystem(x), getrange(), getinitialposition(example));
    % comparison of step size
    figure("Name", ['Graph comparison for ', num2str(taskNo), char(example)]);
    colororder(["#000000", "#e6194b", "#3cb44b"]);
    plot(yChosen(:, 1), yChosen(:, 2), "LineWidth", 1);
    hold on;
    plot(yBigger(:, 1), yBigger(:, 2));
    plot(yOde(:, 1), yOde(:, 2));
    hold off;
    legend([methodName, ', step: ', num2str(optimalStep)], ...
        [methodName, ', step: ', num2str(tooBigStep), ' (too big)'], ...
        "ODE45", "Location", legendLocation(1));
    xlabel("x1");
    ylabel("x2");
    % errors in time
    figure("Name", ['Approximation errors for ', num2str(taskNo), char(example)], "DefaultLineLineWidth", 1);
    colororder("default");
    semilogy(tChosen, errChosen);
    legend("x1", "x2", "Location", legendLocation(2));
    % summary
    ['Summary for ', num2str(taskNo), char(example)]
    iterationCount = length(tChosen)
    calculationTime = timeChosen
    averageError = mean(cellfun(@norm, num2cell(errChosen, 2)))
    maximalError = max(cellfun(@norm, num2cell(errChosen, 2)))
end

function [] = varstepwrapper(example, initStepSize, minStepSize, absTolerance, relTolerance, legendLocation)
    tic;
    [tChosen, yChosen, errChosen] = RK4varstep(@equationsystem, getrange(), ...
        getinitialposition(example), initStepSize, minStepSize, absTolerance, relTolerance);
    timeChosen = toc;
    [~, yOde] = ode45(@(t, x) equationsystem(x), getrange(), getinitialposition(example));
    % comparison of step size
    figure("Name", ['Graph comparison for 3', char(example)]);
    colororder(["#000000", "#e6194b"]);
    plot(yChosen(:, 1), yChosen(:, 2), "LineWidth", 1);
    hold on;
    plot(yOde(:, 1), yOde(:, 2));
    hold off;
    legend("RK4, dynamic step", "ODE45", "Location", legendLocation(1));
    xlabel("x1");
    ylabel("x2");
    % errors in time
    figure("Name", ['Approximation errors for 3', char(example)], "DefaultLineLineWidth", 1);
    colororder("default");
    semilogy(tChosen, errChosen);
    legend("x1", "x2", "Location", legendLocation(2));
    % summary
    ['Summary for 3', char(example)]
    iterationCount = length(tChosen)
    calculationTime = timeChosen
    averageError = mean(cellfun(@norm, num2cell(errChosen, 2)))
    maximalError = max(cellfun(@norm, num2cell(errChosen, 2)))
end
