clc
eps = 1e-3;
k_max = 1e5;
lmbd = 2;
gamma = 2;

x_0 = [1.0, 1.0];


[X, F, k] = Hooke_Jeeves_fics(@f, eps, x_0, lmbd, gamma)


function val = f(x)
    val = (x(1) + 1)^2 + (x(2) + 1)^2 + 2;
end 
