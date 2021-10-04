function [VV1,VV2,I,P1,Pmax1,Pmax2,P2,Vocgg,Vocg,Vmax1,Vmax2 ,Imax1,Imax2 ] = PV_IV_Shading  (CellorMod,Vo,Is,Vm,Im,Pm,Kv,Ki,U,Ns,Np,shaded,CellsPerByD,BypassDV,Tn,Gn,T,G )
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
[ Rs,Rp,Voc,Isc,Vmp,Imp,Pme,Rpmin,Rsmax,Kii,Kvv,Tk,Tkn,Vt,Vtn,a,Tol,Er,V1,I1,P3,Pmaxmn,Vocg1 ] = PVRsRp(Vocn,Iscn,Vmpn,Impn,Pm,Kv,Ki,U,Ns,Tn,Gn,T,G );


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

% Calculating Cell Rs and Rp from Module Rs and Rp
    Vocn=Vo/Ns;
    Iscn=Is/Np;
    Vmpn=Vm/Ns;
    Impn=Im/Np;
    Pmen=(Vm*Im)/(Ns*Np);
    
% Calling PVRsRpSingleCell to calculate Rs and Rp for a single cell    
    
    [ Rss,Rpp,V2,I2,P4,Pmax3 ] = PVRsRpSingleCell(Vocn,Iscn,Vmpn,Impn,Pm,Kv,Ki,U,Ns,Tn,Gn,T,G );

  
% Calculating Shading Effect Without Bypass Diode
VV1=(((Ns-shaded)/Ns).*V)-(((Rpp+Rss)*shaded*(1/Np)).*I);

if CellsPerByD==0
    
% Calculating Shading Effect Without Bypass Diode
VV2=(((Ns-shaded)/Ns).*V)-(((Rpp+Rss)*shaded*(1/Np)).*I);

elseif CellsPerByD>0

 % Calculating Number of Bypass Diodes
 kk=shaded/CellsPerByD;
 %kk=CellsPerByD/shaded;
   if kk==0       
       BYP=0;       
   else       
        BYP=ceil(kk);       
   end         
 
    
% Calculating Shading Effect Without Bypass Diode
%VV2=(((Ns-shaded)/Ns).*V)-(BYP*BypassDV);
VV2=(((Ns-(BYP*CellsPerByD))/Ns).*V)-(BYP*BypassDV);

end

% Calculating Power for Shading
P1 = (Ipv-Io*(exp((VV1+I.*Rs)/Vt/Ns/a)-1)-(VV1+I.*Rs)/Rp).*VV1;
  
  [Pmax1,jj] = max(P1);
  Vmax1=VV1(jj);
  Imax1=I(jj);
  
% Calculating Power for Bypass Diode
P2 = (Ipv-Io*(exp((VV2+I.*Rs)/Vt/Ns/a)-1)-(VV2+I.*Rs)/Rp).*VV2;
  
  [Pmax2,hh] = max(P2);
  Vmax2=VV2(hh);
  Imax2=I(hh);
  
%To find Graphical Voc
for mm=1:length(I)
    
    Vocg=VV1(mm);
    
    if I(mm)<=0
        
        break;
        
    else
        
        continue;
        
    end
    
end

%To find Graphical Voc
for nn=1:length(I)
    
    Vocgg=VV2(nn);
    
    if I(nn)<=0
        
        break;
        
    else
        
        continue;
        
    end
    
end

% PROGRAM ENDS HERE


% %% PLOTTING FOR SHADING
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
%  plot(VV1,I,'LineWidth',2,'Color','r') %
%  %Plots the "remarkable points" on the I x V curve
%  plot([0 VV1(jj) Vocg],[max(I) I(jj) 0],'o','LineWidth',2,'MarkerSize',5,'Color','k')
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
%  plot(VV1,VV1.*I,'LineWidth',2,'Color','r') %
%   %Plots the "remarkable points" on the power curve
%   plot([0 VV1(jj) Vocg],[0 Pmax1 0],'o','LineWidth',2,'MarkerSize',5,'Color','k')
%   
% %% PLOTTING FOR BYPASS DIODE  
%   % I-V curve
%  figure(3) 
%  grid on
%  hold on 
%  title('Adjusted I-V curve');
%  xlabel('V [V]');
%  ylabel('I [A]');
%  xlim([0 inf]);
%  ylim([0 inf]);
%  plot(VV2,I,'LineWidth',2,'Color','b') %
%  %Plots the "remarkable points" on the I x V curve
%   plot([0 VV2(hh) Vocgg],[max(I) I(hh) 0],'o','LineWidth',2,'MarkerSize',5,'Color','k')
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
%  plot(VV2,VV2.*I,'LineWidth',2,'Color','b') %
%   %Plots the "remarkable points" on the power curve
%   plot([0 VV2(hh) Vocgg],[0 Pmax2 0],'o','LineWidth',2,'MarkerSize',5,'Color','k')
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

