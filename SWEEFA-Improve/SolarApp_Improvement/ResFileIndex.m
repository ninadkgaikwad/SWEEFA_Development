function [Index]= ResFileIndex(DayCounter,T,Res)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% Computing DayPoints

DayPoints=24*(60/Res);

% Creating Time Vector for one day depending on the Simulation Resolution

Time=0:(1/(60/Res)):24;

TimeCorrect=Time(1,1:(length(Time)-1));

% FOR LOOP for finding the Minimum Difference between T and TimeCorrect

for i=1:length(TimeCorrect)
    
   Diffrence(1,i)=abs(T-TimeCorrect(1,i)); 
    
end

[M,I] = min(Diffrence); % M=Minimum Value; I=Index of Minimum Value

Index=I+(DayPoints*(DayCounter-1));

end

