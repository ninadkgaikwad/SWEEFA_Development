function [ AirDen ] = AirDensity( Pressure, Temperature)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

P=Pressure;
T=Temperature+273.15;

MW=28.97;
R=8.2056*10^(-5);

AirDen=(P*MW*10^(-3))/(R*T);

end

