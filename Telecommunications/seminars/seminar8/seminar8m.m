dt = 0.0001;
t_in = 0:dt:0.1;
tau = 3;
Td = 1;

U_in = zeros(length(t_in),1);
U_in(1:end) = 5;
U_out_analog = zeros(length(t_in),1);
U_out_digital = zeros(length(t_in),1);

for i = 2:length(U_in)
    U_out_analog(i) = U_out_analog(i-1) + (U_in(i) - U_out_analog(i-1))/tau * dt;
end
figure,plot(t_in, U_out_analog)

for i = 2:length(U_in)
    U_out_digital(i) = (Td * (U_in(i) + U_in(i-1)) - U_out_digital(i-1) * (Td - 2*tau)) / (2*tau + Td);
end
figure,stairs(U_out_digital)





