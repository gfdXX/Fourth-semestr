fn = 900;
fv = 10000;
dt = 0.00001;
t = 0:dt:0.5;

s_inf = sin(2 * pi * fn * t);
s_nes = sin(2 * pi * fv * t);


m = [0.5, 1, 1.5];
for i = 1:length(m)
    A1 = 1 + m(i) * s_inf;
    s1 = A1.*sin(2 * pi * fv * t);
    figure, plot(t, s1)
    N = length(s1);
    S1 = abs(fft(s1,N)/N);
    S1_ = S1(1:N/2+1);
    S1_(2:end-1) = 2 * S1_(2:end-1);
    f = 1/dt * (0:(N/2)) / N;
    f = f';
    figure, plot(f, S1_)
end



