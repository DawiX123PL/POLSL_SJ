clear all
close all
clc


N = 1000;

X_norm = randn(N, 1);
X_uniform = rand(N, 1);

X_norm_sort = sort(X_norm);
X_uniform_sort = sort(X_uniform);


Y = linspace(0,1,N);



figure
hold on
plot(X_norm_sort, Y); 
plot(X_uniform_sort, Y);

P = normcdf([-5:0.001:5]);
plot([-5:0.001:5], P )

legend("Rand. Norm.", "Rand. Uni.", "Rozkład normalny skumulowany");



