function [] = writefinitesolve(power_range, data_func, solver_func)
    outfile_suffix = strcat( ...
        '_' , functions(solver_func).function, ...
        '_' , functions(data_func).function, ...
        '_' , char(datetime('now', 'Format', 'yyyyMMdd-HHmmss')), ...
        '.xlsx');

    for i = 1:length(power_range)
        n = 2 ^ power_range(i) * 10
        
        [A, b] = data_func(n);
        tic;
        x = solver_func(A, b);
        t = toc
        r = residuum(A, b, x);
        rnorm = norm(r)

        writecell(prepare_nums(x), strcat('x', outfile_suffix), 'Sheet', strcat('n=', num2str(n)));
        writecell(prepare_nums(r), strcat('r', outfile_suffix), 'Sheet', strcat('n=', num2str(n)));
        writecell(prepare_nums([n t]), strcat('t', outfile_suffix), 'Range', strcat('A', num2str(i), ':B', num2str(i)));
        writecell(prepare_nums([n rnorm]), strcat('rnorm', outfile_suffix), 'Range', strcat('A', num2str(i), ':B', num2str(i)));
    end
end

function out = prepare_nums(mat)
    out = cellfun(@num2str, num2cell(mat), 'UniformOutput', false);
end
