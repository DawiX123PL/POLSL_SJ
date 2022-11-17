clear all
close all
clc




n = 10;
m = 5;

alpha = 0.05
p_0 = .5

disp("----------------------------------------")
disp("               Wynik obliczeń           ")
[Z, Z_kryt, H]  = TestIstotnosci(alpha, m, n, p_0, "both")



% test = "right" or "left" or "both";
function [Z, Z_kryt, H] = TestIstotnosci (alpha, m, n, p_0, test)


    p = m / n;
    q_0 = 1 - p_0;

    Z = p - p_0 / sqrt(p_0 * q_0 / n);


    if test == "left"
        Z_kryt = norminv(alpha/2);
        H_0 = Z_kryt < Z;

    elseif test == "right"
        Z_kryt = norminv(1-alpha/2);
        H_0 = Z_kryt > Z;

    elseif test == "both"
        Z_kryt = norminv([alpha/2, 1-alpha/2]);
        H_0 = Z_kryt(1) < Z && Z < Z_kryt(2);

    end

    if H_0
        H = "Hipoteza zerowa";
    else
        H = "Hipoteza alternatywna";

     %  wykres
    end
    
     %  wykres
    figure
    plot(-5:0.01:5, normpdf(-5:0.01:5)); hold on;
    plot(Z, normpdf(Z), '*');
    xline(Z_kryt);
    
    
    
end














