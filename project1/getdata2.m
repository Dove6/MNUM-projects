function [matrix, vector] = getdata2(size)
    matrix = 5 ./ (6 .* ((1:size) + (1:size)' - 1));

    vector = zeros(size, 1);
    vector(1:2:size) = 1 ./ (1.5 .* (1:2:size));
end
