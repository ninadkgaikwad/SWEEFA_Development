function [ PlantPerfVector,ModulePerfMatrix ] = PvPlantPerformance( EArrayMod,EPgridMod,EArray,EPgrid,TotPlaneInso,ModuleTemperature,DayNum,EnergyConverter,ModTemCF, PlantCapacity,Pmod,ModNum )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Computing weighted average of ModtemCF

len=length(ModTemCF);

Weighted_ModTemCF_Numerator=0;

Weighted_ModTemCF_Denominator=0;

for i=1:len
    
   Weighted_ModTemCF_Numerator= Weighted_ModTemCF_Numerator + (ModNum(1,i)*ModTemCF(1,i));
   
   Weighted_ModTemCF_Denominator= Weighted_ModTemCF_Denominator + ModNum(1,i);
    
end

Weighted_ModTemCF= Weighted_ModTemCF_Numerator/Weighted_ModTemCF_Denominator;

Weighted_ModTemCFF=Weighted_ModTemCF/100;

ModTemCFF=ModTemCF/100;

% Computing Average Module Temperature

lenTemp=length(ModuleTemperature);

TotalTemp=sum(ModuleTemperature);

AvgModTemp=TotalTemp/lenTemp;

% Computing total Solar Energy Incident on Plant [kWh/m^(2)]

GHITot=sum(TotPlaneInso);

GHI=(GHITot/1000)*EnergyConverter;

% Computing Module Specific Capacity

ModCapacity=(Pmod.*ModNum)/1000;

% Performace Analysis of Different PV Modules

ModulePerfMatrix=zeros(11,len);

for i=1:len

    Yf=EPgridMod(i,1)/(ModCapacity(1,i)*1000); % Final Yeild 1000 is divided to make EPgrid in KWh
    Yr=GHI; % Reference Yeild
    Ya=EArrayMod(i,1)/(ModCapacity(1,i)*1000); % Array Yeild 1000 is divided to make EArrayMod in KWh
    Yt=Yr*(1+(ModTemCFF(1,i)*(AvgModTemp-25))); % Temperature Corrected Reference Yeild
    Lct=Yr-Yt; % Thermal Capture Loss
    Lc=Yr-Ya; % Array Capture Loss
    Lcm=Lc-Lct; % Miscelleneous Capture Losses
    Ls=Ya-Yf; % System Loss
    Pr=Yf/Yr; % Performance Ratio
    Cuf=EPgridMod(i,1)/(ModCapacity(1,i)*(24*DayNum)); % Capacity Utilization Factor
    PrTemp=Pr/(1-(ModTemCFF(1,i)*(AvgModTemp-25))); % Temperature Corrected Performance Ratio  
    
    ModulePerfMatrix(:,i)=[Yf;Yr;Ya;Yt;Lct;Lc;Lcm;Ls;Pr;Cuf;PrTemp];
    
end

% Performance Analysis of Entire Plant

YYf=EPgrid/PlantCapacity; % Final Yeild
YYr=GHI; % Reference Yeild
YYa=EArray/PlantCapacity; % Array Yeild
YYt=YYr*(1+(Weighted_ModTemCFF*(AvgModTemp-25))); % Temperature Corrected Reference Yeild
LLct=YYr-YYt; % Thermal Capture Loss
LLc=YYr-YYa; % Array Capture Loss
LLcm=LLc-LLct; % Miscelleneous Capture Losses
LLs=YYa-YYf; % System Loss
PPr=YYf/YYr; % Performance Ratio
CCuf=EPgrid/(PlantCapacity*(24*DayNum)); % Capacity Utilization Factor
PPrTemp=PPr/(1-(Weighted_ModTemCFF*(AvgModTemp-25))); % Temperature Corrected Performance Ratio

PlantPerfVector=[YYf;YYr;YYa;YYt;LLct;LLc;LLcm;LLs;PPr;CCuf;PPrTemp];

end

