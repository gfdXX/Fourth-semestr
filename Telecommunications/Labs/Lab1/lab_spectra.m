function [Xk, f] = lab_spectra(xn, N, fd, s)
if size(xn,2) ~= 1
    xn = xn';
end

switch s
    case "all"
       xn = xn - 5;
       xn = xn .* tukeywin(N,0.05);
    case "nowindow"
       xn = xn - 5;
    case "nomean"
       xn = xn .* tukeywin(N,0.05);
    case "none"
end

Xk = abs(fft(xn)/N);
range = 0:1:N-1;
f = fd * range / N;
 
end