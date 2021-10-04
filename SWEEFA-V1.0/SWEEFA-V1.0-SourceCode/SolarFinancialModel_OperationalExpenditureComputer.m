function [OperationalExpenditure_Computed]=SolarFinancialModel_OperationalExpenditureComputer(TotalProjectCost,OM_Cost_Percent,OM_Escalation_Percent,InsuranceCost_Percent,ProjectLife)

%% Creating Arrays for Computed Variables

Year=zeros(1,(ProjectLife+1));

OpEx_Cost=zeros(1,(ProjectLife+1));

OpEx_Insurance=zeros(1,(ProjectLife+1));

OpEx_NetExpense=zeros(1,(ProjectLife+1));

%% Computing each Variable

% Year Variable Computation

Year=0:ProjectLife;

% Computing O&M Cost

OpEx_Cost(1,2)=TotalProjectCost*(1/100)*OM_Cost_Percent;

for i=3:(ProjectLife+1)
    
   OpEx_Cost(1,i)=OpEx_Cost(1,(i-1))*(1+((1/100)*OM_Escalation_Percent)); 
    
end

% Computing Insurance Cost

for i=2:(ProjectLife+1)

   OpEx_Insurance(1,i)=TotalProjectCost*(1/100)*InsuranceCost_Percent;

end

% Computing Net Expense

OpEx_NetExpense=OpEx_Cost+OpEx_Insurance;

% Creating Cell Array for All Compued Values

OperationalExpenditure_Computed={OpEx_Cost,OpEx_Insurance,OpEx_NetExpense};

