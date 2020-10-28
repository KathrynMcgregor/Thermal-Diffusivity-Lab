%Thermal Diffusivity Task 2

%plots voltage(V) from the thermopile AI0 and also the spike
%in voltage from the phototransistor AI1

daq.reset;
clear;
close all;
clc;

s = daq.CreateSession('ni');
s.addAnalogInputChannel('Dev1',0:1,'Voltage');
s.Rate = 1000; s.Duration = 5;
[data, timestamps] = startForeground(s);
disp('Ready!');
 
%Plot all data at all times 
%Relevant data will be after the large spike in voltage
plot(timestamps,data(:,1));hold on;
plot(timestamps,data(:,2));
title('Data sampled from thermopile');
xlabel('Time(Seconds)');
ylabel('Temperature(Kelvin)');

delete(s);clear s