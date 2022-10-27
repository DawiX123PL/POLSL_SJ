clear all
close all
clc



k = 6.9*2 % ??????


P_XDDD = zad2a(k)

K_XDDDD = zad2b(P_XDDD)


function P = zad2a(k)
  
    P = 2 * normcdf([-k])
    
end


function k = zad2b(P_ok)
  
    for k = 0:0.001:1000
        P = 2 * normcdf(-k);
        if(P < P_ok)
            return;
        end
    end

end






