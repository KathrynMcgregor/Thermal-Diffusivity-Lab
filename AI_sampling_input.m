%Thermal Diffusivity Task 2
%Only reads data after the gun flash, the time of which is recorded by the
%phototransistor in AI1
%Gets values of voltage(V) from the thermopile AI0 and converts it to
%temperature(K)
%Plots a graph of temperature against time 


daq.reset;
clear;
close all;
clc;

s = daq.CreateSession('ni');
s.addAnalogInputChannel('Dev1',0:1,'Voltage');
s.Rate = 1000; s.Duration = 5;
[data, timestamps] = startForeground(s);
disp('Ready!');

%times after the flash
time = [];
t = timestamps(1);
a = 1;
if t > data(1,2)
    % if the time recorded is after the flash, add it to the plotted times
    % vector
    time = [time:t];
    a = a+1;
    t = timestamps(a);    
end


%Only take values of temperature after the flash 
sigma = 0;
em = 0;
len = length(data(:,1));
temp_volts = data(a-1:len,1);
temp_kelvin = power(temp_volts./sigma*em, 1/4);


plot(time,temp_kelvin);
title('Data sampled from thermopile');
xlabel('Time(Seconds)');
ylabel('Temperature(Kelvin)');

delete(s);clear s