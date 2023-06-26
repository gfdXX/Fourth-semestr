t = 0:0.1:1;
w = 10;
n = length(t);
U1 = zeros(n, 1);
U2 = zeros(n, 1);
s = zeros(n, 1);
U1(:, 1) = 2*t; %sin(2*pi*w*t);
T = 1;
tau = 3;

for i=2:n
    s = (2/T)*((1 - U2(i-1, 1))/(1 + U2(i-1, 1)));
    U2(i, 1) = U1(i, 1)/(tau*s+1);
end

figure 
plot(t, U1)

figure 
stairs(t, U2)
