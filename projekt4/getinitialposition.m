function [initialPos] = getinitialposition(example)
    if example == "a"
        initialPos = [10; 9];
    elseif example == "b"
        initialPos = [0; 7];
    elseif example == "c"
        initialPos = [7; 0];
    elseif example == "d"
        initialPos = [0.001; 0.001];
    else
        error("Example must be one of: a, b, c, d");
    end
end
