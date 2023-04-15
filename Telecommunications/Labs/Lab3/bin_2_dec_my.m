function [y] = bin_2_dec_my(x)
    y = 0;
    for i = length(x):-1:1
        y = y + x(i)*2^(length(x)-i);
    end
end