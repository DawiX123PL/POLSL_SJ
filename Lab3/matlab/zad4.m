clear all
close all
clc


tabela = [
% LP.   Temp [*C]   R[kohm]
1       23.6        10.50
2       30          8.05
3       37.5        6.10
4       44          4.78
5       50          3.88
6       57          2.98
7       64          2.34
8       70          1.93
9       75          1.64
]

Temp = tabela(:,2) + 273.15; % [*K]
Rt = tabela(:,3) * 1000;     % [ohm]



%%
% punkt A


% y = b1*x + b0
%
% y = ln(Rt)
% b0 = ln(A)
% b1 = B
% x = 1/T
%

x = 1./Temp;
y = log(Rt);

x_av = mean(x);
y_av = mean(y);

b1 = sum((x - x_av).*(y - y_av)) / sum((x - x_av).^2);
b0 = y_av - b1 * x_av;

A_lin = exp(b0);
B_lin = b1;

% wyniki 


test_temp = [20:0.1:100] + 273.15;
termistor_resistance_lin = @(Temp1) A_lin*exp(B_lin./Temp1);

plot(Temp, Rt); hold on
plot(test_temp, termistor_resistance_lin(test_temp));

xlabel('Tempertura [K]');
ylabel('R_T [ohm]');
legend('Dane z tabeli','Wyznaczona funkcja rezystancji')
title('regresja liniowa')

%%
% Punkt B

%                      [A, B],              A*exp(      B./Temp1);                
termistor_resistance_b = @(Beta, Temp1) Beta(1)*exp(Beta(2)./Temp1);

beta = nlinfit(Temp, Rt, termistor_resistance_b, [100 100])

A_nlin = beta(1)
B_nlin = beta(2)

figure

termistor_resistance_nlin = @(Temp1) A_nlin*exp(B_nlin./Temp1);

plot(Temp, Rt); hold on
plot(test_temp, termistor_resistance_nlin(test_temp));

xlabel('Tempertura [K]');
ylabel('R_T [ohm]');
legend('Dane z tabeli','Wyznaczona funkcja rezystancji reg. nlin.')

%%
% porownanie wszystkiego

figure
termistor_resistance_b = @(Temp1) A_nlin*exp(B_nlin./Temp1);

plot(Temp, Rt); hold on
plot(test_temp, termistor_resistance_lin(test_temp));
plot(test_temp, termistor_resistance_nlin(test_temp));


xlabel('Tempertura [K]');
ylabel('R_T [ohm]');
legend('Dane z tabeli', ...
        'Wyznaczona funkcja rezystancji reg. lin.',...
        'Wyznaczona funkcja rezystancji reg. nlin.')