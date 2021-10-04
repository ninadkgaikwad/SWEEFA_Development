function [ ActualValue ] = PerUnitToActual(Sbase, Vbase, IndiPhase, IndiValue, PuValue  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

if (IndiPhase==1) % Single Phse PU System
 
    Ibase=Sbase/Vbase;
    
    Zbase=(Vbase)^(2)/Sbase;
    
    if (IndiValue==1) % Calculate Actual Z
        
        ActualValue=PuValue*Zbase;
        
    elseif (IndiValue==2) % Calculate Actual I
    
        ActualValue=PuValue*Ibase;
        
    elseif (IndiValue==3) % Calculate Actual V
            
         ActualValue=PuValue*Vbase;
        
    elseif (IndiValue==4) % Calculate Actual S
        
        ActualValue=PuValue*Sbase;
        
    else
        
        error('Indicator Value should [1,2,3,4]'); 
        
    end
            
    
elseif (IndiPhase==3) % Three Phase PU System
    
    Ibase=(Sbase)/(sqrt(3)*Vbase);
    
    Zbase=(Vbase)^(2)/Sbase;
    
   % Z=Vbase/(sqrt(3)*Ibase)
    
    if (IndiValue==1) % Calculate Actual Z
        
        ActualValue=PuValue*Zbase;
        
    elseif (IndiValue==2) % Calculate Actual I
    
        ActualValue=PuValue*Ibase;
        
    elseif (IndiValue==3) % Calculate Actual V
            
         ActualValue=PuValue*Vbase;
        
    elseif (IndiValue==4) % Calculate Actual S
        
        ActualValue=PuValue*Sbase;
        
    else
        
        error('Indicator Value should [1,2,3,4]'); 
        
    end
    
    
else
    
    error('Phase Value should be either 1 or 3');

    
end
end

