poly = [1, 0, 0, 1, 1];

crcGen = comm.CRCGenerator('Polynomial',poly,'ChecksumsPerFrame',1);
crcDet = comm.CRCDetector('Polynomial',poly,'ChecksumsPerFrame',1);

number = de2bi(46, 8, 'left-msb');
DataLength = length(number);
disp(DataLength)

codestep = step(crcGen, number');
codestepLength = length(codestep);
disp(codestepLength)

redundancy = (codestepLength-DataLength)/codestepLength;
disp(redundancy)


errorBin = de2bi(16, 8, 'left-msb');
encodedError = bitxor(number ,errorBin);
[codestep, r] = step(crcDet, encodedError');
disp(r)

%disp
%кодовый полином
disp(poly)
%кодируемое сообщение (и дополнительно в десятичной);
disp(number)
% остаток от деления кодируемого сообщения на кодовый полином;
%dsip("hghfd")
%закодированное сообщение
disp(codestep')
%модель ошибки
disp(errorBin)
%полученное приемником сообщение;
disp(encodedError)
%декодированное сообщение
disp(codestep)

%2.6
z = bin_mod_my(encodedError,poly);
disp(z)

for i = 1:12
   er = zeros(12,1);
   er(13-i) = 1;
   
   codestep = step(crcGen, number');
   x_e = bitxor(codestep, er); 
   s = bin_mod_my(x_e, poly');
   l = length(s);
   T1 = table( {i, s(l-3), s(l-2), s(l-1), s(l)}, (1:5) );
   disp(T1)
end



