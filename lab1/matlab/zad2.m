clear all
close all
clc



n = 5; % liczba probek
m = 100; % liczba pomiarow

pomiary = randn(n,m);

pomiary'

wyswietl_pomiary(pomiary);

function wyswietl_pomiary(pomiary)

    figure
    boxplot(pomiary')

end











