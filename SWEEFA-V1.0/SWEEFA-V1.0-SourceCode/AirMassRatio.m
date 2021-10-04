function [ m ] = AirMassRatio( beta )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
len=length(beta);

for i=1:len
    
    m(1,i)=(1/sin(beta(1,i)*(pi/180)));
end


end

