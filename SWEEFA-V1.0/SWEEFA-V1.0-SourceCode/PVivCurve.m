function [ V,I,P,Pmax ,V1,I1,P1,Pmaxmn,Vocg,Vocg1,Iog1,Iscn,Vmax,Iog] = PVivCurve(CellorMod,Vo,Is,Vm,Im,Pm,Kv,Ki,U,Ns,Np,Tn,Gn,T,G )
%UNTITLED13 Summary of this function goes here
% Vocn = Open Circuit Voltage (V)
% Iscn = Short Circuit Current (A)
% Vmpn = MPP Voltage (V)
% Impn = MPP Current (I)
% Pmen = MPP Power (W)
% Kv = Voc Temperature Co-efficient
% Ki = Isc Temperature Co-efficient
% Kp = Pme Temperature Co-efficient
% a = Diode Ideality Factor ranges from, 1<=a<=1.5
% U = 1, if Temp Co-effs are in Units/Degree; U = 2, if Temp Co-effs are in Percent/Degree 
% Ns = Number of cells in series in a Module
% Np = Number of strings of Ns cells in parallel
% Tn = Standard Experiment Temperature (Degree Celsius)
% Gn = Standard Experiment Insolation (W/m^(2))
% T = Temperature (Degree Celsius)
% G = Experiment Insolation (W/m^(2))
%   Detailed explanation goes here

if CellorMod==1 % Input Values are of a Module
    
    Vocn=Vo;
    Iscn=Is;
    Vmpn=Vm;
    Impn=Im;
    Pmen=Vm*Im;
    
elseif CellorMod==2 % Input Values are of a Cell
    
    Vocn=Ns*Vo;
    Iscn=Np*Is;
    Vmpn=Ns*Vm;
    Impn=Np*Im;
    Pmen=Vm*Im;
    
end

% Calling Function PVRsRp to find the RS and Rp at Standard Conditions
[ Rs,Rp,Voc,Isc,Vmp,Imp,Pme,Rpmin,Rsmax,Kii,Kvv,Tk,Tkn,Vt,Vtn,a,Tol,Er,V1,I1,P1,Pmaxmn,Vocg1,Iog1 ] = PVRsRp(Vocn,Iscn,Vmpn,Impn,Pm,Kv,Ki,U,Ns,Tn,Gn,T,G );


% Calculating Reverse Saturation Current for Diode 
     
Tdel = Tk - Tkn;
Isc_ = (  Iscn + Kii*Tdel  );
Voc_ = (  Vocn + Kvv*Tdel  );

Ipv_ = (Rs+Rp)/Rp * Isc_; 

Io = (Ipv_ - Voc_/Rp)/(exp(Voc_/Vt/a/Ns)-1); % Io depends only on the temperature



%  Temperature and irradiation effect on the current

Ipvn = (Rs+Rp)/Rp * Isc_;         % Nominal light-generated current
Ipv = (Ipvn + Kii*Tdel) *G/Gn;       % Actual light-generated current 
     

% Solving the I-V equation for several (V,I) pairs 
clear V
clear I

n= 100;

V = 0:Voc/n:Voc;  % Voltage vector
I = zeros(1,size(V,2));    % Current vector

for j = 1 : size(V,2) %Calculates for all voltage values 
    
  % Solves g = I - f(I,V) = 0 with Newton-Raphson
  
  g(j) = Ipv-Io*(exp((V(j)+I(j)*Rs)/Vt/Ns/a)-1)-(V(j)+I(j)*Rs)/Rp-I(j);
  
  while (abs(g(j)) > 0.001)
      
  g(j) = Ipv-Io*(exp((V(j)+I(j)*Rs)/Vt/Ns/a)-1)-(V(j)+I(j)*Rs)/Rp-I(j);
  glin(j) = -Io*Rs/Vt/Ns/a*exp((V(j)+I(j)*Rs)/Vt/Ns/a)-Rs/Rp-1;
  I_(j) = I(j) - g(j)/glin(j);
  I(j) = I_(j);   
  
  end  

end


P = (Ipv-Io*(exp((V+I.*Rs)/Vt/Ns/a)-1)-(V+I.*Rs)/Rp).*V;
  
  [Pmax,jj] = max(P);
  Vmax=V(jj);
  Iog=I(jj);
  
%To find Graphical Voc
for mm=1:length(I)
    
    Vocg=V(mm);
    
    if I(mm)<=0
        
        break;
        
    else
        
        continue;
        
    end
    
end

% PROGRAM ENDS HERE

% V;
% %% PLOTING 
%  
%  % I-V curve
%  figure(3) 
%  grid on
%  hold on 
%  title('Adjusted I-V curve');
%  xlabel('V [V]');
%  ylabel('I [A]');
%  xlim([0 inf]);
%  ylim([0 inf]);
%  plot(V,I,'LineWidth',2,'Color','g') %
%  %Plots the "remarkable points" on the I x V curve
%   plot([0 V(jj) Vocg],[max(I) I(jj) 0],'o','LineWidth',2,'MarkerSize',5,'Color','k')
%   
%  % P-V curve
%  figure(4) 
%  grid on
%  hold on 
%  title('Adjusted P-V curve');
%  xlabel('V [V]');
%  ylabel('P [W]');
%  xlim([0 inf]);
%  ylim([0 inf]);
%  plot(V,V.*I,'LineWidth',2,'Color','g') %
%   %Plots the "remarkable points" on the power curve
%   plot([0 V(jj) Vocg],[0 Pmax 0],'o','LineWidth',2,'MarkerSize',5,'Color','k')
%   
% disp(sprintf('Method 1 - complete model At Given Conditions\n'));
% disp(sprintf(' Rp_min = %f',Rpmin));
% disp(sprintf('     Rp = %f',Rp));
% disp(sprintf(' Rs_max = %f',Rsmax));
% disp(sprintf('     Rs = %f',Rs));
% disp(sprintf('      a = %f',a));
% disp(sprintf('      T = %f',Tk-273.15));
% disp(sprintf('      G = %f',G));
% %disp(sprintf(' Pmax,m = %f  (model)',Pmaxm));
% disp(sprintf(' Pmax,e = %f  (experimental)',Pme));
% disp(sprintf('    tol = %f',Tol));
% disp(sprintf('P_error = %f',Er));
% disp(sprintf('    Ipv = %f',Ipv));
% disp(sprintf('    Isc = %f',Isc));
% disp(sprintf('    Ion = %g',Io));
% disp(sprintf('\n\n'));
end

