function [ WakeWindSpeed,Ct,Dwake,Udef ] = JensenWakeEffect( a,RotorRadius,x,k, WindSpeed )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

r=RotorRadius;
U=WindSpeed;

Ct=(4*a)*(1-a);

s=x/(2*r);

Dwake=(2*r)*(1+(2*k*s));

Udef=U*((1-sqrt(1-Ct))/(1+(2*k*s))^(2));

WakeWindSpeed=U-Udef;

end

