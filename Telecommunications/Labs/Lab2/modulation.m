% % % Amplitude modulation
clc
clear variables
close all

model1 ='lab_modulation_am';
open(model1) 
set_param('lab_modulation_am/M', 'Value', '1')
save_system(model1);
simOut1 = sim('lab_modulation_am', 'SaveOutput', 'on', 'SaveFormat', 'Dataset');
% simOut.yout.get(1)
simOut1.yout.get(1).Values;
X1=simOut1.yout.get(1).Values.Data;
t1=simOut1.yout.get(1).Values.Time;
% figure
% plot(t1,X1)

N1=length(X1);
fd1 = 1/(t1(2)-t1(1));

S1 = abs(fft(X1)/N1);
S1 = S1(1:N1/2);
S1(2:N1/2)=2*S1(2:N1/2);
f1=fd1*(0:1:(N1/2)-1)'/N1;
% figure
% plot(f1, S1)
close_system

% % % freq modulation

model2 ='lab_modulation_fm';
open(model2) 
set_param('lab_modulation_fm/dW', 'Value', '50*2*pi')
set_param('lab_modulation_fm/FM', 'Kc', '50')

save_system(model2);
simOut2 = sim('lab_modulation_fm', 'SaveOutput', 'on', 'SaveFormat', 'Dataset');
% simOut.yout.get(1)
simOut2.yout.get(1).Values;
X2=simOut2.yout.get(1).Values.Data;
t2=simOut2.yout.get(1).Values.Time;
% figure
% plot(t2,X2)

N2=length(X2);
fd2 = 1/(t2(2)-t2(1));

S2 = abs(fft(X2)/N2);
S2 = S2(1:N2/2);
S2(2:N2/2)=2*S2(2:N2/2);
f2=fd2*(0:1:(N2/2)-1)'/N2;
% figure
% plot(f2, S2)
close_system

% % % Phase modulation
model3 ='lab_modulation_pm';
open(model3) 
set_param('lab_modulation_pm/dPhi', 'Value', 'pi/2')
set_param('lab_modulation_pm/PM', 'Kc', 'pi/2')
save_system(model3);
simOut3 = sim('lab_modulation_pm', 'SaveOutput', 'on', 'SaveFormat', 'Dataset');
% simOut.yout.get(1)
simOut3.yout.get(1).Values;
X3=simOut3.yout.get(1).Values.Data;
t3=simOut3.yout.get(1).Values.Time;
% figure
% plot(t3,X3)

N3=length(X3);
fd3 = 1/(t3(2)-t3(1));

S3 = abs(fft(X3)/N3);
S3 = S3(1:N3/2);
S3(2:N3/2)=2*S3(2:N3/2);
f3=fd3*(0:1:(N3/2)-1)'/N3;
% figure
% plot(f3, S3)
close_system

plot(f1, S1, f2, S2, f3, S3)