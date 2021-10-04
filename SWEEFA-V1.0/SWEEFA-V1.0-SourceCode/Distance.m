function [ d ] = Distance( n )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
len=length(n);

for i=1:len
    
    d(1,i)=(1.5*10^(8))*(1+(0.17*sin((360/365)*(n(1,i)-93)*(pi/180))));
    
end


end

