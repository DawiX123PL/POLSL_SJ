clear all
close all
clc


sigma = 1;
mi = 0;

N = 100000;

X = randn(N, 1) * sigma + mi;




[counts,centers] = hist(X, 20);
bar(centers, counts/sum(counts));

hold on

plot([-5:0.001:5], normpdf([-5:0.001:5]) );





