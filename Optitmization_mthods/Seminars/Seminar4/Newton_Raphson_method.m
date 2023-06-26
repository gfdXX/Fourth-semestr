function [x_min,f_min,k] = Newton_Raphson_method(f,gradient_,hesse,x0,eps,kmax)
    [grad,grad_abs] = gradient_(x0);
    i = 0;
    x_i = zeros(1,length(x0));

    while grad_abs >= eps(1)
        i = i + 1;
        [alpha_i, ~, ~] = dichotomy(@fun, 0, 5, 1e-3,kmax);
        x_i = x0 - alpha_i*(inv(hesse(x0)) * grad);
        x0 = x_i;

        [grad,grad_abs] = gradient_(x0);

    end

    x_min = x_i;
    f_min = f(x_i);
    k = i;
    
    function alpha_i = fun(alpha)
        alpha_i=f(x0-alpha*(inv(hesse(x0)) * grad));
    end
end

