function [x_min,f_min,k] = Newtow_method(f,gradient_,hesse,x0,eps,kmax)
    [grad,grad_abs] = gradient_(x0);
    k = 0;
    x_k = zeros(1,length(x0));

    while ((grad_abs >= eps(1)) && (k<kmax))
        k = k + 1;
        x_k = x0 - inv(hesse(x0)) * grad;
        x0 = x_k;

        [grad,grad_abs] = gradient_(x0);

    end

    x_min = x_k;
    f_min = f(x_k);
    
end

