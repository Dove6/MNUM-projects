function [] = writesr(power_range)
    for i = 1:length(power_range)
        n = 2 ^ power_range(i) * 10;
        [A, ~] = getdata1(n);
        D = diag(diag(A));
        LU = A - D;
        writematrix([n abs(eigs(inv(D) * LU, 1))], 'sr_A1.xlsx', 'Range', strcat('A', num2str(i), ':B', num2str(i)));
        [A, ~] = getdata2(n);
        D = diag(diag(A));
        LU = A - D;
        writematrix([n abs(eigs(inv(D) * LU, 1))], 'sr_A2.xlsx', 'Range', strcat('A', num2str(i), ':B', num2str(i)));
    end
end
