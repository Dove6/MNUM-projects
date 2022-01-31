function [result] = equationsystem(x)
    assert(length(x) == 2, "x must be of length 2");
    result = [
        x(2) + x(1) * (0.9 - x(1)^2 - x(2)^2);  % x1'
        -x(1) + x(2) * (0.9 - x(1)^2 - x(2)^2)  % x2'
    ];
end
