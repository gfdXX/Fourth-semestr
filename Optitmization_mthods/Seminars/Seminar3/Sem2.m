clear all
eps = [1e-3, 1e-3];
x_0 = [1.0, 1.0];
l_a = -2.0;
l_b = 0.0;
l_k_max = 100;
l_eps = 1e-3;

[X, Y, K] = Coordinate_descent(@f, x_0, l_a, l_b, l_k_max, l_eps, eps);

function val = f(x)
    val = (x(1) + 1) ^ 2 + (x(2) + 1) ^ 2 + 2;
end

