function [x] = bin_mod_my(a,b)
a1 = bin_2_dec_my(a);
b1= bin_2_dec_my(b);
ost = mod(a1, b1);
x = de2bi(ost,8,'left-msb');
end