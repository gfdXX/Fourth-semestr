function [x, f, steps] = Hooka_jeeves_lmbd(f, x_0, lmbd, eps, gamma)

f_curr = f(x_0);

x_best = x_0;
f_best = f_curr;
x_testM = x_0;
x_testP = x_0;

steps = 0;
e = eye(length(x_0));

while lmbd > eps
    
    for i = 1:length(x_0)
        x_testM(i) = x_0(i) - lmbd * e(i,i);
        x_testP(i) = x_0(i) + lmbd * e(i,i);

        f_testM = f(x_testM);
        f_testP = f(x_testP);
        
        if f_testM < f_best
            x_best = x_testM;
            f_best = f_testM;
        end
        if f_testP < f_best
            x_best = x_testP;
            f_best = f_testP;
        end 
    end
    
    if f_best < f_curr
        x_0 = x_best;
        f_curr = f_best;
    else
        lmbd = lmbd / gamma;
    end

    steps = steps+1;
end

x = x_0;
f = f_curr;

end
