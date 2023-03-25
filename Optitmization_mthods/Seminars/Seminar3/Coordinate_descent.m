function [X, Y, K] = Coordinate_descent(f, x_0, l_a, l_b, l_k_max, l_eps, eps)

    n = 2;
    ee = eye(n);
    x0 = x_0;
    x1 = [10,10];
    x_k = x0;
    i = 1;
    
    while (abs(x1 - x_k) > eps) & (i<l_k_max)
%         x1;
%         x0;
        i = i + 1;
        x1 = x0;
        for j=1:n
            x_k = x1;
            e = ee(j);
            [l, ~, ~] = dichotomy(@f_lmbd, l_a, l_b, l_eps, l_k_max);
            x1 = x1 + l * e;
        end
    end 
    X = x1;
    Y = f(X);
    K = i;
    
    function val = f_lmbd(lmbd)
        val = f(x_k + lmbd * e);
    end

end



