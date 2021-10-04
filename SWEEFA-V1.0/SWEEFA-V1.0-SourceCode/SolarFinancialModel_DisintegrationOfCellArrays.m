%% Disintegrating Cell Arrays for all Variables of the Financial Model

% Getting Desired GUI Workspace

SolarFinancialModule_Inputs_GUI=getappdata(0,'SolarFinancialModule_Inputs_GUI');

% Getting Cell Arrays from respective GUI Workspaces

FinancialParameters=getappdata(SolarFinancialModule_Inputs_GUI,'FinancialParameters');

FinancialParameters_Computed=getappdata(SolarFinancialModule_Inputs_GUI,'FinancialParameters_Computed');

% Disintegrating Financial Parameters Cell Array

PlantInfo=FinancialParameters{1,1};

ProjectCostComputations=FinancialParameters{1,2};

OperationAndMaintenanceInfo=FinancialParameters{1,3};

PlantPerformanceParamters=FinancialParameters{1,4};

LoanAndInsuranceParameters=FinancialParameters{1,5};

WorkingCapitalParameters=FinancialParameters{1,6};

DepreciationInfo=FinancialParameters{1,7};

% Disintegrating Financial Parameters Computed Cell Array

Revenue_Computed=FinancialParameters_Computed{1,1};

DebtServicing_Computed=FinancialParameters_Computed{1,2};

Depreciation_Computed=FinancialParameters_Computed{1,3};

OperationalExpenditure_Computed=FinancialParameters_Computed{1,4};

WorkingCapital_Computed=FinancialParameters_Computed{1,5};

CashFlow_Computed=FinancialParameters_Computed{1,6};

ProjectLife=FinancialParameters_Computed{1,7};

%% Disintegrating Cell Array for Input Sheet Variables

% Disintegrating PlantInfo Cell Array 

PlantCapacity=PlantInfo{1,1};

UnitEPCCost=PlantInfo{1,2};

LandRequirement=PlantInfo{1,3};

LandCost=PlantInfo{1,4};

UnitOtherCosts_Percent=PlantInfo{1,5};

FeedInTariff=PlantInfo{1,6};

% Disintegrating ProjectCostComputations Cell Array

UnitLandCost=ProjectCostComputations{1,1};

UnitOtherCosts=ProjectCostComputations{1,2};

UnitDevelopmentCost=ProjectCostComputations{1,3};

TotalProjectCost=ProjectCostComputations{1,4};

% Disintegrating OperationAndMaintenanceInfo Cell Array 

OM_Cost_Percent=OperationAndMaintenanceInfo{1,1};

OM_Escalation_Percent=OperationAndMaintenanceInfo{1,2};

% Disintegrating PlantPerformanceParamters Cell Array 

CUF_Percent=PlantPerformanceParamters{1,1};

AnnualPerformance_Percent=PlantPerformanceParamters{1,2};

AuxConsp_Percent=PlantPerformanceParamters{1,3};

ProjectLife=PlantPerformanceParamters{1,4};

% Disintegrating LoanAndInsuranceParameters Cell Array 

DebtFraction_Percent=LoanAndInsuranceParameters{1,1};

LoanTenure=LoanAndInsuranceParameters{1,2};

MoratoriumPeriod=LoanAndInsuranceParameters{1,3};

Int_Loan_ROI_Percent=LoanAndInsuranceParameters{1,4};

InsuranceCost_Percent=LoanAndInsuranceParameters{1,5};

% Disintegrating WorkingCapitalParameters Cell Array 

OM_NumMonths=WorkingCapitalParameters{1,1};

EnergyCharges_NumMonths=WorkingCapitalParameters{1,2};

OM_Spares_Percent=WorkingCapitalParameters{1,3};

WC_Int_Percent=WorkingCapitalParameters{1,4};

% Disintegrating DepreciationInfo Cell Array

SL=DepreciationInfo{1,1};

AD=DepreciationInfo{1,2};

FirstYearSegment=DepreciationInfo{1,3};

FirstYearSegment_ROI_Percent=DepreciationInfo{1,4};

NextYearSegment=DepreciationInfo{1,5};

NextYearSegment_ROI_Percent=DepreciationInfo{1,6};

AD_ROI_Percent=DepreciationInfo{1,7};

CorporateTax_ROI_Percent=DepreciationInfo{1,8};

MinAlternateTax_ROI_Percent=DepreciationInfo{1,9};

AD_Years=DepreciationInfo{1,10};

DiscountForCalculation_Percent=DepreciationInfo{1,11};

%% Disintegrating Cell Array for Revenue Sheet Variables

Eg=Revenue_Computed{1,1};

AuxConsp=Revenue_Computed{1,2};

NetEg=Revenue_Computed{1,3};

Rev_SalePower=Revenue_Computed{1,4};

Rev_NetSalePower=Revenue_Computed{1,5};

Rev_Net=Revenue_Computed{1,6};

%% Disintegrating Cell Array for Debt Servicing Sheet Variables

OpenBalance=DebtServicing_Computed{1,1};

AnPrinAmt=DebtServicing_Computed{1,2};

CloseBal=DebtServicing_Computed{1,3};

Int_Without_VGF=DebtServicing_Computed{1,4};

Int_With_VGF=DebtServicing_Computed{1,5};

Repayment_Without_VGF=DebtServicing_Computed{1,6};

Repayment_With_VGF=DebtServicing_Computed{1,7};

%% Disintegrating Cell Array for Depreciation Sheet Variables

% Disintegrating Depreciation_Computed Cell Array

Depreciation_Computed_SL=Depreciation_Computed{1,1};

Depreciation_Computed_AD=Depreciation_Computed{1,2};

% Disintegrating Depreciation_Computed_SL Cell Array

SL_OpenAmt=Depreciation_Computed_SL{1,1};

SL_DepRate=Depreciation_Computed_SL{1,2};

SL_DepAmt=Depreciation_Computed_SL{1,3};

SL_CloseBal=Depreciation_Computed_SL{1,4};

% Disintegrating Depreciation_Computed_SL Cell Array

AD_Amt=Depreciation_Computed_AD{1,1};

AD_DepRate=Depreciation_Computed_AD{1,1};

AD_DepAmt=Depreciation_Computed_AD{1,1};

AD_CloseBal=Depreciation_Computed_AD{1,1};

%% Disintegrating Cell Array for Operational Expenditure Sheet Variables

OpEx_Cost=OperationalExpenditure_Computed{1,1};

OpEx_Insurance=OperationalExpenditure_Computed{1,2};

OpEx_NetExpense=OperationalExpenditure_Computed{1,3};

%% Disintegrating Cell Array for Working Capital Sheet Variables

WC_OM=WorkingCapital_Computed{1,1};

WC_Energy=WorkingCapital_Computed{1,2};

WC_Spares=WorkingCapital_Computed{1,3};

WC_Total=WorkingCapital_Computed{1,4};

WC_Int=WorkingCapital_Computed{1,5};

%% Disintegrating Cell Array for Cash Flow Sheet Variables

CF_RevSaleNet=CashFlow_Computed{1,1};

CF_OpEx=CashFlow_Computed{1,2};

EBITDA=CashFlow_Computed{1,3};

CF_DepAmt=CashFlow_Computed{1,4};

EBIT=CashFlow_Computed{1,5};

CF_IntAmt=CashFlow_Computed{1,6};

EBT=CashFlow_Computed{1,7};

CF_AppTax=CashFlow_Computed{1,8};

CF_TaxAmt=CashFlow_Computed{1,9};

PAT=CashFlow_Computed{1,10};

CF_ProjectCost=CashFlow_Computed{1,11};

CF_PrjCashFlow=CashFlow_Computed{1,12};

CF_PrjIRR=CashFlow_Computed{1,13};

CF_PrjNPV=CashFlow_Computed{1,14};

CF_EquInvest=CashFlow_Computed{1,15};

CF_NetIntAmt=CashFlow_Computed{1,16};

CF_AnPrinAmt=CashFlow_Computed{1,17};

CF_PrinCashFlow=CashFlow_Computed{1,18};

CF_EquityIRR=CashFlow_Computed{1,19};

CF_EquityNPV=CashFlow_Computed{1,20};

CF_NetOpIncome=CashFlow_Computed{1,21};

CF_DebtService=CashFlow_Computed{1,22};

CF_DebtRatio=CashFlow_Computed{1,23};

CF_AvgDebtRatio=CashFlow_Computed{1,24};
