close all
clear all

x_0 = [3.0, -2.0];
k_max = 1e5;
eps = 1e-3;
gamma = 1.5;

lmbd = 4;

[x_min, f_min, iter] = Hooka_jeeves_lmbd(@f, x_0, lmbd, eps, gamma);
x_min
f_min
iter

function val = f(x)
    val = (x(1)+1)^2 + (x(2)+1)^2 + 2;
end
