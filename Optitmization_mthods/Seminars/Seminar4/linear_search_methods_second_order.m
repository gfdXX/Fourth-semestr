clc 
clear variables
close all force

x0 = [1.0, 1.0]';
eps = [1e-4, 1e-4];
k_max = 1e5;

disp('Newtow_method');
[x_n_min,f_n_min,k_n] = Newtow_method(@f,@gradient_,@hesse,x0,eps,k_max)
disp('Newton-Raphson method');
[x_n_r_min, f_n_r_min, k_n_r] = Newton_Raphson_method(@f,@gradient_,@hesse,x0,eps,k_max)

function val = f(x)
    val = (x(1) + 1)^2 + (x(2) + 7)^2 + 2;
end

function [grad,abs_grad] = gradient_(x)
    grad = zeros(1,length(x))';
    grad(1) = 2*(x(1) + 1);
    grad(2) = 2*(x(2) + 7);
    
    abs_grad = sqrt(grad(1)^2 + grad(2)^2);
end

function matrix_hesse = hesse(x)
    matrix_hesse = zeros(length(x));
    
    matrix_hesse(1,1) = 2;
    matrix_hesse(1,2) = 0;
    matrix_hesse(2,1) = 0;
    matrix_hesse(2,2) = 2;
end
