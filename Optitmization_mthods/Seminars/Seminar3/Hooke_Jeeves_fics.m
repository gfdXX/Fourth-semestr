function [X, F, k] = Hooke_Jeeves_fics(f, eps, x_0, lmbd, gamma)
    f_0 = f(x_0);
    n = length(x_0);
    k = 0;

    x_k_up = zeros(2, 2);
    x_k_down = zeros(2, 2);
    x_k = zeros(4, 2);

    while (lmbd >= eps)
        
        for i=1:n
            e = [mod(i, 2), mod(i + 1, 2)];
            x_k_up(i, :) = x_0 + lmbd*e;
            x_k_down(i, :) = x_0 - lmbd*e;
        end
        x_k(1:2, :) = x_k_up;
        x_k(3:4, :) = x_k_down;

        [f_min, ind] = min([f(x_k(1, :)), f(x_k(2, :)), f(x_k(3, :)), f(x_k(4, :))]);
        x_min = x_k(ind, :);

        if f_min >= f_0
            lmbd = lmbd/gamma;
        else
            x_0 = x_min;
            f_0 = f_min;
        end 
        k = k + 1;
    end
    X = x_min;
    F = f(x_min);
end