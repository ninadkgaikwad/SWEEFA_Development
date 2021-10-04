function [ GHI,Area,h ] = GHIGaussianDistri( INso,Sr,Ss,Indi,HHres )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
Hres=(60/HHres);

m=1/Hres;

hh=0:m:24;

len1=length(hh);

if Indi==0||Indi==1
    
    if Indi==0;
    
       D=Ss-Sr;
       
       dd=D/2;
       
       SD=D/6;
       
       h=((INso/0.997)*(1/sqrt(2*pi)))/(SD);        
     
       
       %m=0.001;
       
       x = 0:m:D;
       
       GHI= h*gaussmf(x,[SD dd]);
       
       xx=x+Sr;
       
    end
    
    if Indi==1
        
        D=24;
        
        dd=D/2;
       
       SD=D/6;
       
       h=((INso/0.997)*(1/sqrt(2*pi)))/(SD);

                           
       %m=0.001;
       
       x = 0:m:D;
                    
       GHI = h*gaussmf(x,[SD dd]);
       
       xx=hh;
       
    end
     
   
elseif Indi==-1
    
    GHI=zeros(1,len1);
    
    xx=hh;
    
    h=0;
    
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
% title('Gaussian Distribution of GHI for given Daily - Insolation')

end

