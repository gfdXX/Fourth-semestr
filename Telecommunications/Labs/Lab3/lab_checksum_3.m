clc
% m - исходное сообщение 
% mx - исходное сообщение в виде полинома 
% c - закодированное сообщение 
% e - ошибка 
% r - полученное сообщение 

% № 2.1
polynom = [1 0 0 1 1];
crc4_gen = comm.CRCGenerator('Polynomial', polynom, 'ChecksumsPerFrame',1);
crc4_det = comm.CRCDetector('Polynomial', polynom, 'ChecksumsPerFrame',1);

% № 2.2
m = 46;
mx = de2bi(m,8,'left-msb');

% № 2.3
mx = mx';
c = step(crc4_gen, mx);              % кодирование заданного сообщения
len_c = length(c);
len_mx = length(mx);
len_redundancy = len_c - len_mx;     % величина избыточности 

% № 2.4
e = 64;
e = de2bi(e, 12,'left-msb');
e = e';
r = bitxor(c, e);                     % моделирование ошибки в пятом младшем бите закодированного сообщения
[mm,err] = step(crc4_det, r);         % декодирование полученного сообщения

% № 2.5
mx_2 = num2str(mx') + " 0 0 0 0";
mx_2 = str2num(mx_2);
[~, s] = gfdeconv(wrev(mx_2), wrev(polynom));
s = wrev(s);

disp('кодовый полином')
disp(polynom)                        % кодовый полином 
disp('кодируемое сообщение')
disp(mx');                           % кодируемое сообщение 
disp('кодируемое сообщение в десятичной')
disp(m);                             % кодируемое сообщение в десятичной 
disp('остаток от деления кодируемого сообщения на кодовый полином')
disp(s);                             % остаток от деления кодируемого сообщения на кодовый полином
disp('закодированное сообщение')
disp(c');                            % закодированное сообщение 
disp('модель ошибки ')
disp(e');                            % модель ошибки 
disp('полученное приемником сообщение')
disp(r');                            % полученное приемником сообщение
disp('декодированное сообщение')
disp(mm');                           % декодированное сообщение

% № 2.6
% disp(['Синдром ошибки = ', num2str(s)])
% disp(" ")
%array = zeros(4);
r_2 = num2str(r');
r_2 = str2num(r_2);
[~, r_2] = gfdeconv(wrev(r_2), wrev(polynom));
r_2 = wrev(r_2);
disp(['Синдром ошибки = ', num2str(r_2)])
disp(" ")

% № 2.7
a = 1;
bit = zeros(12, 1);
error = zeros(12, 4);
for i=1:12
    bit(i, 1) = i;
    err = de2bi(a, 12,'left-msb');
    a = a * 2;
    [~, ss] = gfdeconv(wrev(err), wrev(polynom));
    ss = wrev(ss);
    n = length(ss);
    error(i, (5-n):4) = ss;
%     if error(i, :) == r_2
%         number = i;
%     end 
end
T = table(bit, error);
disp(T);
% disp(['Ошибка в ', num2str(number), ' бите']);
% disp("---------")

% № 3.1
mx_1 = de2bi(m, 7,'left-msb');
p = exclusive_or(mx_1);
mx_1 = append(num2str(p), " ", num2str(mx_1));
mx_1 = str2num(mx_1);

% № 3.2 
e = 16;
e = de2bi(e, 8,'left-msb');
r = bitxor(mx_1, e);
p2 = exclusive_or(r);
if p == p2
    disp('Ошибки нет')
else
    disp('Ошибка есть')
end

% № 3.3
e1 = 4;
e2 = 16;
e1 = de2bi(e1, 8,'left-msb');
e2 = de2bi(e2, 8,'left-msb');
mx_2 = bitxor(mx_1, e1);
r = bitxor(mx_2, e2);
p3 = exclusive_or(r);
if p == p3
    disp('Ошибки нет')
else
    disp('Ошибка есть')
end



function p = exclusive_or(mx)
    p = mx(1);
    for j=2:length(mx)
        p = bitxor(p, mx(j));
    end
end




