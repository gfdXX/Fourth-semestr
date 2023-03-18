T = 0:0.001:1;
N = length(T);
U_input = 1;
U_output = zeros(N);
RC = 0.01;
for i = 2:N
    U_output(i) = U_output(i - 1) + 0.001 * ((U_input - U_output(i - 1))/ RC);
end
plot(T, U_output);