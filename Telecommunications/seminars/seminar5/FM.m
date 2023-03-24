
fm = 900; % частота модулирующего сигнала
fc = 10000; % частота несущего сигнала
amplitude = 1; % амплитуда несущего сигнала
kf = 1; % коэффициент частотной модуляции

t = linspace(0, 0.0005, 2000000);


A = 1;
m = 0.8;
om0 = 2*pi*100000;
deltaw = m*om0;
w = 2*pi*10000;

modulating_signal = A*sin(om0 * t - deltaw *(cos(w*t)-cos(w*0))/w);

figure
subplot(3,1,1)
plot(t, modulating_signal)


subplot(3,1,2)
plot(t, sin(w*t))
M = fft(modulating_signal);
subplot(3,1,3)
plot(abs(M))

