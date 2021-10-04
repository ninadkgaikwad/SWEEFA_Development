function [ GHI,Area, A] = GHISinusoidalDistri(INso,Sr,Ss,Indi,HHres)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
Hres=(60/HHres);

m=1/Hres;

hh=0:m:24;

len1=length(hh);


if Indi==0||Indi==1
    
    if Indi==0;
    
       D=Ss-Sr;
       
       div=D*Hres;
       
       m=pi/div;
       
       ts=0:m:pi;
       
       A=((INso)/2);
       
       tt=length(ts);

        GHI=zeros(1,tt);

        for i=1:tt
            
            GHI(1,i)=A*sin(((2*pi)/(2*pi))*ts(1,i));
            
        end

       
       xx=ts*(D/pi)+Sr;
       
    end
    
    if Indi==1
        
        D=24;
        
        div=D*Hres;
        
        m=pi/div;
        
        ts=0:m:pi;
        
        A=((INso)/2);
        
        tt=length(ts);

        GHI=zeros(1,tt);

        for i=1:tt
            
            GHI(1,i)=A*sin(((2*pi)/(2*pi))*ts(1,i));
            
        end
       
             
        xx=ts*(D/pi)
       
    end
     
   
elseif Indi==-1
    
    GHI=zeros(1,len1);
    
    xx=hh;
    
    A=0;
   
    
end

Sum=0;

for j=1:length(xx)
    
Sum=Sum+(GHI(1,j));

end

% Area=Sum*m;
% 
% figure;
% grid on;
% plot(xx,GHI)
% xlabel('Time (Hrs)')
% ylabel('GHI (kW/m^(2))')
% title('Sinusoidal Distribution of GHI for given Daily - Insolation')

end

