function [ V2 ] = HubHeight_Terrain_EffectOnWindSpeed( V1,H1,H2,alpha )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

V2=V1*(H2/H1)^(alpha);


end

