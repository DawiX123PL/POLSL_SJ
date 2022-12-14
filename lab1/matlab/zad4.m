clear all
close all
clc






n = 11; % liczba probek
m = 16; % liczba pomiarow

pomiary = randn(n,m)';

pomiary'

wyswietl_pomiary(pomiary);


function wyswietl_pomiary(pomiary)

    figure
    plot(std(pomiary,[],2))
    
    
    RawTable = [
    % N	A3(N)	B3(N)	B4(N)
    2	2.659	0	3.267
    3	1.954	0	2.568
    4	1.628	0	2.266
    5	1.427	0	2.089
    6	1.287	0.03	1.97
    7	1.182	0.118	1.882
    8	1.099	0.185	1.815
    9	1.032	0.239	1.761
    10	0.975	0.284	1.716
    15	0.789	0.428	1.572
    20	0.68	0.51	1.49
    25	0.606	0.565	1.435
    ];


    N = 1:25;

    Table = interp1(RawTable(:,1), RawTable(:, 2:end), N', 'spline');
        
    %               _
    % DLK = B3(N) * S    
    %               _
    % GLK = B4(N) * S

    n = size(pomiary, 2);
    DLK = Table(n,2) * mean(std(pomiary,[],2));
    GLK = Table(n,3) * mean(std(pomiary,[],2));

    hold on
    yline(GLK)
    yline(DLK)
    hold off

    ylim([(DLK - .2*(GLK - DLK)),  (GLK + .2*(GLK - DLK))] )
    
    grid on
    saveas(gcf, "../zad4_plot.png");

end




