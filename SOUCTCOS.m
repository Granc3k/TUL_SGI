% SOUCTCOS.M - ukazka souctu kosinusovek tvoricich jednotkovy impuls
clc;
close all;
clear all;

Fs = 100;
pocet = 1000;
f=2;


t=-1:1/Fs:1;
s=cos(2*pi*t*0); % nuly
for n = 1:pocet
   x1=(1/(n+2))*cos(2*pi*(n+2)*f*t-(pi/2));
   x2=(1/(n+1))*cos(2*pi*(n+1)*f*t-(pi/2));
   
   %s=s+cos(2*pi*t*n);
   plot(t,s);
   title(n);
   pause;
end

   N = 1000;
   F = 0:Fs/N:Fs/2-Fs/N;
   X = fft(x1,N);
   stem(F(1:40),1/(N/2)*abs(X(1:40)),'.')

