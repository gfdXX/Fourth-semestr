function [x_min_dich, f_min_dich, k_dich] = dichotomy(f, a, b, eps, kmax)

    delta = eps/2;
    a0 = a;
    b0 = b;
    k = 0;
    while abs(b0-a0) > eps
        k = k + 1;
        c = (a0+b0-delta)/2;
        d = (a0+b0+delta)/2;
        if f(c)<=f(d)
            b0 = d;
        else
            a0 = c;
        end
    end
    
    x_min_dich = (a0 + b0)/2;
    f_min_dich = f(x_min_dich);
    k_dich = k;

end

