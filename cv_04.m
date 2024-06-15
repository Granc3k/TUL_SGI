clear all;
close all;
clc;

[sig, Fs] = audioread('cv04_00.wav');
NBITS = audioinfo('cv04_00.wav').BitsPerSample;

A = [];
for i = 1:100:size(sig)-100
    
    A(end+1) = sum(sig(i:i+99).^2);
end

D = [];
D(1)=A(1);
for i = 2:length(A)
    D(end+1) = A(i) - A(i-1);
end

subplot(3,1,1)
plot(sig);
subplot(3,1,2)
plot(A);
subplot(3,1,3)
plot(D);