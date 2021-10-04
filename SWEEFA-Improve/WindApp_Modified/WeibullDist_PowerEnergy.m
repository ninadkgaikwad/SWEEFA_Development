function [ v,H,Hhour,Prmc,Ermc,Ptur,Etur,Ecurve,DenSTC ] = WeibullDist_PowerEnergy( yr,mr,WRes,k,YrWs,YrTemp,MrWs,MrTemp,months,Altitude,LpYear,NLpYear )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Computing Pressure at location altitude
[ Pressure ] = PressureAtHeight( Altitude );

% Yearly or Monthly Data

if(yr==1)
    
    % Computing Air Density at Location
    
    Temp=YrTemp;
    
    [ DenSTC ] = AirDensity( Pressure, Temp);
    
    hours=8760;
    
    Vmean=YrWs;
    
    % Computing Scale Factor
    
    c=(2/(sqrt(pi)))*Vmean;
    
    % Creating Wind Speed Vector
    
    dv=WRes;
    
    v=0:dv:(Vmean*2.5);

    lenV=length(v);
    
    % Computing Weibull Equation
    
    H=(k/c)*((v/c).^(k-1)).*(exp(-(v/c).^(k)));
    
    Hhour=hours*H;
    
    % Computing Root Mean Cube Speed
    
    VrmcWeibull=(sum((H.*(v.^(3)))*dv))^(1/3);
    
    Vrmc=VrmcWeibull;
    
    % Wind Power/Energy Density of Site

    Prmc=((1/2)*(DenSTC)*(Vrmc^(3)))/1000; % kW/m^(2)

    Ermc=hours*(Prmc); % Wh/m^(2)

    % Wind Turbine Power/Energy Density at Site

    Ptur=(0.5)*((1/2)*(DenSTC)*(Vrmc^(3)))/1000; % kW/m^(2)

    Etur=hours*(Ptur); % Wh/m^(2)    
    
    % Wind Power/Energy Density Curve of Site

    Ecurve=((1/2)*(DenSTC)*((v).^(3).*(Hhour))); % Wh/m^(2)
    
    Ecurve=Ecurve/1000; % kWh/m^(2)
    
elseif (mr==1)
    
    % Computing Hours, Mean Temp and Mean Ws using an external function
    
    [ hours, Vmean, Tmean ] = Month_Hours_MeanTemp_MeanWs( months,MrWs,MrTemp,LpYear,NLpYear );
    
    % Computing Air Density at Location
    
    Temp=Tmean;
    
    [ DenSTC ] = AirDensity( Pressure, Temp);
    
    hours=hours;
    
    Vmean=Vmean;
    
    % Computing Scale Factor
    
    c=(2/(sqrt(pi)))*Vmean;
    
    % Creating Wind Speed Vector
    
    dv=WRes;
    
    v=0:dv:(Vmean*2.5);

    lenV=length(v);
    
    % Computing Weibull Equation
    
    H=(k/c)*((v/c).^(k-1)).*(exp(-(v/c).^(k)));
    
    Hhour=hours*H;
    
    % Computing Root Mean Cube Speed
    
    VrmcWeibull=(sum((H.*(v.^(3)))*dv))^(1/3);
    
    Vrmc=VrmcWeibull;
    
    % Wind Power/Energy Density of Site

    Prmc=((1/2)*(DenSTC)*(Vrmc)^(3))/1000; % kW/m^(2)

    Ermc=hours*(Prmc); % Wh/m^(2)

    % Wind Turbine Power/Energy Density at Site

    Ptur=(0.5)*((1/2)*(DenSTC)*(Vrmc^(3)))/1000; % kW/m^(2)

    Etur=hours*(Ptur); % kWh/m^(2)    
    
    % Wind Power/Energy Density Curve of Site

    Ecurve=((1/2)*(DenSTC)*((v).^(3).*(Hhour))); % Wh/m^(2)
    
    Ecurve=Ecurve/1000; % kWh/m^(2)    
    
end
    

end

