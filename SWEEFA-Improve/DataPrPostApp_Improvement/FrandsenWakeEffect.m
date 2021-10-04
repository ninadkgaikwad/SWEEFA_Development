function [ WakeWindSpeed,Ct,Beta,Dwake,Udef ] = FrandsenWakeEffect(a,RotorRadius,x,k,alpha, WindSpeed )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

r=RotorRadius;
U=WindSpeed;

Ct=(4*a)*(1-a);

D=2*r;

s=x/D;

Beta=(1+sqrt(1-Ct))/(alpha*sqrt(1-Ct));

Dwake=D*((Beta^(k/2))+(alpha*s))^(1/k);

Rwake=Dwake/2;

A=pi*r^(2);

Awake=pi*Rwake^(2);

if a<=0.5

    Udef=(0.5*U)*(1+sqrt(1-(2*(A/Awake)*Ct)));

elseif a>0.5
    
   
    Udef=(0.5*U)*(1-sqrt(1-(2*(A/Awake)*Ct)));
    
end

WakeWindSpeed=U-Udef;

end

