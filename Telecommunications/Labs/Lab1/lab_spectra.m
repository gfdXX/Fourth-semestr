function [Xk, f] = lab_spectra(xn, N, fd, s)
if size(xn,2) ~= 1
    xn = xn';
end

switch s
    case "all"
       xn = xn - mean(xn);
       xn = xn .* tukeywin(N,0.05);
    case "nowindow"
       xn = xn - mean(xn);
    case "nomean"
       xn = xn .* tukeywin(N,0.05);
    case "none"
end

Xk = abs(fft(xn)/N);
Xk = Xk(1:(N/2) + 1);
Xk(2:(N)/2) = Xk(2:(N)/2) * 2;

f = fd * (0:1:(N)/2)/ N;

end