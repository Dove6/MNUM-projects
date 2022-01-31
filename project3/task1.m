function [] = task1()
    range = [-5, 10];
    xSpace = linspace(range(1), range(2), 101)';
    % function
    plot(xSpace, arrayfun(@exponentialf, xSpace));
    grid on;
    grid minor;
end
