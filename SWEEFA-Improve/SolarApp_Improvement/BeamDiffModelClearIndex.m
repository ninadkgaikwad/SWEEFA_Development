function [ Ib, Id ,C,A] = BeamDiffModelClearIndex( n,beta,ClearIndex,DiffIndex )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
 m=(1/sin((pi/180)*beta)); % Air Mass Ratio
 
 A=1160+(75*sin((pi/180)*(360/365)*(n-275))); % Apparent Extra-Terrestrial Flux
 
 k=0.174+(0.035*sin((pi/180)*(360/365)*(n-100))); % k is Dimensionless factor for Optical Depth

 C=0.095+(0.04*sin((pi/180)*(360/365)*(n-100))); % Sky-Diffuse Factor
 
 Ib=ClearIndex*(A*exp(-k*m));
 
 Id=(1+DiffIndex)*(C*Ib);
 
end

