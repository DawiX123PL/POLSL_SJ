clear all
close all
clc


sigma = 1;
mi = 0;

N = 100000;

X = randn(N, 1) * sigma + mi;

X = sort(X);

C = []
s = 0;
for xi = X
    s = s + xi;
    C = [C, s];
end



[counts,centers] = hist(X, 20);
bar(centers, counts/sum(counts)); hold on
plot([-5:0.001:5], normpdf([-5:0.001:5]) );

legend("Histogram","Teoretyczna funkcja gęstości")


figure 

% plot([-5:0.001:5], normpdf([-5:0.001:5]) ); 
plot([-5:0.001:5], normcdf([-5:0.001:5]) ); hold on
plot(X, C ); hold on


legend("Teoretyczna funkcja gęstości","Dystrybuanta teoretyczna ")




