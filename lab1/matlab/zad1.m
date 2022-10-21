clear all
close all
clc



n = 5; % liczba probek
m = 100; % liczba elementów

pomiary = 1000 + randn(n,m) * 5; 

pomiary'

wyswietl_pomiary(pomiary);


function wyswietl_pomiary(pomiary)

    figure
    tiledlayout(3,1)

    nexttile
    plot(pomiary,'*');
    title("surowe pomiary");
    xlabel("nr. próbki");
    ylabel("wartość pomiaru")
    xticks(1:size(pomiary,1));
    grid on

    nexttile
    plot(mean(pomiary,2),'*');
    title("Srednia");
    xlabel("nr. próbki");
    ylabel("średnia wartość pomiaru")
    xticks(1:size(pomiary,1));
    grid on

    nexttile
    plot(std(pomiary,[],2),'*');
    title("odchylenie standardowe");
    xlabel("nr. próbki");
    xticks(1:size(pomiary,1));
    grid on
    
    saveas(gcf, "../zad1_plot.png");

end











