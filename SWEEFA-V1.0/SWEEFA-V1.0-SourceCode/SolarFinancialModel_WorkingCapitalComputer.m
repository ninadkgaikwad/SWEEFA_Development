function [WorkingCapital_Computed]=SolarFinancialModel_WorkingCapitalComputer(OperationalExpenditure_Computed,Revenue_Computed,OM_NumMonths,EnergyCharges_NumMonths,OM_Spares_Percent,WC_Int_Percent,ProjectLife)

%% Creating Arrays for Computed Variables

Year=zeros(1,(ProjectLife+1));

WC_OM=zeros(1,(ProjectLife+1));

WC_Energy=zeros(1,(ProjectLife+1));

WC_Spares=zeros(1,(ProjectLife+1));

WC_Total=zeros(1,(ProjectLife+1));

WC_Int=zeros(1,(ProjectLife+1));

%% Getting Required Computed Values from previous functions

OpEx_NetExpense=OperationalExpenditure_Computed{1,3};

Rev_SalePower=Revenue_Computed{1,4};

%% Computing Each Variable

% Year Variable Computation

Year=0:ProjectLife;

% Computing Working Capital from O&M Expenses

WC_OM=OM_NumMonths*OpEx_NetExpense*(1/12);

% Computing Energy Charges 

WC_Energy=EnergyCharges_NumMonths*Rev_SalePower*(1/12);

% Computing Waorking Capital from Spares

WC_Spares=OpEx_NetExpense*(1/100)*OM_Spares_Percent;

% Computing Total Working Capital

WC_Total=WC_OM+WC_Energy+WC_Spares;

% Computing Working Capital Interest

WC_Int=WC_Total*(1/100)*WC_Int_Percent;

% Creating a Cell Array for All Computed Values

WorkingCapital_Computed={WC_OM,WC_Energy,WC_Spares,WC_Total,WC_Int};

end

