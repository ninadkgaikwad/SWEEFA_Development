function [ GHIIndex ,hh,diffrence,I] = GHIHHresIndex( n,hp,HHres )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

[ hr,minn,sec ] = DeciToHM( hp ); % To get minutes part of hp

H=60/HHres;

hh=0:HHres:60;

len=length(hh);

for i=1:(len-1)
    
    diffrence(1,i)=abs(minn-hh(1,i));
    
end

[M,I]=min(diffrence);


GHIIndex=((24*H)*(n-1))+((floor(hp))*(H))+ (I);
  
  
end

