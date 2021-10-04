function [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SeasonalTilt( n,L,Ib,Id,C,beta,phi,tilt,tiltsummer,tiltwinter,phic,rho )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
if (n>=60)&&(n<=181)&&(L>=0) % It is summer in the northern hemisphere
    
    tiltactual=tiltsummer;
    
elseif (n>=182)&&(n<=304)&&(L>=0) % It is middle period in the northern hemisphere
    
    tiltactual=tilt;
    
elseif (((n>=305)&&(n<=366))||((n>=1)&&(n<=59)))&&(L>=0) % It is winter in northern hemisphere
    
    tiltactual=tiltwinter;
    
elseif (n>=60)&&(n<=181)&&(L<0) % It is winter in the southern hemisphere
    
    tiltactual=tiltwinter;
    
elseif (n>=182)&&(n<=304)&&(L<0) % It is middle period in the southern hemisphere
    
    tiltactual=tilt;
    
elseif (((n>=305)&&(n<=366))||((n>=1)&&(n<=59)))&&(L<0) % It is summer in southern hemisphere
    
    tiltactual=tiltsummer;
    
end
    

CosInciAngle=(cos((pi/180)*(beta))*cos((pi/180)*(phi-phic))*sin((pi/180)*(tiltactual)))+(sin((pi/180)*(beta))*cos((pi/180)*(tiltactual))); % Incidence Angle

Ibc=Ib*CosInciAngle; % Beam Component on Collector

Idc=Id*((1+cos((pi/180)*(tiltactual)))/(2)); % Diffused Component on Collector

Irc=rho*Ib*(sin((pi/180)*(beta))+C)*((1-cos((pi/180)*(tiltactual)))/(2)); % Reflected Component on the Collector

Ic=Ibc+Idc+Irc; % Total Solar Irradiance on the collector

end

