% 1 ЗАДАНИЕ
w = 25;
dt = 0.01;
t = 0:dt:2;

xt = cos(2*pi*w*t)+5;

[Xk, f] = lab_spectra(xt, length(xt), 1/dt, "all");
figure(1)
plot(f,Xk)

% 2 ЗАДАНИЕ
N = [51,201,601];
tmax = 2;
t = 0:tmax/N(1):tmax-tmax/N(1);
xt = cos(2*pi*w*t)+5;
[Xk1, f1] = lab_spectra(xt, N(1), 1/(tmax/(N(1)-1)), "all");


t = 0:tmax/N(2):tmax-tmax/N(2);
xt = cos(2*pi*w*t)+5;
[Xk2, f2] = lab_spectra(xt, N(2), 1/(tmax/(N(2)-1)), "all");


t = 0:tmax/N(3):tmax-tmax/N(3);
xt = cos(2*pi*w*t)+5;
[Xk3, f3] = lab_spectra(xt, N(3), 1/(tmax/(N(3)-1)), "all");

format = "частоты:  %f,  %f,  %f";
str = sprintf(format, N(1), N(2), N(3));
figure(2)
plot(f1, Xk1, f2, Xk2, f3, Xk3);
legend('N = 51', 'N=201', 'N=601')
title(str);

% 3 ЗАДАНИЕ РАДИ РОМЫ ПИШУ КАПСОМ
% P.S. чем больше tmax, тем лучше точность
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
legend('2', '10', '18');

% 4 ЗАДАНИЕ
w = 25;
dt = 0.01;
t = 0:dt:2;

xt = cos(2*pi*w*t)+5;

[Xk, f] = lab_spectra(xt, length(xt), 1/dt, "nomean");
[Xk1, f1] = lab_spectra(xt, length(xt), 1/dt, "all");
figure(4), plot(f,Xk, f1, Xk1)
xlim([0,4])

% 5 ЗАДАНИЕ
w = 25;
dt = 0.01;
t = 0:dt:2;

xt = cos(2*pi*w*t)+5;

[Xk, f] = lab_spectra(xt, length(xt), 1/dt, "nowindow");
[Xk1, f1] = lab_spectra(xt, length(xt), 1/dt, "all");
figure(5), plot(f,Xk, f1, Xk1)

% 6 ЗАДАНИЕ
w1 = 25;
dt = 0.01;
t = 0:dt:2;
xt = cos(2*pi*w1*t)+5;
[Xk1, f1] = lab_spectra(xt, length(xt), 1/dt, "all");

w = [10, 50, 100, 125, 200];
for i = 1:5
    dt = 1/(w(1,i)+1);
    t = 0:dt:2;
    xt = cos(2*pi*w(1,i)*t)+5;
    [Xk, f] = lab_spectra(xt, length(xt), 1/dt, "all");
    figure(i+5), plot(f,Xk, f1, Xk1)
end