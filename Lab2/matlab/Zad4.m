clear all
close all
clc


Sigma_1 = []
Sigma_2 = []
Sigma_3 = []


for i = 1:1000
    disp("Pętla:" + string(i))
    [sigma1, sigma2, sigma3] = calc_sigma;
    Sigma_1 = [Sigma_1, sigma1];
    Sigma_2 = [Sigma_2, sigma2];
    Sigma_3 = [Sigma_3, sigma3];
end


var(Sigma_1)
var(Sigma_2)
var(Sigma_3)


var(Sigma_1) / var(Sigma_1)
var(Sigma_1) / var(Sigma_2)
var(Sigma_1) / var(Sigma_3)




function [sigma1, sigma2, sigma3] = calc_sigma()
    
    k = 18;
    n = 1000;
    
    X = randn(k, n);
    
    
    
    RawTable = [
    %N      a(K)       b(K)       c(K)   
    2       1.253      0.8865     1.1829
    3       1.1284     0.5907     1.0646
    4       1.0854     0.4857     1.0374
    5       1.0638     0.4300     1.0260
    6       1.0510     0.3946     1.0201
    7       1.0423     0.3698     1.0161
    8       1.0363     0.3512     1.0136
    9       1.0317     0.3367     1.0116
    10      1.0281     0.3249     1.0103
    15      1.0180     0.2880     1.0063
    20      1.0133     0.2677     1.0046
    ];
    
    
    Table = interp1(RawTable(:, 1), RawTable(:, 2:end), [1:20], 'linear')
    
    a = Table(:,1);
    b = Table(:,2);
    c = Table(:,3);
    
    
    sigma1 = a(k) * mean(std(X));
    sigma2 = b(k) * mean(max(X) - min(X));
    sigma3 = c(k) * median(std(X));
    
    sigma1;
    sigma2;
    sigma3;
    
    
    %figure; show_hist(X, sigma1, "Sigma1");
    %figure; show_hist(X, sigma2, "Sigma2");
    %figure; show_hist(X, sigma3, "Sigma3");
    


end


function show_hist(X, sigma, title_1)
    X1 = normpdf([-5:0.01:5], mean(X,"all"), sigma);
    [counts,centers] = hist(reshape(X,1,[]));
    
    bar(centers, counts/sum(counts)/ (centers(2) - centers(1)) );
    hold on
    plot([-5:0.01:5], X1); 
    title(title_1)


end




