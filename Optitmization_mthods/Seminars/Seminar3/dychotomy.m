function [x_min_dich, f_min_dich,  k] = dychotomy(f, a, b, eps, kmax)
k = 0;
delta = 0.5  * eps;
while (k <=kmax) && (abs(b-a) > eps)
    k = k + 1;
    c = (a+b-delta) / 2;
    d = (a+b+delta) / 2;
    if f(c) <= f(d)
        b = d;
    else
        a = c;
    end
    
end
x_min_dich = (a+b)/2;
f_min_dich = f(x_min_dich);
end