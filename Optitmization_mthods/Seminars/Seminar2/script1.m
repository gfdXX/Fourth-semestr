clc
a = -5;
b  = 5;
eps = 10^(-3);
kmax = 10^6;
[x_min_dich, f_min_dich,  kmax_dich] = scalar_methods(@f, a, b, eps, kmax, "dychotomy");
[x_min_gs, f_min_gs,  kmax_gs] = scalar_methods(@f, a, b, eps, kmax, "golden section");
[x_min_bf, f_min_bf,  kmax_bf] = scalar_methods(@f, a, b, eps, kmax, "brute force");

disp([x_min_dich, f_min_dich,  kmax_dich])
disp([x_min_gs, f_min_gs,  kmax_gs])
disp([x_min_bf, f_min_bf,  kmax_bf])
function y = f(x)
    y = 2*x.^2-12*x;
end
