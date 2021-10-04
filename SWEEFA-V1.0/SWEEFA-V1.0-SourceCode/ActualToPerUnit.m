function [ PuValue] = ActualToPerUnit( Sbase, Vbase, IndiPhase, IndiValue, ActualValue  )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

if (IndiPhase==1) % Single Phse PU System
 
    Ibase=Sbase/Vbase;
    
    Zbase=(Vbase)^(2)/Sbase;
    
    if (IndiValue==1) % Calculate PU Value of Z
        
        PuValue=ActualValue/Zbase;
        
    elseif (IndiValue==2) % Calculate PU Value of I
    
        PuValue=ActualValue/Ibase;
        
    elseif (IndiValue==3) % Calculate PU Value of V
            
         PuValue=ActualValue/Vbase;
        
    elseif (IndiValue==4) % Calculate PU Value of S
        
        PuValue=ActualValue/Sbase;
        
    else
        
        error('Phase Value should [1,2,3,4]'); 
        
    end
            
    
elseif (IndiPhase==3) % Three Phase PU System
    
    Ibase=(Sbase)/(sqrt(3)*Vbase);
    
    Zbase=(Vbase)^(2)/Sbase;
    
    if (IndiValue==1) % Calculate PU Value of Z
        
        PuValue=ActualValue/Zbase;
        
    elseif (IndiValue==2) % Calculate PU Value of I
    
        PuValue=ActualValue/Ibase;
        
    elseif (IndiValue==3) % Calculate PU Value of V
            
         PuValue=ActualValue/Vbase;
        
    elseif (IndiValue==4) % Calculate PU Value of S
        
        PuValue=ActualValue/Sbase;
        
    else
        
        error('Phase Value should [1,2,3,4]'); 
        
    end
    
    
else
    
    error('Phase Value should be either 1 or 3');

    
end
end




