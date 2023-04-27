function [x, f, steps] = Hooka_jeeves_lmbd(f, x_0, lmbd, eps, gamma)

f_curr = f(x_0);

x = zeros(4,1);
% f_best = f_curr;
x_testM = x_0;
x_testP = x_0;

steps = 0;
e = eye(length(x_0));

while lmbd >= eps
    
    for i = 1:length(x_0)
        x_testM = x_0 - lmbd * e(i);
        x_testP= x_0+ lmbd * e(i);
%         
%         f_testM = f(x_testM);
%         f_testP = f(x_testP);
        x(i) = x_testM(1);
        x_M(i,2) = x_testM(2);

        x_P(i,1) = x_testP(1);
        x_P(i,2) = x_testP(2);
%         if f_testM < f_best
%             x_best = x_testM;
%             f_best = f_testM;
%         end
%         if f_testP < f_best
%             x_best = x_testP;
%             f_best = f_testP;
%         end
%         if f_testP < f_testM && f_testP < f_best
%             x_best = x_testP;
%             f_best = f_testP;
%         end
%         if f_testM < f_testP && f_testM < f_best
%             x_best = x_testM;
%             f_best = f_testM; 
%         end
    end
    x_best = min(min(x_P), min(x_M));
    f_best = f(x_best);
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
