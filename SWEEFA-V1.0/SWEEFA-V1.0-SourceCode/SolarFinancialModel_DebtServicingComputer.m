function [DebtServicing_Computed]=SolarFinancialModel_DebtServicingComputer(TotalProjectCost,DebtFraction_Percent,LoanTenure,MoratoriumPeriod,Int_Loan_ROI_Percent,ProjectLife)

%% Creating Arrays for Computed Variables

Year=zeros(1,(ProjectLife+1));

OpenBalance=zeros(1,(ProjectLife+1));

AnPrinAmt=zeros(1,(ProjectLife+1));

CloseBal=zeros(1,(ProjectLife+1));

Int_Without_VGF=zeros(1,(ProjectLife+1));

Int_With_VGF=zeros(1,(ProjectLife+1));

Repayment_Without_VGF=zeros(1,(ProjectLife+1));

Repayment_With_VGF=zeros(1,(ProjectLife+1));

%% Computing each Variable

% Year Variable Computation

Year=0:ProjectLife;

% Computing Initial Opening Balance

OpenBalance_Init=TotalProjectCost*DebtFraction_Percent*(1/100);

% Initializing the Opening Balance

OpenBalance(1,2)=OpenBalance_Init;

% Computing Anuual Principal Amount

for i=2:(ProjectLife+1)

    if (Year(1,i)<=MoratoriumPeriod)

        AnPrinAmt(1,i)=0;

    elseif (Year(1,i)<=(MoratoriumPeriod+LoanTenure))

        AnPrinAmt(1,i)=(OpenBalance_Init/LoanTenure);

    elseif ((Year(1,i)>(MoratoriumPeriod+LoanTenure))&&(Year(1,i)<=(ProjectLife)))

        AnPrinAmt(1,i)=0;

    end

end

% Computing Opening Balance and Closing Balance

for i=2:(ProjectLife+1)

CloseBal(1,i)=OpenBalance(1,i)-AnPrinAmt(1,i);

    if (i<ProjectLife)

        OpenBalance(1,i+1)=CloseBal(1,i);

    end

end

% Computing Interest without VGF

for i=2:(ProjectLife+1)

    Int_Without_VGF(1,i)=((OpenBalance(1,i)+CloseBal(1,i))/2)*(1/100)*(Int_Loan_ROI_Percent);

end

% Computing Interest with VGF

for i=2:(ProjectLife+1)

    Int_With_VGF(1,i)=((OpenBalance(1,i)+(OpenBalance(1,i)-AnPrinAmt(1,i)))/2)*(1/100)*(Int_Loan_ROI_Percent);

end

% Computing Repayment without VGF

Repayment_Without_VGF=AnPrinAmt+Int_Without_VGF;

% Computing Repayment with VGF

Repayment_With_VGF=AnPrinAmt+Int_With_VGF;

% Creating Cell Array for All compued Values

DebtServicing_Computed={OpenBalance,AnPrinAmt,CloseBal,Int_Without_VGF,Int_With_VGF,Repayment_Without_VGF,Repayment_With_VGF};

end

