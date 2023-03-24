function [X, Y, K] = Coordinate_descent(f, x_0, l_a, l_b, l_k_max, l_eps, eps)
    e1 = [1,0];
    e2 = [0,1];
    x0 = x_0;
    x2 = [10,10];
    i = 1;
    while (abs(x2 - x0)) > eps
        i = i + 1;
        x_k = x0;
        e = e1;
        [l1, ~, ~] = dychotomy(@f_lmbd, l_a, l_b, l_eps, l_k_max);
        x1 = x0 + l1 * e1;
        
        x_k = x1;
        e = e2;
        [l2, ~, ~] = dychotomy(@f_lmbd, l_a, l_b, l_eps, l_k_max);
        x2 = x1 + l2 * e2;       
        
        x0 = x2;
                
    end 
    X = x2;
    Y = f(X);
    K = i;
    
    function val = f_lmbd(lmbd)
        val = f(x_k + lmbd * e);
    end

end



