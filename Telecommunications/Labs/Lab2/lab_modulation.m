% model='lab_modulation_am.slx';
% open(model);
% set_param('lab_modulation_am/Input AM', 'Amplitude', '1');
% set_param('lab_modulation_am/Input AM', 'Bias', '0');
% set_param('lab_modulation_am/Input AM', 'Frequency', '2*2*pi');
% set_param('lab_modulation_am/Input AM', 'Phase', '0');
% set_param('lab_modulation_am/Carrier', 'Amplitude', '1');
% set_param('lab_modulation_am/Carrier', 'Bias', '0');
% set_param('lab_modulation_am/Carrier', 'Frequency', '100*2*pi');
% set_param('lab_modulation_am/Carrier', 'Phase', '0');
% set_param('lab_modulation_am/Carrier', 'SampleTime', '0.0001');
% % set_param('lab_modulation_am/Lowpass', '', '1');
% % set_param('lab_modulation_am/Lowpass', 'Bias', '0');
% % set_param('lab_modulation_am/Lowpass', 'Frequency', '100*2*pi');
% % set_param('lab_modulation_am/Lowpass', 'Phase', '0');
% % set_param('lab_modulation_am/Lowpass', 'SampleTime', '0.0001');
% save_system(model);
% simOut = sim('lab_modulation_am');
% outputSignals = simOut.get('yout');
% outputSignals{1}.Values.Data

%это то, что димно скинул в группу
model='lab_modulation_am.slx';
open(model);
set_param('lab_modulation_am/M', 'Value', '0.5');
save_system(model);
simOut = sim('lab_modulation_am');
outputSignals = simOut.get('yout');
outputSignals{1}.Values.Data




