function [ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindSpeed, cutin, cutout )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if ((WindSpeed<cutin)||(WindSpeed>=cutout))
    
    WTGPowerPoint=0;
    
else

    PowerCurve_WindSpeeds=PowerCurve(:,1); % Getting Power Curve Wind Speed Vector

    PowerCurve_PowerPoints=PowerCurve(:,2); % Getting Power Curve Power Point Vector
    
%     PowerCurve_Res=PowerCurve_WindSpeeds(2,1)-PowerCurve_WindSpeeds(1,1); % Resolution of Power Curve File in terms of Windspeed
%     
%     PowerCurve_ResHalf=PowerCurve_Res/2;
    
    for i=1:length(PowerCurve_WindSpeeds)
        
        Diffrence1(i,1)=abs(WindSpeed-PowerCurve_WindSpeeds(i,1));
        
        Diffrence2(i,1)=WindSpeed-PowerCurve_WindSpeeds(i,1);
        
    end
    
    [Min, Index]=min(Diffrence1);
    
    Indicator=Diffrence2(Index,1);
    
    for i=1:(length(PowerCurve_WindSpeeds)-1)
        
    PowerCurve_Res1(i,1)=PowerCurve_WindSpeeds(i+1,1)-PowerCurve_WindSpeeds(i,1); % Resolution of Power Curve File in terms of Windspeed
    
    PowerCurve_ResHalf1(i,1)=PowerCurve_Res1(i,1)/2;
        
    end    
    
    if (Indicator==0)
        
        PowerCurve_ResHalf=0;
        
    elseif (Indicator>0)
        
        PowerCurve_ResHalf=PowerCurve_ResHalf1(Index,1);
        
    elseif (Indicator<0)
        
        PowerCurve_ResHalf=PowerCurve_ResHalf1(Index-1,1);        
        
    end
    
    if (Min==0)
        
        WTGPowerPoint=PowerCurve_PowerPoints(Index,1);
        
    elseif (Min==PowerCurve_ResHalf)
        
        in1=Index;
        
        in2=Index+1;  
        
        WTGPowerPoint=PowerCurve_PowerPoints(in1,1)+((WindSpeed-PowerCurve_WindSpeeds(in1,1))*((PowerCurve_PowerPoints(in2,1)-PowerCurve_PowerPoints(in1,1))/(PowerCurve_WindSpeeds(in2,1)-PowerCurve_WindSpeeds(in1,1)))) ;
        
    elseif((Min<PowerCurve_ResHalf)&&(Indicator>0))
        
        in1=Index;
        
        in2=Index+1; 
        
        WTGPowerPoint=PowerCurve_PowerPoints(in1,1)+((WindSpeed-PowerCurve_WindSpeeds(in1,1))*((PowerCurve_PowerPoints(in2,1)-PowerCurve_PowerPoints(in1,1))/(PowerCurve_WindSpeeds(in2,1)-PowerCurve_WindSpeeds(in1,1)))) ;

        
    elseif ((Min<PowerCurve_ResHalf)&&(Indicator<0))
        
        in1=Index-1;
        
        in2=Index;   
        
        WTGPowerPoint=PowerCurve_PowerPoints(in1,1)+((WindSpeed-PowerCurve_WindSpeeds(in1,1))*((PowerCurve_PowerPoints(in2,1)-PowerCurve_PowerPoints(in1,1))/(PowerCurve_WindSpeeds(in2,1)-PowerCurve_WindSpeeds(in1,1)))) ;

        
    end

    if ((WTGPowerPoint<0) || (isnan(WTGPowerPoint)))
        
        WTGPowerPoint=0;
        
    else
        
        WTGPowerPoint=WTGPowerPoint;
        
    end
    
end



end

