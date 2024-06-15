%clear all;
% data 
test_soubor = 'c3_p0001_v01.jpg';
tren_soubor = ['c0_p0001_v02.jpg';'c1_p0001_v02.jpg';'c2_p0001_v02.jpg';'c3_p0001_v02.jpg';'c4_p0001_v02.jpg';'c5_p0001_v02.jpg';'c6_p0001_v02.jpg';'c7_p0001_v02.jpg';'c8_p0001_v02.jpg';'c9_p0001_v02.jpg'];
tren_trida = [0 1 2 3 4 5 6 7 8 9];     

% porovnani vzdalenosti
x = imread(test_soubor);
dist= zeros(1,10);
for j = 1:10
    v = imread(tren_soubor(j, :));
    dist(j) = sum(sum(abs(x - v)));
end

% vyhodnoceni
min_dist = min(dist);
index=1;
for j = 2:10
    if dist(j)==min_dist
        index=j;
    end
end
%[min_dist, index] = min(dist);
nejblizsi_trida = tren_trida(index);

disp (['Obrázek rozpoznán jako ', num2str(nejblizsi_trida)])

disp(dist);

% zobrazeni
classified_image = imread(tren_soubor(index, :));
imshow(classified_image);
title(['Classified as: ', num2str(nejblizsi_trida)]);

