function [FinancialParameters_Computed]=SolarFinancialModel_Computer(FinancialParameters)

%% Decomposition of Variables

% Decomposing Variable Cell Array FinancialParameters
PlantInfo=FinancialParameters{1,1};

ProjectCostComputations=FinancialParameters{1,2};

OperationAndMaintenanceInfo=FinancialParameters{1,3};

PlantPerformanceParamters=FinancialParameters{1,4};

LoanAndInsuranceParameters=FinancialParameters{1,5};

WorkingCapitalParameters=FinancialParameters{1,6};

DepreciationInfo=FinancialParameters{1,7};

% Decomposing Variable List PlantInfo
PlantCapacity=PlantInfo(1,1);

UnitEPCCost=PlantInfo(1,2);

LandRequirement=PlantInfo(1,3);

LandCost=PlantInfo(1,4);

UnitOtherCosts_Percent=PlantInfo(1,5);

FeedInTariff=PlantInfo(1,6);

% Decomposing Variable List ProjectCostComputations
UnitLandCost=ProjectCostComputations(1,1);

UnitOtherCosts=ProjectCostComputations(1,2);

UnitDevelopmentCost=ProjectCostComputations(1,3);

TotalProjectCost=ProjectCostComputations(1,4);

% Decomposing Variable List OperationAndMaintenanceInfo
OM_Cost_Percent=OperationAndMaintenanceInfo(1,1);

OM_Escalation_Percent=OperationAndMaintenanceInfo(1,2);

% Decomposing Variable List PlantPerformanceParamters
CUF_Percent=PlantPerformanceParamters(1,1);

AnnualPerformance_Percent=PlantPerformanceParamters(1,2);

AuxConsp_Percent=PlantPerformanceParamters(1,3);

ProjectLife=PlantPerformanceParamters(1,4);

% Decomposing Variable List LoanAndInsuranceParameters
DebtFraction_Percent=LoanAndInsuranceParameters(1,1);

LoanTenure=LoanAndInsuranceParameters(1,2);

MoratoriumPeriod=LoanAndInsuranceParameters(1,3);

Int_Loan_ROI_Percent=LoanAndInsuranceParameters(1,4);

InsuranceCost_Percent=LoanAndInsuranceParameters(1,5);

% Decomposing Variable List WorkingCapitalParameters
OM_NumMonths=WorkingCapitalParameters(1,1);

EnergyCharges_NumMonths=WorkingCapitalParameters(1,2);

OM_Spares_Percent=WorkingCapitalParameters(1,3);

WC_Int_Percent=WorkingCapitalParameters(1,4);

% Decomposing Variable List DepreciationInfo
SL=DepreciationInfo(1,1);

AD=DepreciationInfo(1,2);

FirstYearSegment=DepreciationInfo(1,3);

FirstYearSegment_ROI_Percent=DepreciationInfo(1,4);

NextYearSegment=DepreciationInfo(1,5);

NextYearSegment_ROI_Percent=DepreciationInfo(1,6);

AD_ROI_Percent=DepreciationInfo(1,7);

CorporateTax_ROI_Percent=DepreciationInfo(1,8);

MinAlternateTax_ROI_Percent=DepreciationInfo(1,9);

AD_Years=DepreciationInfo(1,10);

DiscountForCalculation_Percent=DepreciationInfo(1,11);

%% Revenue Computations

% Calling External Function for Revenue Computations
[Revenue_Computed]=SolarFinancialModel_RevenueComputer(PlantCapacity,CUF_Percent,AnnualPerformance_Percent,AuxConsp_Percent,FeedInTariff,ProjectLife);

%% Debt-Servicing Computations

% Calling External Function for Revenue Computations
[DebtServicing_Computed]=SolarFinancialModel_DebtServicingComputer(TotalProjectCost,DebtFraction_Percent,LoanTenure,MoratoriumPeriod,Int_Loan_ROI_Percent,ProjectLife);

%% Depreciation Computations

% Calling External Function for Revenue Computations
[Depreciation_Computed]=SolarFinancialModel_DepreciationComputer(SL,AD,PlantCapacity,UnitEPCCost,FirstYearSegment,FirstYearSegment_ROI_Percent,NextYearSegment,NextYearSegment_ROI_Percent,AD_ROI_Percent,AD_Years,ProjectLife);

%% Operational Expenditure Computations

% Calling External Function for Revenue Computations
[OperationalExpenditure_Computed]=SolarFinancialModel_OperationalExpenditureComputer(TotalProjectCost,OM_Cost_Percent,OM_Escalation_Percent,InsuranceCost_Percent,ProjectLife);

%% Working Capital Computations

% Calling External Function for Revenue Computations
[WorkingCapital_Computed]=SolarFinancialModel_WorkingCapitalComputer(OperationalExpenditure_Computed,Revenue_Computed,OM_NumMonths,EnergyCharges_NumMonths,OM_Spares_Percent,WC_Int_Percent,ProjectLife);

%% Cash Flow Computations

% Calling External Function for Revenue Computations
[CashFlow_Computed]=SolarFinancialModel_CashFlowComputer(Revenue_Computed,DebtServicing_Computed,Depreciation_Computed,OperationalExpenditure_Computed,WorkingCapital_Computed,CorporateTax_ROI_Percent,MinAlternateTax_ROI_Percent,AD_Years,DiscountForCalculation_Percent,Int_Loan_ROI_Percent,DebtFraction_Percent,TotalProjectCost,ProjectLife,SL,AD);

%% Creating a Cell Array of Connected Parameters

FinancialParameters_Computed={Revenue_Computed,DebtServicing_Computed,Depreciation_Computed,OperationalExpenditure_Computed,WorkingCapital_Computed,CashFlow_Computed,ProjectLife};

end

