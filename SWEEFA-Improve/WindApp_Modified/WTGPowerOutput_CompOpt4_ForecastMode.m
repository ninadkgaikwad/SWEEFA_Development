function [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt4_ForecastMode( WTGPower, WTGNum, Perf_Rat, Turbine_File, PR, ActiveTurbines  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Total Power Produce by all the Wind Turbines

% WTGPowerTotal=WTGPower*WTGNum;

WTGPowerTotal=WTGPower;

% Computing effect of Performance Ratio and Active Wind Turbines

if (Perf_Rat==1)
    
    WTGPowerPR = WTGPowerTotal*PR;
    
elseif (Turbine_File==1)
    
        WTGPowerPR = WTGPower*(ActiveTurbines/WTGNum);
        
end


end

