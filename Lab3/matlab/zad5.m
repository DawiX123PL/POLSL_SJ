clear all
close all
clc



h1=10;
b1=35;
c1=7;

h2=7;
b2=65;
c2=8;


y = @(h, b, c, x)  h * exp(  - (x-b).^2 / (2*c*c)   )

s = @(h, b, c, x) y(h(1), b(1), c(1), x) + y(h(2), b(2), c(2), x);


% beta = [ h1 h2 b1 b2 c1 c2 ]
s_final = @(beta, x) s(beta(1:2), beta(3:4), beta(5:6), x)



beta_0 = [10 10 50 70 20 10]

beta_oczekiwane = [ h1 h2 b1 b2 c1 c2 ]

X = [0:0.1:100];
Y = s_final(beta_oczekiwane, X) + 0.01*h1*randn(size(X));

beta = nlinfit(X, Y, s_final, beta_0)



plot(X, Y); hold on
plot(X, s_final(beta, X));
plot(X, s_final(beta_0, X));

legend("Dane zaszumione", "Dopasowane", "Warunki początkowe")






















