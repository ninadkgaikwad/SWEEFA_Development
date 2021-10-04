function [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SingleAxisNS(Ib,Id,C,beta,phi,phic,tiltmin,tiltmax,rho )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

betamax=90-tiltmin;
betamin=90-tiltmax;


if (beta>=betamin)&&(beta<=betamax)% Acts as Single Axis N-S Tracker
    
    CosInciAngle=((cos((pi/180)*(beta)))*(cos((pi/180)*(phi-phic)))*(sin((pi/180)*(90-beta))))+(sin((pi/180)*(beta))*cos((pi/180)*(90-beta))); % Incidence Angle

    Ibc=Ib*CosInciAngle; % Beam Component on Collector

    Idc=Id*(((1+(cos((pi/180)*(90-beta))))/(2))); % Diffused Component on Collector

    Irc=rho*Ib*(sin((pi/180)*(beta))+C)*(((1+(cos((pi/180)*(90-beta))))/(2))); % Reflected Component on the Collector

    Ic=Ibc+Idc+Irc; % Total Solar Irradiance on the collector
    
elseif beta>betamax % Acts as Fixed Tilt
    
    CosInciAngle=(cos((pi/180)*(beta))*cos((pi/180)*(phi-phic))*sin((pi/180)*(90-betamax)))+(sin((pi/180)*(beta))*cos((pi/180)*(90-betamax))); % Incidence Angle

    Ibc=Ib*CosInciAngle; % Beam Component on Collector

   % Idc=Id*(((1+(cos((pi/180)*(90-betamax))*cos((pi/180)*(phic))))/(2))); % Diffused Component on Collector
   
    Idc=Id*(((1+(cos((pi/180)*(90-betamax))))/(2))); % Diffused Component on Collector

   % Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-(cos((pi/180)*(90-betamax))*cos((pi/180)*(phic))))/(2)); % Reflected Component on the Collector

    Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-(cos((pi/180)*(90-betamax))))/(2)); % Reflected Component on the Collector 
   
    Ic=Ibc+Idc+Irc; % Total Solar Irradiance on the collector
    
elseif beta<betamin % Acts as Fixed Tilt
    
    CosInciAngle=(cos((pi/180)*(beta))*cos((pi/180)*(phi-phic))*sin((pi/180)*(90-betamin)))+(sin((pi/180)*(beta))*cos((pi/180)*(90-betamin))); % Incidence Angle

    Ibc=Ib*CosInciAngle; % Beam Component on Collector

    %Idc=Id*(((1+(cos((pi/180)*(90-betamin))*cos((pi/180)*(phic))))/(2))); % Diffused Component on Collector
    
    Idc=Id*(((1+(cos((pi/180)*(90-betamin))))/(2))); % Diffused Component on Collector

    %Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-(cos((pi/180)*(90-betamin))*cos((pi/180)*(phic))))/(2)); % Reflected Component on the Collector

    Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-(cos((pi/180)*(90-betamin))))/(2)); % Reflected Component on the Collector
    
    Ic=Ibc+Idc+Irc; % Total Solar Irradiance on the collector
    
end

end
