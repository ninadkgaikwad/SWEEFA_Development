function [ GearRatio ] = GearRatio_Calculator( RotorSpeed, Poles, Freq )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

TurbineSpeed=RotorSpeed; % Rated Turbine Speed in rpm

GeneratorSpeed=(120*Freq)/Poles; % Generator Speed in rpm at rated Frequency (Hz)

GearRatio=(GeneratorSpeed/TurbineSpeed); % GearRatio [GR=Nt/Ng=Wg/Wt]

end

