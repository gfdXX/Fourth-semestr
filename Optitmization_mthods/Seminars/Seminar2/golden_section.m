function [x_min, f_min, k] = golden_section(f, a, b, eps, kmax)
k = 0;

x1 = b - (5^(0.5)-1)/2 * (b-a);
x2 = a + (5^(0.5)-1)/2 * (b-a);

while (k <=kmax) && (abs(b-a) > eps)
    k = k + 1;
    if f(x1) <= f(x2)
        b = x2;
        x2= x1;
        x1 = a+b-x2;
    else
        a=x1;
        x1=x2;
        x2=a+b-x2;
    end
end
x_min = (a+b)/2;
f_min=f(x_min);
end