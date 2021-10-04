function [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% Computing Wake Losses

if (Wake1==1)
    
    WTGPowerAfterWake=(1-(WakeLoss/100))*WTGPowerPR;
    
    WTGPowerAfterOhmicLoss=(1-(OhmicLoss/100))*WTGPowerAfterWake;
    
    WTGPowerAfterTransLoss=(1-(TransLoss/100))*WTGPowerAfterOhmicLoss;
    
    WTGPowerGrid=WTGPowerAfterTransLoss;

else
    
    WTGPowerAfterWake=WTGPowerPR;
    
    WTGPowerAfterOhmicLoss=(1-(OhmicLoss/100))*WTGPowerAfterWake;
    
    WTGPowerAfterTransLoss=(1-(TransLoss/100))*WTGPowerAfterOhmicLoss;
    
    WTGPowerGrid=WTGPowerAfterTransLoss;
    
    
end

WTGPower=WTGPowerAfterWake;

WTGOhmicLossP= (OhmicLoss/100)*WTGPowerAfterWake;

WTGTransLossP= (TransLoss/100)*WTGPowerAfterOhmicLoss;

end

