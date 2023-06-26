x_0 = [1; 1];
a = -2.0;
b = 2.0;
eps = 1e-4;
syms x1 x2
nf = sym('nf');
nf(x1, x2) = (x1 + 1)^2 + (x2 + 1)^2 + 2;
[x, k] = BFGS(nf, x1, x2, x_0, a, b, eps, k_max);
disp(x)
disp(k)