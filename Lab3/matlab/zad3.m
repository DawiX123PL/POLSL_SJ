clear all
close all
clc


sigma = 0.0025
%sigma = 0.01
%sigma = 0.25
%sigma = 1


f = @(x) 0.1 * (x.^4 - 20*x.^2 + 5*x) + sigma * randn(size(x));

X_0 = [-5:0.1:5];

minimiums = [];
for x0 = X_0
    m = fminsearch(f, x0);
    minimiums = [minimiums, m];
end


% plot curve
plot([-5:0.001:5], f([-5:0.001:5]));
xlim([-5 5]) 
hold on;

% startowe
plot(X_0, f(X_0), '.')

% startowe
plot(minimiums, f(minimiums), 'o')

legend("f(x)", "f(x_0)", "fmin");



