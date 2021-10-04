function [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SingleAxisEW(Ib,Id,C,beta,phi,phicmin,phicmax,tilt,rho )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

if (phi<=phicmax)&&(phi>=phicmin)% Acts as Single Axis E-W Tracker
    
    CosInciAngle=(cos((pi/180)*(beta))*sin((pi/180)*(tilt)))+(sin((pi/180)*(beta))*cos((pi/180)*(tilt))); % Incidence Angle

    Ibc=Ib*CosInciAngle; % Beam Component on Collector

    Idc=Id*(((1+(cos((pi/180)*(tilt))*cos((pi/180)*(phi))))/(2))); % Diffused Component on Collector

    Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-(cos((pi/180)*(tilt))*cos((pi/180)*(phi))))/(2)); % Reflected Component on the Collector

    Ic=Ibc+Idc+Irc; % Total Solar Irradiance on the collector
    
elseif phi>phicmax % Acts as Fixed Tilt
    
    CosInciAngle=(cos((pi/180)*(beta))*cos((pi/180)*(phi-phicmax))*sin((pi/180)*(tilt)))+(sin((pi/180)*(beta))*cos((pi/180)*(tilt))); % Incidence Angle

    Ibc=Ib*CosInciAngle; % Beam Component on Collector

    Idc=Id*(((1+(cos((pi/180)*(tilt))*cos((pi/180)*(phicmax))))/(2))); % Diffused Component on Collector

    Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-(cos((pi/180)*(tilt))*cos((pi/180)*(phicmax))))/(2)); % Reflected Component on the Collector

    Ic=Ibc+Idc+Irc; % Total Solar Irradiance on the collector
    
elseif phi<phicmin % Acts as Fixed Tilt
    
    CosInciAngle=(cos((pi/180)*(beta))*cos((pi/180)*(phi-phicmin))*sin((pi/180)*(tilt)))+(sin((pi/180)*(beta))*cos((pi/180)*(tilt))); % Incidence Angle

    Ibc=Ib*CosInciAngle; % Beam Component on Collector

    Idc=Id*(((1+(cos((pi/180)*(tilt))*cos((pi/180)*(phicmin))))/(2))); % Diffused Component on Collector

    Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-(cos((pi/180)*(tilt))*cos((pi/180)*(phicmin))))/(2)); % Reflected Component on the Collector

    Ic=Ibc+Idc+Irc; % Total Solar Irradiance on the collector
    
end

end

