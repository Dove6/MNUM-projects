function [x, total_iterations] = jacobisolve(A, b, tolerance, max_iterations)
    validateinput(A, b);
    n = size(A, 1);
    D = diag(diag(A));
    LU = A - D;
    inv_D = inv(D);
    stop_test_threshold_diff = 1e-3;
    checkconvergence(D, LU);

    x = zeros(n, 1);
    for k = 1:max_iterations
        total_iterations = k;
        prev_x = x;
        x = (-inv_D * LU * x) + (inv_D * b);
        if any(isnan(x)) || any(isinf(x))
            x = prev_x;
            break;
        end
        [should_stop, stop_test_threshold_diff] = check_stop_criteria(prev_x, x, A, b, stop_test_threshold_diff, tolerance);
        if should_stop
            break;
        end
    end
end

function [should_stop, new_threshold_diff] = check_stop_criteria(prev_x, x, A, b, threshold_diff, tolerance)
    should_stop = false;
    new_threshold_diff = threshold_diff;
    if norm(x - prev_x) < threshold_diff
        if norm(residuum(A, b, x)) < tolerance
            should_stop = true;
        elseif threshold_diff > 1e-13
            new_threshold_diff = threshold_diff / 2;
        end
    end
end

function [] = checkconvergence(D, LU)
    % sufficient condition
    row_domination = all(sum(abs(D), 2) > sum(abs(LU), 2));
    column_domination = all(sum(abs(D), 1) > sum(abs(LU), 1));
    if not (row_domination || column_domination)
        % necessary condition
        spectral_radius = abs(eigs(inv(D) * LU, 1));
        if spectral_radius >= 1
            warning(strcat( ...
                'Necessary condition for convergence is not satisfied, sr(M)=', ...
                num2str(spectral_radius)));
        else
            warning('Sufficient condition for convergence is not satisfied');
        end
    end
end
