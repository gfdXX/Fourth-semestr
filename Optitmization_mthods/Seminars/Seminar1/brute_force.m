function [x_min, f_min, k] = brute_force(f, a, b, eps, kmax)
x = a;
delta = (b-a)/kmax;
min_x = a;
min_y = f(min_x);

for i = 0:kmax
    if f(x) < min_y
        min_x = x;
        min_y = f(x);
    end
    x = x + delta;
end
x_min = min_x;
f_min = min_y;
k = kmax;
end