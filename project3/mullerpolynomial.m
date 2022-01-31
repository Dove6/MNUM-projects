function root = mullerpolynomial(coeffs, startPoint, valueTolerance)
    % coeffs should be ordered from greatest to smallest index
    % e.g. [a4, a3, a2, a1, a0]
    assert(valueTolerance > 0);

    root = startPoint;
    while abs(polynomialf(root, coeffs)) > valueTolerance
        funcValue = polynomialf(root, coeffs);
        deriv1Value = polynomiald1(root, coeffs);
        deriv2Value = polynomiald2(root, coeffs);
        % divisor for z+
        pDivisor = deriv1Value + sqrt(deriv1Value^2 - 2*funcValue*deriv2Value);
        % divisor for z-
        nDivisor = deriv1Value - sqrt(deriv1Value^2 - 2*funcValue*deriv2Value);
        if abs(pDivisor) >= abs(nDivisor)
            zMin = -2*funcValue / pDivisor;
        else
            zMin = -2*funcValue / nDivisor;
        end
        root = root + zMin;
    end
end
