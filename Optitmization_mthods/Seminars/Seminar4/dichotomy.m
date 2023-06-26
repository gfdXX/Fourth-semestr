function [x_min_dich, f_min_dich,  k] = dichotomy(f, a, b, eps, kmax)
    k = 0;
    delta = 0.5  * eps;
    while ((k <kmax) && (b-a >= eps))
        c = (a+b-delta) / 2;
        d = (a+b+delta) / 2;
        if (f(c) >= f(d))
            a=c;
        else
            b=d;
        end
        k = k + 1;
    end
    x_min_dich = (a+b)/2;
    f_min_dich = f(x_min_dich);
end