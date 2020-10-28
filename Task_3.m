%Thermal Diffusivity Task 3

%Calculates time taken for temp to reach half maximum

daq.reset;
clear;
close all;
clc;

s = daq.CreateSession('ni');
s.addAnalogInputChannel('Dev1',0:1,'Voltage');
s.Rate = 1000; s.Duration = 5;
[data, timestamps] = startForeground(s);
disp('Ready!');

%find time index of voltage pulse/ flash by finding index of non-zero
%element
t = find(data(:,2)); 

%Readings of temperature after pulse
temp = data(t:length(data(:,1)),1);

%Find half the maximum temp value of smoothed data
temp_smooth = smooth(temp);
half_max_temp = .5*max(temp_smooth);

%Find index of half temp in array, need closest value to half max temp,
%make vector of absolute values of the differences between and find
%minimum's index?
n = find(temp_smooth == half_max_temp);

%find half time
start_time = timestamps(t);
end_time = timestamps(n);
half_time = end_time-start_time;

delete(s);clear s