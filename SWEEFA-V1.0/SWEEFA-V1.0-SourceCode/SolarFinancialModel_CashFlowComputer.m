function [CashFlow_Computed]=SolarFinancialModel_CashFlowComputer(Revenue_Computed,DebtServicing_Computed,Depreciation_Computed,OperationalExpenditure_Computed,WorkingCapital_Computed,CorporateTax_ROI_Percent,MinAlternateTax_ROI_Percent,AD_Years,DiscountForCalculation_Percent,Int_Loan_ROI_Percent,DebtFraction_Percent,TotalProjectCost,ProjectLife,SL,AD)

%% Creating Arrays for Computed Variables

Year=zeros(1,(ProjectLife+1));

CF_RevSaleNet=zeros(1,(ProjectLife+1));

CF_OpEx=zeros(1,(ProjectLife+1));

EBITDA=zeros(1,(ProjectLife+1));

CF_DepAmt=zeros(1,(ProjectLife+1));

EBIT=zeros(1,(ProjectLife+1));

CF_IntAmt=zeros(1,(ProjectLife+1));

CF_WCIntAmt=zeros(1,(ProjectLife+1));

EBT=zeros(1,(ProjectLife+1));

EBITDA=zeros(1,(ProjectLife+1));

CF_AppTax=zeros(1,(ProjectLife+1));

CF_TaxAmt=zeros(1,(ProjectLife+1));

PAT=zeros(1,(ProjectLife+1));

CF_ProjectCost=zeros(1,(ProjectLife+1));

CF_OpEx=zeros(1,(ProjectLife+1));

CF_PrjCashFlow=zeros(1,(ProjectLife+1));

CF_PrjIRR=zeros(1,(ProjectLife+1));

CF_PrjNPV=zeros(1,(ProjectLife+1));

CF_EquInterest=zeros(1,(ProjectLife+1));

CF_NetIntAmt=zeros(1,(ProjectLife+1));

CF_TaxAmt=zeros(1,(ProjectLife+1));

CF_AnPrinAmt=zeros(1,(ProjectLife+1));

CF_EquInvest=zeros(1,(ProjectLife+1));

CF_PrinCashFlow=zeros(1,(ProjectLife+1));

CF_EquityIRR=zeros(1,(ProjectLife+1));

CF_EquityNPV=zeros(1,(ProjectLife+1));

CF_NetOpIncome=zeros(1,(ProjectLife+1));

CF_DebtService=zeros(1,(ProjectLife+1));

CF_DebtRatio=zeros(1,(ProjectLife+1));

CF_AvgDebtRatio=zeros(1,(ProjectLife+1));

%% Getting Required Computed Values from previous functions

% From Revenue Computation Function

Rev_NetSalePower=Revenue_Computed{1,5};

% From Debt Servicing Computation Function

Year=0:ProjectLife;

AnPrinAmt=DebtServicing_Computed{1,2};

Int_With_VGF=DebtServicing_Computed{1,5};

% From Depreciation Computation Function

if (SL==1)    
    
   Depreciation_Computed_SL=Depreciation_Computed{1,1};
   
   SL_DepAmt=Depreciation_Computed_SL{1,3};
    
elseif (AD==1)    
    
    Depreciation_Computed_AD=Depreciation_Computed{1,2};
    
    AD_DepAmt=Depreciation_Computed_AD{1,3};
    
end

% From Operational Expenditure Computation Function

OpEx_NetExpense=OperationalExpenditure_Computed{1,3};

% From Working Capital Computation Function

WC_Int=WorkingCapital_Computed{1,5};

%% Computing each Variable

% Year Variable Computation

Year=0:ProjectLife;

% Computing Cash Flow Revenue

CF_RevSaleNet=Rev_NetSalePower;

% Computing Cash Flow Net Operational Expenditure

CF_OpEx=(-1)*(OpEx_NetExpense);

% Computing Cash Flow EBITDA

EBITDA=CF_RevSaleNet+CF_OpEx;

% Computing Cash Flow Depreciation Amount

if (SL==1)
    
    CF_DepAmt=(-1)*(SL_DepAmt);
    
elseif (AD==1)
    
    CF_DepAmt=(-1)*(AD_DepAmt);
    
end

% Computing Cash Flow EBIT

EBIT=EBITDA+CF_DepAmt;

% Cash Flow Interest on Debt

CF_IntAmt=(-1)*(Int_With_VGF);

% Computing Cash Flow Interest on Working Capital

CF_WCIntAmt=(-1)*(WC_Int);

% Computing Cash Flow EBT

EBT=EBIT+CF_IntAmt+CF_WCIntAmt;

% Computing Cash Flow Applicable TAX Rate

for i=2:(ProjectLife+1)
    
   if (Year(1,i)<=AD_Years)
       
       CF_AppTax(1,i)=MinAlternateTax_ROI_Percent;
       
   elseif (Year(1,i)>AD_Years)
       
       CF_AppTax(1,i)=CorporateTax_ROI_Percent;
       
   end
    
end

% Computing Cash Flow Tam Amount

CF_TaxAmt=(-1)*EBT.*CF_AppTax*(1/100);

% Computing Cash Flow PAT

PAT=EBT+CF_TaxAmt;

% Computing Cash Flow Project Cost

CF_ProjectCost(1,1)=(-1)*(TotalProjectCost);
    
% Computing Net Cash Flow

CF_PrjCashFlow(1,1)=CF_ProjectCost(1,1);

for i=2:(ProjectLife+1)
    
    CF_PrjCashFlow(1,i)=CF_RevSaleNet(1,i)+CF_OpEx(1,i);
    
end

% Computing Cash Flow Project NPV

[NPV]=NPV_Finance_Calculator(CF_PrjCashFlow,Int_Loan_ROI_Percent,ProjectLife);

CF_PrjNPV(1,1)=NPV;

% Computing Cash Flow Project IRR

[IRR]=IRR_Finance_Calculator(CF_PrjCashFlow,ProjectLife);

CF_PrjIRR(1,1)=IRR;

% Computing Cash Flow Equity Invested

for i=1:(ProjectLife+1)

    if (i==1)
        
        CF_EquInvest(1,i)=(-1)*(TotalProjectCost).*(1-(DebtFraction_Percent/100));

        
    elseif (i~=1)
        
        CF_EquInvest(1,i)=0;

        
    end

end

% Computing Cash Flow Net Interest Amount

CF_NetIntAmt=CF_IntAmt+CF_WCIntAmt;

% Computing Cash Flow Annual Principal Amount

CF_AnPrinAmt=(-1)*(AnPrinAmt);

% Computing principal after Cash Flow

CF_PrinCashFlow=CF_EquInvest+CF_RevSaleNet+CF_OpEx+CF_NetIntAmt+CF_TaxAmt+CF_AnPrinAmt;

% Computing Cash Flow Project NPV

[NPV]=NPV_Finance_Calculator(CF_PrinCashFlow,Int_Loan_ROI_Percent,ProjectLife);

CF_EquityNPV(1,1)=NPV;

% Computing Cash Flow Project IRR

[IRR]=IRR_Finance_Calculator(CF_PrinCashFlow,ProjectLife);

CF_EquityIRR(1,1)=IRR;

% Computing Cash Flow Net Operational Income

CF_NetOpIncome=CF_RevSaleNet+CF_OpEx+CF_WCIntAmt+CF_TaxAmt;

% Computing Cash Flow Debt Service

CF_DebtService=(-1)*(AnPrinAmt)+(-1)*(Int_With_VGF);

% Computing Cash Flow Debt Ratio

CF_DebtService1=(-1)*CF_DebtService;

for i=2:(ProjectLife+1)
    
   if (CF_DebtService1(1,i)>0.001)
       
       CF_DebtRatio(1,i)=(CF_NetOpIncome(1,i)/CF_DebtService1(1,i));
       
   elseif (CF_DebtService1(1,i)<=0.001)
       
       CF_DebtRatio(1,i)=0;
       
   end
    
end

% Computing Cash Flow Average Debt Ratio

count=0; 

Total=0;

for i=2:(ProjectLife+1)
    
   if (CF_DebtRatio(1,i)<=0)
       
       continue;
       
   else
       
       count=count+1;
       
       Total=Total+CF_DebtRatio(1,i);
       
   end
    
end

CF_AvgDebtRatio(1,1)=Total/count;

% Creating Cell Array for All Computed Values

CashFlow_Computed={CF_RevSaleNet,CF_OpEx,EBITDA,CF_DepAmt,EBIT,CF_IntAmt,EBT,CF_AppTax,CF_TaxAmt,PAT,CF_ProjectCost,CF_PrjCashFlow,CF_PrjIRR,CF_PrjNPV,CF_EquInvest,CF_NetIntAmt,CF_AnPrinAmt,CF_PrinCashFlow,CF_EquityIRR,CF_EquityNPV,CF_NetOpIncome,CF_DebtService,CF_DebtRatio,CF_AvgDebtRatio};

end

