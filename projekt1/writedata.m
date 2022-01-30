function [] = writedata(power_range)
    for i = power_range
        n = 2 ^ i * 10;
        [A, b] = getdata1(n);
        writematrix(A, 'A1.xlsx', 'Sheet', strcat('n=', num2str(n)));
        writematrix(b, 'b1.xlsx', 'Sheet', strcat('n=', num2str(n)));
        [A, b] = getdata2(n);
        writematrix(A, 'A2.xlsx', 'Sheet', strcat('n=', num2str(n)));
        writematrix(b, 'b2.xlsx', 'Sheet', strcat('n=', num2str(n)));
    end
end
