function [ Pressure ] = PressureAtHeight( Height )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Constant=-1.185*10^(-4);

C=Constant;

Pressure=exp(C*Height);

end

