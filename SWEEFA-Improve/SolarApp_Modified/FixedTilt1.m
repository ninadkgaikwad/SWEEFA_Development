function [ CosAngle ] = FixedTilt1( beta,phi,theta_t,phic )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

CosAngle=(cos((pi/180)*(beta))*cos((pi/180)*(phi-phic))*sin((pi/180)*(tilt)))+(sin((pi/180)*(beta))*cos((pi/180)*(tilt))); % Incidence Angle

end

