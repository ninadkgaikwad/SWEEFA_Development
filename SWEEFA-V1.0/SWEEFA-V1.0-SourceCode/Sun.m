function [hp,ha,beta,phi,Sr,Ss ] = Sun(n,L,HHres)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% Use it only for one day

Hres=(HHres/60);

d=Declination(n);

l=L;

[Sr,Ss,Indi]=SunRiseSet(L,d);

len=length(Sr);

hp=zeros(1,24/Hres);

 figure;
 hold on;

for i=1:len
    
    if Indi(1,i)==1
        
        hp=0:Hres:24;
        
    elseif Indi(1,i)==-1
        
        hp=0:Hres:24;
        
    elseif Indi(1,i)==0

        hp=Sr(1,i):Hres:Ss(1,i);        
               
    end
    
    ha=HourAngle(hp);

    [beta,phi]=AltiAzi(d(1,i),L,ha(1,:));
    
   
    
    plot(phi(1,:),beta(1,:));

    xlabel('Solar Azimuth Angle (Degrees)')
    ylabel('Solar Elevation Angle (Degrees)')
    title('Sunpath Diagram')

    %    hp=zeros(1,288);
    
   % hp=zeros(1,24/Hres);
end



end


