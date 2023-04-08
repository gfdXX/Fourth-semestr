clc
clear all

x_0 = [1.0; 1.0];
k_max = 1e5;
eps = 1e-3;

l_a = -2;
l_b = 0;
l_k_max = 100;
l_eps = 1e-4;

[X_hj_dich, F_hj_dich, K_hj_dich] = hj_fix_lambda_dihotomy(@f, x_0, k_max, eps, l_a, l_b, l_k_max, l_eps,2,2);
X_hj_dich
F_hj_dich
K_hj_dich

function val = f(x)
    val = (x(1) + 1)^2 + (x(2) + 1)^2 + 2;
end