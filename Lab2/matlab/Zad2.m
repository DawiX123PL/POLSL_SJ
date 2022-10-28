clear all
close all
clc



k = 6.1 % ??????

P_XDDD = zad2a(k)


K_XDDDD = zad2b(P_XDDD)


function P = zad2a(k)
  
    P = 2 * normcdf([-k]);
    
end


function k = zad2b(P_ok)
  
    k = abs(norminv(P_ok));

end






