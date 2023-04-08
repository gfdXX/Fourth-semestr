function [X, Y, K] = hj_lambda_dihotomy(f, x_0,k_max,eps ,l_a, l_b, l_k_max, l_eps)
    n = 2;
    ee = eye(n);
    x0 = x_0;
    x1 = [10,10];
    x_k = x0;
    i = 0;
    while (norm(x1 - x_0) > eps) && (i<k_max)
        i = i + 1;
        x1 = x0;
        for j=1:n
            x_k = x1;
            e = ee(j);
            [l, ~, ~] = dychotomy(@f_lmbd, l_a, l_b, l_eps, l_k_max);
            x1 = x1 + l * e;
        end
        X = x1;
        Y = f(X);
        K = i;    
    
        if(abs(x0-x1)>eps)
            x_k = x1;
            e = x1-x0;
            [l, ~, ~] = dychotomy(@f_lmbd, l_a, l_b, l_eps, l_k_max);
            x1 = x1 + l * (x1-x0);   
        else 
            return;
        end
        x0 = x1;
    end 
    function val = f_lmbd(lmbd)
        val = f(x_k + lmbd * e);
    end
end
