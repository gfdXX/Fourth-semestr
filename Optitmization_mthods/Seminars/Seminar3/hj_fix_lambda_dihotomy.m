function [X, Y, K] = hj_fix_lambda_dihotomy(f, x_0,k_max,eps ,l_a, l_b, l_k_max, l_eps, lambda, gamma)
    n = 2;
    ee = eye(n);
    x0 = x_0;
    x1 = [10,10];
    x2 = [10,10];
    fi = 0;
    x_k = x0;

    i = 0;
    while (norm(x1 - x_0) > eps) && (i<k_max)
        i = i + 1;
        x1 = x0;
        x2 = x0;
        fi = f(x0);
        xi = x0;
        for j=1:n
            e = ee(j);
            x1 = x0 - lambda * e;
            x2 = x0 + lambda * e;
            fi = min(min(f(x1), f(x2)), fi);
            xi = min(min(x1, x2), xi0);
        end
        X = xi;
        Y = fi;
        K = i;  
  
    
        if(fi >= fi0)
            lambda = lambda / gamma;
        else
            x0 = xi;
        end

        if (lambda < eps)
            return
        end
        

        x0 = xi;
        fi0 = fi;
        xi0 = xi;

    end 
    

end
