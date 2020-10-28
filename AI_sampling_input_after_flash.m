%Thermal Diffusivity Task 2

%Gets values of voltage(V) from the thermopile AI0
%only keeps readings after the flash using find
%Plots a graph of temperature against time and voltage against time


daq.reset;
clear;
close all;
clc;

%start session, AIO is thermopile, AI1 is phototransistor 
s = daq.CreateSession('ni');
s.addAnalogInputChannel('Dev1',0:1,'Voltage');
s.Rate = 1000; s.Duration = 5;
[data, timestamps] = startForeground(s);
%may take matlab a long time so 'ready' message is printed to verify that
%it's working
disp('Ready!');

%find index of time of voltage pulse/ flash by finding non zero elements 
%Will the elements be (0,0,0,5,0,0) or will there be a background voltage?
t = find(data(:,2));

%only keep temp readings after the flash 
temp = data(t:length(data(:,1)),1);
time = timestamps(t:length(timestamps(:,1)),1);

%plot temp against time 
plot(time,temp);
title('Data sampled from thermopile');
xlabel('Time(Seconds)');
ylabel('Temperature(Kelvin)');

delete(s);clear s