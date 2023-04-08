f = readtable('data.txt');
data = table2array(f);

[N, ~] = size(data);
t = zeros(1, N);
X = zeros(1, N);

for i = 1:N
    t(i) = data(i, 1);
    X(i) = data(i, 2);
end

F1 = abs(fft(X,N)/ N);
F2 = F1(1:N/2+1);
F2(2:end-1) = 2 *F2(2:end-1);
fd = 1 / (t(2) - t(1));
f = fd * (0:(N/2)) / N;
f = f';

figure, plot(t, X)
figure, plot(f, F2)

Uin = abs(X);
Uout = zeros(size(Uin));

flower = 10^4;
fupper = 5 * 10^5;

dt = t(2) - t(1);

wsr = 2*pi*2*10^4;
tau = 1/wsr;

for i = 2:length(Uin)
    Uout(i) = Uout(i-1) + (Uin(i) - Uout(i-1)) / tau * dt;
end

figure, plot(t, Uout)

F3 = abs(fft(Uout,N)/ N);
F4 = F3(1:N/2+1);
F4(2:end-1) = 2 *F4(2:end-1);
fd2 = 1 / (t(2) - t(1));
f2 = fd2 * (0:(N/2)) / N;
f2 = f2';

figure, plot(f2(2:end), F4(2:end))





