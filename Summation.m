clc;
clear all;
close all;

%Calculates first 3 terms of the sum and plots y(temp) against x(proportional to time)

x = 0:0.01:0.7; syms n;
y = 1+2*symsum(((-1)^n)*exp(-(n^2*pi^2*x)),n,1,3);
plot(x,y);
xlabel('at/L^2');
ylabel('T/Tm');
ylim([0 1])
title('Temperature against time');