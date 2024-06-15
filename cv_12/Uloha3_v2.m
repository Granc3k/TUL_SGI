close all
clear all
clc

load('digits_tren.mat');
load('digits_test.mat');

N = 1000;
M = 9000;
num_sets = 9; % Počet sad vzorů k postupné klasifikaci
vysledky = zeros(1,num_sets);


for subset_size = 1:num_sets
    pocet_spravnych = zeros(1, subset_size);
    pocet_pokusu = zeros(1, subset_size);
    tic
    subset_indices = 1:(subset_size * N); % Indexy pro sadu subsetu

    for i = 1:N
        x = test_data(i, :, :);
        x_trida = test_trida(i);

        for j = 1:(subset_size * N)
            v = tren_data(subset_indices(j), :, :);
            v_trida = tren_trida(subset_indices(j));
            dist(j) = sqrt(sum(sum((x - v).^2)));
            tridy_vzoru(j) = v_trida;
        end

        [min_dist, index] = min(dist(1:(subset_size * N)));
        nejblizsi_trida = tridy_vzoru(index);

        if x_trida == nejblizsi_trida
            pocet_spravnych(subset_size) = pocet_spravnych(subset_size) + 1;
        end

        pocet_pokusu(subset_size) = pocet_pokusu(subset_size) + 1;

        if mod(i, 10) == 0
            uspesnost = pocet_spravnych / pocet_pokusu * 100;
            disp(['Pocet sad: ', num2str(subset_size * N), '. Otestovano ', num2str(i), ' obrazku. Uspesnost: ', num2str(uspesnost), '%']);
        end
    end

    uspesnost = pocet_spravnych / pocet_pokusu * 100;
    vysledky(subset_size)=uspesnost;
    disp(['Uspesnost pro ', num2str(subset_size), ', sad: ', num2str(uspesnost), '%']);
    toc
end
figure;
bar(vysledky);
grid on;

figure;
plot(vysledky);
grid on;