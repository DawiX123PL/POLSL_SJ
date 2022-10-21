clear all
close all
clc



n = 11;
m = 16;
dim = [m n]

pomiary = 1000 * ones(dim) ...                   % wartość zadana
        + randn(dim) * 5 ...                   % szum losowy
        + bloken_sensor(dim, [.3, .3], [-300, 50])  % uszkodzone czujniki



wyswietl_pomiary(pomiary);

function wyswietl_pomiary(pomiary)

    figure
    boxplot(pomiary')

    grid on
    saveas(gcf, "../zad5_plot.png");

end


function y = bloken_sensor(dim, p1, max_noise)
    p1 = 1 - p1;
    activation_1 = rand(dim(1), 1) > p1(1);
    activation_2 = rand(dim(1), 1) > p1(2);

    activation_1 = repmat(activation_1, 1, dim(2));
    activation_2 = repmat(activation_2, 1, dim(2));

    y = activation_1 .* max_noise(1) ...
      + activation_2 .* randn(dim) * max_noise(2);

end




