function [AveragedVariable]=WTG_PlantWTGTypeLevel_Averager(subnum,subnum_Total,PlantVariable)

%% Function Details:

% subnum = A Vector containing Number of Turbines per Sub-Type for a given WTG Type
% subnum_Total = A Scalar containing total number Turbines for a given WTG Type 
% PlantVariable = A Vector containing a Static Plant Variable per Sub-Type for a given WTG Type

%% Computing Wind Plant Level Averaged Variable Value

AveragedVariable=(PlantVariable.*subnum)/(subnum_Total); % Weighted Average

end

