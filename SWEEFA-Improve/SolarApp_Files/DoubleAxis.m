function [ Ic,Ibc,Idc,Irc,CosInciAngle ] = DoubleAxis( Ib,Id,C,phi,phicmin,phicmax,tiltmin,tiltmax,beta,rho  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
betamax=90-tiltmin;
betamin=90-tiltmax;

if ((phi<=phicmax)&&(phi>=phicmin))&& ((beta>=betamin)&&(beta<=betamax)) % Acts as a Double Axix Tracker
    
 CosInciAngle=1;   

Ibc=Ib;

Idc=Id*((1-cos((pi/180)*(90-beta)))/(2));

Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-cos((pi/180)*(90-beta)))/(2)); 

Ic=Ibc+Idc+Irc;

elseif ((phi>phicmax)||(phi<phicmin))&& ((beta<betamin)||(beta>betamax))% Acts as a Fixed Tilt with an Azimuth
    
    if phi>phicmax
        phiactual=phicmax;
    elseif phi<phicmin
        phiactual=phicmin;
    end
    if beta>betamax
        betaactual=betamax;
    elseif beta<betamin
        betaactual=betamin;
    end
    
    
    CosInciAngle=(cos((pi/180)*(beta))*cos((pi/180)*(phi-phiactual))*sin((pi/180)*(90-betaactual)))+(sin((pi/180)*(beta))*cos((pi/180)*(90-betaactual))); % Incidence Angle

    Ibc=Ib*CosInciAngle; % Beam Component on Collector

    Idc=Id*((1+(cos((pi/180)*(90-betaactual))*cos((pi/180)*(phiactual))))/(2)); % Diffused Component on Collector

    Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-(cos((pi/180)*(90-betaactual))*cos((pi/180)*(phiactual))))/(2)); % Reflected Component on the Collector

    Ic=Ibc+Idc+Irc; % Total Solar Irradiance on the collector
    
elseif ((phi<=phicmax)&&(phi>=phicmin))&& ((beta<betamin)||(beta>betamax)) % Acts as a Single Axis EW Tracker
    
    if beta>betamax
        betaactual=betamax;
    elseif beta<betamin
        betaactual=betamin;
    end
    
    CosInciAngle=(cos((pi/180)*(beta))*sin((pi/180)*(90-betaactual)))+(sin((pi/180)*(beta))*cos((pi/180)*(90-betaactual))); % Incidence Angle

    Ibc=Ib*CosInciAngle; % Beam Component on Collector

    Idc=Id*(((1+(cos((pi/180)*(90-betaactual))*cos((pi/180)*(phi))))/(2))); % Diffused Component on Collector

    Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-(cos((pi/180)*(90-betaactual))*cos((pi/180)*(phi))))/(2)); % Reflected Component on the Collector

    Ic=Ibc+Idc+Irc; % Total Solar Irradiance on the collector
    
elseif ((beta>=betamin)&&(beta<=betamax)) && ((phi>phicmax)||(phi<phicmin))
    
     if phi>phicmax
        phiactual=phicmax;
    elseif phi<phicmin
        phiactual=phicmin;
     end
    
    CosInciAngle=((cos((pi/180)*(beta)))*(cos((pi/180)*(phi-phiactual)))*(sin((pi/180)*(90-beta))))+(sin((pi/180)*(beta))*cos((pi/180)*(90-beta))); % Incidence Angle

    Ibc=Ib*CosInciAngle; % Beam Component on Collector

    Idc=Id*(((1+(cos((pi/180)*(90-beta))))/(2))); % Diffused Component on Collector

    Irc=rho*Ib*(sin((pi/180)*(beta))+C)*(((1+(cos((pi/180)*(90-beta))))/(2))); % Reflected Component on the Collector

    Ic=Ibc+Idc+Irc; % Total Solar Irradiance on the collector
    
end

