function [] = projekt2(min_degree, max_degree)
    timeStr = char(datetime('now', 'Format', 'yyyyMMdd-HHmmss'));

    [x, y] = getdata();
    solvers = {@solvellsnormal, @solvellsqr};
    degrees = min_degree:max_degree;
    xForApprox = linspace(-5, 5, 110)';
    for i = 1:length(solvers)
        figure("Name", functions(solvers{i}).function, "DefaultLineLineWidth", 2);
        colororder(["#000000", "#e6194b", "#3cb44b", "#ffe119", "#0082c8", "#f58231", "#911eb4", "#46f0f0", "#f032e6", "#d2f53c", ...
            "#fabebe", "#008080", "#e6beff", "#aa6e28", "#fffac8", "#800000", "#aaffc3", "#808000", "#ffd8b1", "#000080", "#808080"]);
        plot(x, y, "Marker", "o", "LineStyle", "none", "MarkerSize", 10);
        hold on;
        for j = 1:length(degrees)
            A = x .^ (0:degrees(j));
            [a, approxErr, solverErr, solverCond] = approximatepolynomial(A, y, solvers{i});

            biggerA = xForApprox .^ (0:degrees(j));
            yApprox = biggerA * a;
            plot(xForApprox, yApprox, "LineStyle", "-");

            row = (i - 1) * length(degrees) + j + 1;
            %writedata(solvers{i}, degrees(j), timeStr, row, a, approxErr, solverErr, solverCond);
        end

        textDegrees = cellfun(@(x) ['Stopień ', num2str(x)], num2cell(degrees), "UniformOutput", false);
        textDegrees = cat(1, {'Próbki'}, textDegrees{:});
        legend(textDegrees);
        hold off;
    end
end
