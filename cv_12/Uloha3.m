close all
clear all
clc


% data 
load ('digits_tren.mat') ; 
load ('digits_test.mat') ;
%test_soubor = 'c1_p0001_v01.jpg';
%tren_soubor = ['c0_p0001_v02.jpg';'c1_p0001_v02.jpg';'c2_p0001_v02.jpg';'c3_p0001_v02.jpg';'c4_p0001_v02.jpg';'c5_p0001_v02.jpg';'c6_p0001_v02.jpg';'c7_p0001_v02.jpg';'c8_p0001_v02.jpg';'c9_p0001_v02.jpg'];


N = 1000; M = 9000; pocet_pokusu = 0; pocet_spravnych = 0;

for i = 1:N % cyklus pro test. obrázky, N max.1000
x = test_data (i,:,:); % načti test. obrázek
x_trida = test_trida(i); % jeho třída

for j = 1:M % cyklus pro tren. vzory, M max.9000
v = tren_data (j,:,:); % načti  tren. obrázek
v_trida = tren_trida(j); % jeho třída
tridy_vzoru(j) = v_trida; % ulož. číslo třídy do pole tridy_vzoru
dist(j)=sqrt(sum(sum((x - v).^2))); % urči vzdálenost a ulož do pole dist
end

[min_dist, index] = min(dist); % nejmenší vzdálenost a její index
nejblizsi_trida = tridy_vzoru(index); % třída nejbližšího vzoru

if x_trida == nejblizsi_trida % je shoda?
pocet_spravnych = pocet_spravnych + 1; % pokud ano, započítej
end

pocet_pokusu = pocet_pokusu + 1; % započítej pokus

if mod(i, 10) == 0
        uspesnost = pocet_spravnych / pocet_pokusu * 100; % úspěšnost pro k. 10  klasif. test. obr.
        disp(['Otestovano ', num2str(i), ' obrazku, Uspesnost: ', num2str(uspesnost), '%']);
    end
end

uspesnost = pocet_spravnych/pocet_pokusu * 100; % urči úspěšnost
disp(['Uspesnost: ', num2str(uspesnost), '%']); % a vypiš ji