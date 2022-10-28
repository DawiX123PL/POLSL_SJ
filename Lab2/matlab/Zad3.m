clear all
close all
clc


N = 1000;

normalize = @(X) (X - mean(X)) / std(X);

X_norm = normalize(randn(N, 1));
X_uniform = normalize(rand(N, 1));

X_norm_sort = sort(X_norm);
X_uniform_sort = sort(X_uniform);


r = 1:N;
Kr = (r - .5) / N;

Y = norminv(Kr);


plot(X_uniform_sort, Y, '.')

