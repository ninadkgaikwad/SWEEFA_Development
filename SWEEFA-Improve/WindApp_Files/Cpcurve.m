function [Cp, TSR] = Cpcurve( n, c1, c2, c3, c4, c5, c6, x, Theta )

TSR = 0:0.01:25;

for j = 1:n
    
    for i = 1:length(TSR)
        
        Bi(1,i) = (1/(TSR(1,i) + 0.08*Theta)) - (0.035/(1+(Theta^3)));
        
        Cp(j,i) = c1(1,j) * ((c2(1,j) * Bi(1,i)) - (c3(1,j) * (1/Bi(1,i)) * Theta) - (c4(1,j)*(Theta^x(1,j))) - c5(1,j)) * exp(-c6(1,j) * Bi(1,i));
        
    end
    


end

end

