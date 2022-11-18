clear all
close all
clc



sigma = 1
mi = 10
n = 10
X = randn(n, 1) * sigma + mi;

alpha = 0.05
mi_0 = 9.5

disp("----------------------------------------")
disp("               Wynik obliczeń           ")
[Z, Z_kryt, H_0] = TestIstotnosci(alpha, X, mi_0, "both")



% test = "right" or "left" or "both";
function [Z, Z_kryt, H] = TestIstotnosci (alpha, X, mi_0, test)

    mi = mean(X);
    sigma = std(X);
    n = numel(X);

    Z = (mi - mi_0) * sqrt(n) / sigma;

    
    if test == "left"
        Z_kryt  = tinv(alpha, n-1);
        H_0 = Z_kryt < Z;

    elseif test == "right"
        Z_kryt = tinv(1-alpha, n-1);
        H_0 = Z_kryt > Z;

    elseif test == "both"
        Z_kryt = tinv([(alpha/2) (1-alpha/2)], n-1);
        H_0 = Z_kryt(1) < Z && Z < Z_kryt(2);

    end

    if H_0
        H = "Hipoteza zerowa";
    else
        H = "Hipoteza alternatywna";
    end


    %  wykres
    figure
    plot(-5:0.01:5, tpdf(-5:0.01:5, n-1)); hold on;
    plot(Z, tpdf(Z, n-1), '*');
    xline(Z_kryt);

end













