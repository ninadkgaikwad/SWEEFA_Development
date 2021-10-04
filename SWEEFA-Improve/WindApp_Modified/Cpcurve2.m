function [Cp, TSR] = Cpcurve2( Theta )


TSR = 0:0.01:25;


    
    for i = 1:length(TSR)
        
             
        Cp(1,i) = (0.5) * ((TSR(1,i)) - (0.022 * (Theta^2)) - (5.6)) * (exp(-0.17 * (TSR(1,i))));
        
    end
    


end

