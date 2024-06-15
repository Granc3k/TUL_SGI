clear all;
clc;
close all;

A1 = 2;
A2 = 4;
f1 = 4;
f2 = 2;
fi1 = pi/3;
fi2 = pi/4;
Fs = 20;
T = 2;
M = 0;
t = 0:1/Fs:T-1/Fs;

y1 = A1*cos(2*pi*f1*t+fi1)+M;
y2 = A2*cos(2*pi*f2*t+fi2)+M;
figure;

subplot(3,1,1);
stem(t,y1);
xlabel("t");
ylabel("x[n]");
subplot(3,1,2);
stem(t,y2);
xlabel("t");
ylabel("x[n]");
subplot(3,1,3);
y3=y1+y2
stem(t,y3);
xlabel("t");
ylabel("x[n]");


%subplot(2,1,1);
%plot(t,y, "r--")
%xlabel("t");
%ylabel("x[t]");

%xlabel("n");
%ylabel("x[n]");
%stem(t,y);
%hold off;   

