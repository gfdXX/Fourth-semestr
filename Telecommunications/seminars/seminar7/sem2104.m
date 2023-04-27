clear all
close all
clc
tau = 0.0001;
dt = 0.0000001;
t = 0:dt:0.001;
f = 20000;
T = 1/f;
y = zeros(1,length(t));
t_start=0;
k = 0.1;
for i=1:length(t)
    t_start = t_start + dt;
    if t_start < k*T
         y(i)=5;
    end
    if t_start>T
        t_start = 0;
    end
end
% y_sin = sin(2*pi*f*t);
% y = 5*(y_sin>0);
out = zeros(1,length(t))
out(1) = y(1);
for i = 1:length(t)-1
    out(i+1) = ((y(i)-out(i))/tau)*dt + out(i); 
end
figure
plot(t,y, t,out)
