function [] = projekt1()
    %dataProviders = {@getdata1, @getdata2};
    %solvers = {@gaussiansolve, @jacobisolve, @mldivide, @linsolve};
    %systemSizes = 2 .^ (0:7) .* 10;
    dataProviders = {@getdata2};
    solvers = {@jacobisolve};
    systemSizes = 2 .^ (0:2) .* 10;
    
    results = {};

    for iSolver = 1:length(solvers)
        for jData = 1:length(dataProviders)
            for kSize = 1:length(systemSizes)
                functions(solvers{iSolver}).function
                functions(dataProviders{jData}).function
                n = systemSizes(kSize)
                
                [A, b] = dataProviders{jData}(n);
                tic;
                x = solvers{iSolver}(A, b);
                elapsed = toc
                r = residuum(A, b, x);

                results{iSolver, jData, kSize} = norm(r);
            end
        end
    end

    results
    loglog(systemSizes, [results{1,1,:}])
    axis([systemSizes(1) systemSizes(end) 0 Inf])
    xticks(systemSizes)
end
