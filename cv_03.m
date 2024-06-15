clear all;
close all;
clc;

BPM = 120;
Fs = 8000;
q = 2^(1/12);

A4 = 440;
C5 = A4 * q^3;
G4 = A4 / q^2;
E = A4 / q^5;
F = A4 / q^4;
D = A4 / q^7;

T_ctvrt = 60/BPM;
T_pul = T_ctvrt*2;
t_ctvrt = 0 : 1/Fs : T_ctvrt - 1/Fs;
t_pul = 0 : 1/Fs : T_pul - 1/Fs;


A_ctvrt = cos(2*pi*A4*t_ctvrt);
G_pul = cos(2*pi*G4*t_pul);
G_ctvrt = cos(2*pi*G4*t_ctvrt);
C_ctvrt = cos(2*pi*C5*t_ctvrt);
C_pul = cos(2*pi*C5*t_pul);
E_ctvrt = cos(2*pi*E*t_ctvrt);
E_pul =  cos(2*pi*E*t_pul);
F_pul = cos(2*pi*F*t_pul);
F_ctvrt = cos(2*pi*F*t_ctvrt);
D_ctvrt = cos(2*pi*D*t_ctvrt);
pauza_ctvrt = zeros(1, length(t_ctvrt));

%sig = [A_ctvrt pauza A_ctvrt pauza G_pul pauza G_pul C_pul C_pul A_ctvrt];
sig = [G_ctvrt G_ctvrt E_ctvrt pauza_ctvrt G_ctvrt G_ctvrt E_ctvrt pauza_ctvrt G_ctvrt G_ctvrt A_ctvrt G_ctvrt G_pul F_pul F_ctvrt F_ctvrt D_ctvrt pauza_ctvrt F_ctvrt F_ctvrt D_ctvrt pauza_ctvrt F_ctvrt F_ctvrt G_ctvrt F_ctvrt F_pul E_pul];
sound(sig, Fs);