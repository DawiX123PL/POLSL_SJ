clear all
close all
clc


%                p   , N
show_probability(0.3, 100)



function P_vec = show_probability(p, N)
    
    
    % symbol newtona 
    % nchoosek(n,k)
    P = @(K) nchoosek(N, K) * p.^K * (1-p).^(N-K);
    
    
    K_vec = 1:N;
    P_vec = [];
    for K = K_vec
        P_vec = [P_vec, P(K)];
    end
    
    
    plot(K_vec, P_vec);
    xlabel("K");
    ylabel("prawdopodobieństwo P(K)");


end










