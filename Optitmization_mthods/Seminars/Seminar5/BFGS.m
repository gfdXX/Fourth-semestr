function [x, k] = BFGS(nf, x1, x2, x_0, a, b, eps, k_max)
    x = x_0;
    [g1] = gradient(nf, [x1, x2]);
    grad = double(subs(g1, {x1, x2}, {x_0(1), x_0(2)}));
    k = 0;
    A = eye(2);
    while norm(grad) > eps
        [alpha, ~, ~] = dichotomy(@f_lmbd, a, b, eps, k_max);
        dx = alpha*A*grad;
        x = x_0 - dx;
        grad_0 = grad;
        grad = double(subs(g1, {x1, x2}, {x(1), x(2)}));
        dg = grad - grad_0;
        if norm(grad) > eps
            dA = (1 + (dg'*A*dg)/(dx'*dg)) * (dx*dx')/(dx'*dg) - (dx*dg'*A)/(dx'*dg) - (A*dg*dx')/(dx'*dg);
            A = A + dA;
            [alpha, ~, ~] = dichotomy(@f_lmbd, a, b, eps, k_max);
            dx = alpha*A*grad;
            x = x_0 - dx;
        end
        x_0 = x;
        k = k + 1;
    end
    
    function val = f_lmbd(lmbd)
         x = x_0 - lmbd*A*grad;
         val = (x(1) + 1)^2 + (x(1) + 1)^2 + 2;
    end
 
end