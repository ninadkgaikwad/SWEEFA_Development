function [GHIavg, Area] = GHIGauSinAvg( INso,Sr,Ss,Indi,HHres )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[ GHIgau,Area,h,xx,m ] = GHIGaussianDistri( INso,Sr,Ss,Indi,HHres );

[ GHIsin] = GHISinusoidalDistri(INso,Sr,Ss,Indi,HHres);

GHIavg=(GHIgau+GHIsin)/2;

Sum=0;

for j=1:length(xx)
    
Sum=Sum+(GHIavg(1,j));

end

% Area=Sum*m;
% 
% 
% figure;
% grid on;
% plot(xx,GHIavg)
% xlabel('Time (Hrs)')
% ylabel('GHI (kW/m^(2))')
% title('Gaussian & Sinusoidal Average Distribution of GHI for given Daily - Insolation')

end

