clear all
close all
clc



sigma = 1
mi = 10
n = 10
X = randn(n, 1) * sigma + mi;

alpha = 0.05
sigma_0 = 1

disp("----------------------------------------")
disp("               Wynik obliczeń           ")
[chi2, chi2_kryt, H_0] = TestIstotnosci(alpha, X, sigma_0, "both")



% test = "right" or "left" or "both";
function [chi2, chi2_kryt, H] = TestIstotnosci (alpha, X, sigma_0, test)

    mi = mean(X);
    sigma = std(X);
    n = numel(X);


    chi2 = n * sigma^2 / sigma_0^2;
    
    
    if test == "left"
        chi2_kryt = chi2inv(alpha/2 ,n-1);
        H_0 = chi2_kryt < chi2;

    elseif test == "right"
        chi2_kryt = chi2inv(1-alpha/2 ,n-1);
        H_0 = chi2 < chi2_kryt;

    elseif test == "both"
        chi2_kryt = chi2inv([alpha/2, 1-alpha/2] ,n-1);
        H_0 = chi2_kryt(1) < chi2 && chi2 < chi2_kryt(2);

    end

    if H_0
        H = "Hipoteza zerowa";
    else
        H = "Hipoteza alternatywna";
    end

    %  wykres
    figure
    plot(-5:0.01:25, chi2pdf(-5:0.01:25, n-1)); hold on;
    plot(chi2, chi2pdf(chi2, n-1), '*');
    xline(chi2_kryt);


end













