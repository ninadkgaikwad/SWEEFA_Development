function [ PowerNew ] = PowerCurveCorrection( PowerSTC,DenSTC,DenNew )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

PowerNew=(DenNew/DenSTC)*(PowerSTC);


end

