clear all;
close all;

global delimiter;
practice_or_test = 1; %0=practice, 1=test
os = 0; %0==linux or mac, 1=windows
if os == 0
    delimiter = '/'; % for linux or mac
else
    delimiter = '\';
end

file_name = '../../database_raw/Grid_A/Power_recordings/Train_Grid_A_P1.wav';

[x,fs]=audioread(file_name);
[enf,p_a,fc]=get_enf(x,fs,0);

plot(enf)
xlabel('Sample No.')
ylabel('enf')