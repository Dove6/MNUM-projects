function [] = writecond(power_range)
    for i = 1:length(power_range)
        n = 2 ^ power_range(i) * 10;
        [A, ~] = getdata1(n);
        writematrix([n cond(A)], 'cond_A1.xlsx', 'Range', strcat('A', num2str(i), ':B', num2str(i)));
        [A, ~] = getdata2(n);
        writematrix([n cond(A)], 'cond_A2.xlsx', 'Range', strcat('A', num2str(i), ':B', num2str(i)));
    end
end
