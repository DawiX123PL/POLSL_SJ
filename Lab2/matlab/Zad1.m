clear all
close all
clc


%                p   , N
show_probability(0.1, 50)



function P_vec = show_probability(p, N)
    
    
    % symbol newtona 
    % nchoosek(n,k)
    P = @(K) nchoosek(N, K) * p.^K * (1-p).^(N-K);
    


    
    K_vec = 1:N;
    P_vec = [];
    for K = K_vec
        P_vec = [P_vec, P(K)];
    end


    P_c = P_vec
    for i = N-1:-1:1
        P_c(i) = P_c(i) + P_c(i+1);
    end


    
    plot(K_vec, P_vec);
    xlabel("K");
    ylabel("prawdopodobieństwo P(K)");

    figure
    plot(K_vec, P_c);
    xlabel("K");
    ylabel("prawdopodobieństwo P(K)");


end










