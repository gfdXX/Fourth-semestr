% 1 ЗАДАНИЕ
w = 25;
dt = 0.01;
t = 0:dt:2;

xt = cos(2*pi*w*t)+5;

% [Xk, f] = lab_spectra(xt, length(xt), 1/dt, "all");
% figure(1)
% plot(f,Xk)

[X_k1, f1] = lab_spectra(xt, length(xt), 1/dt, "all");
[X_k2, f2] = lab_spectra(xt, length(xt), 1/dt, "nowindow");
[X_k3, f3] = lab_spectra(xt, length(xt), 1/dt, "nomean");
[X_k4, f4] = lab_spectra(xt, length(xt), 1/dt, "none");
figure(1)
plot(f1, X_k1, f2, X_k2, f3, X_k3, f4, X_k4)
title('Задание №1')
legend('all', 'nowindow', 'nomean', 'none')

% 2 ЗАДАНИЕ
N = [51,201,601];
tmax = 2;
t = 0:tmax/(N(1)-1):tmax;
xt = cos(2*pi*w*t)+5;
[Xk1, f1] = lab_spectra(xt, N(1), 1/(tmax/(N(1)-1)), "all");


t = 0:tmax/(N(2)-1):tmax;
xt = cos(2*pi*w*t)+5;
[Xk2, f2] = lab_spectra(xt, N(2), 1/(tmax/(N(2)-1)), "all");


t = 0:tmax/(N(3)-1):tmax;
xt = cos(2*pi*w*t)+5;
[Xk3, f3] = lab_spectra(xt, N(3), 1/(tmax/(N(3)-1)), "all");

format = "частоты:  %f,  %f,  %f";
str = sprintf(format, N(1), N(2), N(3));
figure(2)
plot(f1, Xk1, f2, Xk2, f3, Xk3);
title('Задание №2')
legend('N = 51', 'N=201', 'N=601')
title(str);

xlabel("Frequency (Hz)");
ylabel("Amplitude");

% 3 ЗАДАНИЕ 
% чем больше tmax, тем лучше точность
tmax = [2, 10, 18];
dt = 0.01;
t = 0:dt:tmax(1);
xt = cos(2*pi*w*t)+5;

[Xk31, f31] = lab_spectra(xt, length(xt), 1/dt, "all");

t = 0:dt:tmax(2);
xt = cos(2*pi*w*t)+5;

[Xk32, f32] = lab_spectra(xt, length(xt), 1/dt, "all");

t = 0:dt:tmax(3);
xt = cos(2*pi*w*t)+5;


[Xk33, f33] = lab_spectra(xt, length(xt), 1/dt, "all");

figure(3)
plot(f31, Xk31, f32, Xk32, f33, Xk33);
title('Задание №3')
legend('2', '10', '18');

xlabel("Frequency (Hz)");
ylabel("Amplitude");

% 4 ЗАДАНИЕ
w = 25;
dt = 0.01;
t = 0:dt:2;

xt = cos(2*pi*w*t)+5;

[Xk, f] = lab_spectra(xt, length(xt), 1/dt, "nomean");
[Xk1, f1] = lab_spectra(xt, length(xt), 1/dt, "all");
figure(4), plot(f,Xk, f1, Xk1)

xlim([0,4])

title('Задание №4')

legend('nomean', 'all');

xlabel("Frequency (Hz)");
ylabel("Amplitude");

% 5 ЗАДАНИЕ
w = 25;
dt = 0.01;
t = 0:dt:2;

xt = cos(2*pi*w*t)+5;

[Xk, f] = lab_spectra(xt, length(xt), 1/dt, "nowindow");
[Xk1, f1] = lab_spectra(xt, length(xt), 1/dt, "all");
figure(5), plot(f,Xk, f1, Xk1)

title('Задание №5')

legend('nowindow', 'all');

xlabel("Frequency (Hz)");
ylabel("Amplitude");

% 6 ЗАДАНИЕ
w1 = 25;
dt = 0.01;
t = 0:dt:2;

[Xk1, f1] = lab_spectra(xt, length(xt), 1/dt, "all");

w = [10, 50, 100, 125, 200];
for i = 1:5
    xt = cos(2*pi*t*w1) + cos(2*pi*t*w(1,i)) + 5;
    [Xk, f] = lab_spectra(xt, length(xt), 1/dt, "none");
    figure(i+5), plot(f,Xk, f1, Xk1)

    title('Задание №6')

    legend('меняющийся', 'исходный');

    xlabel("Frequency (Hz)");
    ylabel("Amplitude");
end