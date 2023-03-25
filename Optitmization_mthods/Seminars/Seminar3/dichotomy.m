function [x_min, f_min, k] = dichotomy(f, a, b, eps, kmax)
    k = 0;
    delta = 0.5*eps;
    while ((b-a >= eps)&&(kmax>k))
        c = (a+b-delta)/2;
        d = (a+b+delta)/2;
        if (f(c) >= f(d))
            a = c;
        else
            b = d;
        end
        k=k + 1;


    end
    x_min = (a+b)/2;
    f_min = f(x_min);

    
end