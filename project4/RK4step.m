function [result] = RK4step(eqSys, x, stepSize)
    % classic Runge-Kutta method
    w = [1, 2, 2, 1];
    k = zeros(4, length(x));
    k(1, :) = eqSys(x);
    k(2, :) = eqSys(x + stepSize * k(1, :) / 2);
    k(3, :) = eqSys(x + stepSize * k(2, :) / 2);
    k(4, :) = eqSys(x + stepSize * k(3, :));
    result = x + stepSize * (w * k) / 6;
end
