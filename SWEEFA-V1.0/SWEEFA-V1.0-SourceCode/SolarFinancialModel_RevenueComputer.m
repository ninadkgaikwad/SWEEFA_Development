function [Revenue_Computed]=SolarFinancialModel_RevenueComputer(PlantCapacity,CUF_Percent,AnnualPerformance_Percent,AuxConsp_Percent,FeedInTariff,ProjectLife)

%% Creating Arrays for Computed Variables

Year=zeros(1,(ProjectLife+1));

Eg=zeros(1,(ProjectLife+1));

AuxConsp=zeros(1,(ProjectLife+1));

NetEg=zeros(1,(ProjectLife+1));

Rev_SalePower=zeros(1,(ProjectLife+1));

Rev_NetSalePower=zeros(1,(ProjectLife+1));

Rev_Net=zeros(1,(ProjectLife+1));

%% Computing each Variable

% Year Variable Computation

Year=0:ProjectLife;

% Energy Generation [Eg] Computation 

Eg(1,2)= PlantCapacity*24*365*CUF_Percent*(1/100)*(1/1000);

for i=3:(ProjectLife+1)

    Eg(1,i)=Eg(1,(i-1))*(1-(AnnualPerformance_Percent*(1/100)));

end

% Auxiliary Consumption [AuxConsp] Computation

AuxConsp=Eg*AuxConsp_Percent*(1/100);

% Net Energy [NetEg] Computation

NetEg=Eg-AuxConsp;

% Sale of Power Revenue [Rev_SalePower] Computation

Rev_SalePower=NetEg*FeedInTariff*(1/10);

% Net Sale of Power Revenue [Rev_NetSalePower] Computation

Rev_NetSalePower=Rev_SalePower; % Revion in Future

% Net Revenue [Rev_Net] Comutation

Rev_Net=Rev_NetSalePower; % Revion in Future

% Creating a CellArray for all Computed Values

Revenue_Computed={Eg,AuxConsp,NetEg,Rev_SalePower,Rev_NetSalePower,Rev_Net};


end

