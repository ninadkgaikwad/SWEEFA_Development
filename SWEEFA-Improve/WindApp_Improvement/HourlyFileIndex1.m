function [ HourlyIndex ] = HourlyFileIndex1( Day,Time)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

HourlyIndex=ceil(Time)+((Day-1)*(24));

end

