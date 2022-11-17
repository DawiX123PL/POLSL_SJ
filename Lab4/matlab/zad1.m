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
        Z_kryt  = norminv(alpha);
        H_0 = Z_kryt < Z;

    elseif test == "right"
        Z_kryt = norminv(1-alpha);
        H_0 = Z_kryt > Z;

    elseif test == "both"
        Z_kryt = norminv([(alpha/2) (1-alpha/2)]);
        H_0 = Z_kryt(1) < Z && Z < Z_kryt(2);

    end

    if H_0
        H = "Hipoteza zerowa";
    else
        H = "Hipoteza alternatywna";
    end


    %  wykres
    figure
    plot(-5:0.01:5, normpdf(-5:0.01:5)); hold on;
    plot(Z, normpdf(Z), '*');
    xline(Z_kryt);

end













