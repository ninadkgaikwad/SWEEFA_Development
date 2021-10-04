function varargout = SolarFinancialModule_Results_GUI(varargin)
% SOLARFINANCIALMODULE_RESULTS_GUI MATLAB code for SolarFinancialModule_Results_GUI.fig
%      SOLARFINANCIALMODULE_RESULTS_GUI, by itself, creates a new SOLARFINANCIALMODULE_RESULTS_GUI or raises the existing
%      singleton*.
%
%      H = SOLARFINANCIALMODULE_RESULTS_GUI returns the handle to a new SOLARFINANCIALMODULE_RESULTS_GUI or the handle to
%      the existing singleton*.
%
%      SOLARFINANCIALMODULE_RESULTS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOLARFINANCIALMODULE_RESULTS_GUI.M with the given input arguments.
%
%      SOLARFINANCIALMODULE_RESULTS_GUI('Property','Value',...) creates a new SOLARFINANCIALMODULE_RESULTS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SolarFinancialModule_Results_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SolarFinancialModule_Results_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SolarFinancialModule_Results_GUI

% Last Modified by GUIDE v2.5 05-Dec-2016 14:24:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SolarFinancialModule_Results_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SolarFinancialModule_Results_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SolarFinancialModule_Results_GUI is made visible.
function SolarFinancialModule_Results_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SolarFinancialModule_Results_GUI (see VARARGIN)

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

PlantCapacity=PlantInfo(1,1);

UnitEPCCost=PlantInfo(1,2);

LandRequirement=PlantInfo(1,3);

LandCost=PlantInfo(1,4);

UnitOtherCosts_Percent=PlantInfo(1,5);

FeedInTariff=PlantInfo(1,6);

% Disintegrating ProjectCostComputations Cell Array

UnitLandCost=ProjectCostComputations(1,1);

UnitOtherCosts=ProjectCostComputations(1,2);

UnitDevelopmentCost=ProjectCostComputations(1,3);

TotalProjectCost=ProjectCostComputations(1,4);

% Disintegrating OperationAndMaintenanceInfo Cell Array 

OM_Cost_Percent=OperationAndMaintenanceInfo(1,1);

OM_Escalation_Percent=OperationAndMaintenanceInfo(1,2);

% Disintegrating PlantPerformanceParamters Cell Array 

CUF_Percent=PlantPerformanceParamters(1,1);

AnnualPerformance_Percent=PlantPerformanceParamters(1,2);

AuxConsp_Percent=PlantPerformanceParamters(1,3);

ProjectLife=PlantPerformanceParamters(1,4);

% Disintegrating LoanAndInsuranceParameters Cell Array 

DebtFraction_Percent=LoanAndInsuranceParameters(1,1);

LoanTenure=LoanAndInsuranceParameters(1,2);

MoratoriumPeriod=LoanAndInsuranceParameters(1,3);

Int_Loan_ROI_Percent=LoanAndInsuranceParameters(1,4);

InsuranceCost_Percent=LoanAndInsuranceParameters(1,5);

% Disintegrating WorkingCapitalParameters Cell Array 

OM_NumMonths=WorkingCapitalParameters(1,1);

EnergyCharges_NumMonths=WorkingCapitalParameters(1,2);

OM_Spares_Percent=WorkingCapitalParameters(1,3);

WC_Int_Percent=WorkingCapitalParameters(1,4);

% Disintegrating DepreciationInfo Cell Array

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


%% Creating Cell Arrays for all computed Variables of the Financial Model

% Creating Year Variable

Year=0:ProjectLife;

%% Cell Array for Input Sheet Variables

% Deciding Depreciation Type

if (SL==1)
    
    DepreciationType='SL';
    
elseif (AD==1)
    
    DepreciationType='AD';    
    
end

InputsSheet_TableArray=cell(41,4);

% Filling Static and Dynamic Data

InputsSheet_TableArray={'Sheet:Inputs','','','';...
    'Capacity','','','';...
    'Plant Capacity','',PlantCapacity,'MW';...
    'Capital Cost','','','';...
    'Unit EPC Cost','Rs.',UnitEPCCost,'Cr/MW';...
    'Land Cost','Rs.',LandCost,'Lacs per Acre';...
    'Land Requirement','',LandRequirement,'Acres/MW';...
    'Unit Land Cost','Rs.',UnitLandCost,'Cr/MW';...
    'Unit Other Cost','Rs.',UnitOtherCosts,'Cr/MW';...
    'Unit Development Cost','Rs.',UnitDevelopmentCost,'Cr/MW';...
    'Total Projectt Cost','Rs.',TotalProjectCost,'Cr/MW';...
    'Operation & Maintenance','','','';...
    'O&M Cost','%',OM_Cost_Percent,'of Project Cost';...
    'Escalation in O&M Cost','%',OM_Escalation_Percent,'Annually';...
    'Performance Parameters','','','';...
    'CUF','%',CUF_Percent,'';...
    'Annual Performance Deration','%',AnnualPerformance_Percent,'per Year';...
    'Auxiliary Consumption','%',AuxConsp_Percent,'of Gross Generation';...
    'Project Life','',ProjectLife,'Years';...
    'Tariff','','','';...
    'Feed-In Tariff','Rs.',FeedInTariff,'per kWh';...
    'Financial Parameters','','','';...
    'Debt Fraction','%',DebtFraction_Percent,'of the Capital Cost';...
    'Loan Tenure','',LoanTenure,'Years';...
    'Moratorium Period','',MoratoriumPeriod,'Years';...
    'Interest Rate of Loan','%',Int_Loan_ROI_Percent,'p.a.';...
    'Insurance Cost','%',InsuranceCost_Percent,'of Capital Cost';...
    'Working Capital','sum of',OM_NumMonths,'Months O&M Expense';...
    '','and',EnergyCharges_NumMonths,'Months Energy Charges';...
    '','and',OM_Spares_Percent,'% of O&M Expenses as Spares';...
    'Interest on Working Capital','%',WC_Int_Percent,'p.a.';...
    'Rate of S.l. Depreciation','%',FirstYearSegment_ROI_Percent,'for the first';...
    '','',FirstYearSegment,'Years';...
    '','and',NextYearSegment_ROI_Percent,'For the Next';...
    '','',NextYearSegment,'Years';...
    'Rate of Accelerated Depreciation','%',AD_ROI_Percent,'p.a.';...
    'Corporae Tax','',CorporateTax_ROI_Percent,'Corporate Tax Rate';...
    'Minimum Alternate Tax','',MinAlternateTax_ROI_Percent,'';...
    '','for',AD_Years,'Years';...
    'Discount Factor for Calculation','%',DiscountForCalculation_Percent,'p.a.';...
    'Depreciation','',DepreciationType,''};
    

%% Cell Array for Revenue Sheet Variables

RevenueSheet_TableArray=cell(9,(2+(ProjectLife+1)));

% Filling Static Data

RevenueSheet_TableArray(:,1:2)={'Sheet:Revenue','';...
    'Year','';...
    'Energy Generation','MU';...
    'Auxiliary Consumption','MU';...
    'Net Energy Generation','MU';...
    'Revenue','';...
    'From Sale of Power','Rs. Cr.';...
    'Net From Sale','Rs. Cr.';...
    'Net Revenue','Rs. Cr.'};
    
 % Filling Dynamic (Computed) Data   
 
 for i=1:(ProjectLife+1)
 
    RevenueSheet_TableArray(2,(i+2))={Year(1,i)};
    
    RevenueSheet_TableArray(3,(i+2))={Eg(1,i)};

    RevenueSheet_TableArray(4,(i+2))={AuxConsp(1,i)};

    RevenueSheet_TableArray(5,(i+2))={NetEg(1,i)};

    RevenueSheet_TableArray(7,(i+2))={Rev_SalePower(1,i)};

    RevenueSheet_TableArray(8,(i+2))={Rev_NetSalePower(1,i)};

    RevenueSheet_TableArray(9,(i+2))={Rev_Net(1,i)};
    
 end

%% Cell Array for Debt Servicing Sheet Variables

DebtServicingSheet_TableArray=cell(16,(2+(ProjectLife+1)));

% Filling Static Data

DebtServicingSheet_TableArray(:,1:2)={'Sheet:Debt Servicing','';...
    'Year','';...
    'Debt Servicing (Without VGF)','';...
    'Opening Balance','Rs. Cr.';...
    'Annual Principal Amount','Rs. Cr.';...
    'Closing Balance','Rs. Cr.';...
    'Interest','';...
    'Interest','Rs. Cr.';...
    'Repayment Debt+Interest','Rs. Cr.';...    
    'Debt Servicing (With VGF)','';...
    'Opening Balance','Rs. Cr.';...
    'Annual Principal Amount','Rs. Cr.';...
    'Closing Balance','Rs. Cr.';...
    'Interest','';...
    'Interest','Rs. Cr.';...
    'Repayment Debt+Interest','Rs. Cr.'};

% Filling Dynamic (Computed) Data  
 
 for i=1:(ProjectLife+1)
     
    DebtServicingSheet_TableArray(2,(i+2))={Year(1,i)};
 
    DebtServicingSheet_TableArray(4,(i+2))={OpenBalance(1,i)};

    DebtServicingSheet_TableArray(5,(i+2))={AnPrinAmt(1,i)};

    DebtServicingSheet_TableArray(6,(i+2))={CloseBal(1,i)};

    DebtServicingSheet_TableArray(8,(i+2))={Int_Without_VGF(1,i)};

    DebtServicingSheet_TableArray(9,(i+2))={Repayment_Without_VGF(1,i)};

    DebtServicingSheet_TableArray(11,(i+2))={OpenBalance(1,i)};

    DebtServicingSheet_TableArray(12,(i+2))={AnPrinAmt(1,i)};

    DebtServicingSheet_TableArray(13,(i+2))={CloseBal(1,i)};

    DebtServicingSheet_TableArray(15,(i+2))={Int_With_VGF(1,i)};

    DebtServicingSheet_TableArray(16,(i+2))={Repayment_With_VGF(1,i)};
    
 end 

%% Cell Array for Depreciation Sheet Variables

DepreciationSheet_TableArray=cell(12,(2+(ProjectLife+1)));

% Filling Static Data

DepreciationSheet_TableArray(:,1:2)={'Sheet:Depreciation','';...
    'Year','';...
    'Straight Line Depreciation','';...
    'Opening Amount','Rs. Cr.';...
    'Depreciation in %','%';...
    'Depreciation Amount','Rs. Cr.';...
    'Closing Balance','Rs. Cr.';...
    'Acceleraed Depreciation','';...
    'Accelerated Depreciation','Rs. Cr.';...
    'Depreciation in %','%';...
    'Depreciation Amount','Rs. Cr.';...
    'Closing Balance','Rs. Cr.'};

% Filling Dynamic (Computed) Data 

for i=1:(ProjectLife+1)
     
    DepreciationSheet_TableArray(2,(i+2))={Year(1,i)};
 
    DepreciationSheet_TableArray(4,(i+2))={SL_OpenAmt(1,i)};

    DepreciationSheet_TableArray(5,(i+2))={SL_DepRate(1,i)};

    DepreciationSheet_TableArray(6,(i+2))={SL_DepAmt(1,i)};
    
    DepreciationSheet_TableArray(7,(i+2))={SL_CloseBal(1,i)};
    
    DepreciationSheet_TableArray(9,(i+2))={AD_Amt(1,i)};

    DepreciationSheet_TableArray(10,(i+2))={AD_DepRate(1,i)};

    DepreciationSheet_TableArray(11,(i+2))={AD_DepAmt(1,i)};
    
    DepreciationSheet_TableArray(12,(i+2))={AD_CloseBal(1,i)};    
   
 end 

%% Cell Array for Operational Expenditure Sheet Variables

OperationalExpenditureSheet_TableArray=cell(6,(2+(ProjectLife+1)));

% Filling Static Data

OperationalExpenditureSheet_TableArray(:,1:2)={'Sheet:Operational Expenditure','';...
    'Year','';...
    'Operational Expenses','';...
    'O&M Cost','Rs. Cr.';...
    'Insurance Cost','Rs. Cr.';...
    'Net Operational Expenses','Rs. Cr.'};

% Filling Dynamic (Computed) Data 

for i=1:(ProjectLife+1)
     
    OperationalExpenditureSheet_TableArray(2,(i+2))={Year(1,i)};
    
    OperationalExpenditureSheet_TableArray(4,(i+2))={OpEx_Cost(1,i)};
 
    OperationalExpenditureSheet_TableArray(5,(i+2))={OpEx_Insurance(1,i)};

    OperationalExpenditureSheet_TableArray(6,(i+2))={OpEx_NetExpense(1,i)}; 
   
 end 

%% Cell Array for Working Capital Sheet Variables

WorkingCapitalSheet_TableArray=cell(9,(2+(ProjectLife+1)));

% Filling Static Data

WorkingCapitalSheet_TableArray(:,1:2)={'Sheet:WorkingCapital','';...
    'Year','';...
    'Working Capital','';...
    'From O&M Expenses','Rs. Cr.';...
    'From Energy Charges','Rs. Cr.';...
    'From Spares','Rs. Cr.';...
    'Totsl Working Capital','Rs. Cr.';...
    'Interest on Working Capital','';...
    'Interest on Working Capital','Rs. Cr.'};

% Filling Dynamic (Computed) Data 

for i=1:(ProjectLife+1)
     
    WorkingCapitalSheet_TableArray(2,(i+2))={Year(1,i)};
    
    WorkingCapitalSheet_TableArray(4,(i+2))={WC_OM(1,i)};
 
    WorkingCapitalSheet_TableArray(5,(i+2))={WC_Energy(1,i)};

    WorkingCapitalSheet_TableArray(6,(i+2))={WC_Spares(1,i)}; 
    
    WorkingCapitalSheet_TableArray(7,(i+2))={WC_Total(1,i)};

    WorkingCapitalSheet_TableArray(9,(i+2))={WC_Int(1,i)};    
   
 end 

%% Cell Array for Cash Flow Sheet Variables

CashFlowSheet_TableArray=cell(40,(2+(ProjectLife+1)));

% Filling Static Data

CashFlowSheet_TableArray(:,1:2)={'Sheet:Cash Flow','';...
'Year','';...
'Revenue','';...
'Revenue from Sale','Rs. Cr.';...
'Operational Expenditure','';...
'Net Operational Expenditure','Rs. Cr.';...
'EBITDA','Rs. Cr.';...
'Depreciation (Straight Line)','';...
'Depreciation','Rs. Cr.';...
'EBIT','Rs. Cr.';...
'Interest','';...
'Interest on Debt','Rs. Cr.';...
'Interest on Working Capital','Rs. Cr.';...
'EBT','Rs. Cr.';...
'Tax','';...
'Applicable Tax','%';...
'Tax Amount','Rs. Cr.';...
'PAT','Rs. Cr.';...
'Project Cash Flow','';...
'Project Cost','Rs. Cr.';...
'Revenue From Sale','Rs. Cr.';...
'Net Operational Expenditure','Rs. Cr.';...
'Net Cash Flow','Rs. Cr.';...
'Project IRR','%';...
'Project NPV','Rs. Cr.';...
'Equity Cash Flow','';...
'Equity Invested','Rs. Cr.';...
'Revenue from Sale','Rs. Cr.';...
'Net Operational Expenditure','Rs. Cr.';...
'Net Interest','Rs. Cr.';...
'Tax','Rs. Cr.';...
'Principal Payments','Rs. Cr.';...
'Cash Flow after Principal','Rs. Cr.';...
'Equity IRR','%';...
'Equity NPV','Rs. Cr.';...
'Debt Service Coverage Ratio','';...
'Net Operating Income','Rs. Cr.';...
'Debt Service','Rs. Cr.';...
'Debt Service Coverage Ratio','';...
'Average DSCR',''};

% Filling Dynamic (Computed) Data 

for i=1:(ProjectLife+1)
     
    CashFlowSheet_TableArray(2,(i+2))={Year(1,i)};
    
    CashFlowSheet_TableArray(4,(i+2))={CF_RevSaleNet(1,i)};
 
    CashFlowSheet_TableArray(6,(i+2))={CF_OpEx(1,i)};

    CashFlowSheet_TableArray(7,(i+2))={EBITDA(1,i)}; 
    
    CashFlowSheet_TableArray(9,(i+2))={CF_DepAmt(1,i)};
    
    CashFlowSheet_TableArray(10,(i+2))={EBIT(1,i)};   
    
    CashFlowSheet_TableArray(12,(i+2))={CF_IntAmt(1,i)};

    CashFlowSheet_TableArray(13,(i+2))={WC_Int(1,i)};
    
    CashFlowSheet_TableArray(14,(i+2))={EBT(1,i)};
 
    CashFlowSheet_TableArray(16,(i+2))={CF_AppTax(1,i)};

    CashFlowSheet_TableArray(17,(i+2))={CF_TaxAmt(1,i)}; 
    
    CashFlowSheet_TableArray(18,(i+2))={PAT(1,i)};

    CashFlowSheet_TableArray(20,(i+2))={CF_ProjectCost(1,i)};  
 
    CashFlowSheet_TableArray(21,(i+2))={CF_RevSaleNet(1,i)};  

    CashFlowSheet_TableArray(22,(i+2))={CF_OpEx(1,i)};  

    CashFlowSheet_TableArray(23,(i+2))={CF_PrjCashFlow(1,i)};
    
    CashFlowSheet_TableArray(24,(i+2))={CF_PrjIRR(1,i)};
 
    CashFlowSheet_TableArray(25,(i+2))={CF_PrjNPV(1,i)};

    CashFlowSheet_TableArray(27,(i+2))={CF_EquInvest(1,i)};
      
    CashFlowSheet_TableArray(28,(i+2))={CF_RevSaleNet(1,i)};  

    CashFlowSheet_TableArray(29,(i+2))={CF_OpEx(1,i)};    
    
    CashFlowSheet_TableArray(30,(i+2))={CF_NetIntAmt(1,i)};

    CashFlowSheet_TableArray(31,(i+2))={CF_AppTax(1,i)};
    
    CashFlowSheet_TableArray(32,(i+2))={CF_AnPrinAmt(1,i)}; 
    
    CashFlowSheet_TableArray(33,(i+2))={CF_PrinCashFlow(1,i)};

    CashFlowSheet_TableArray(34,(i+2))={CF_EquityIRR(1,i)};  
    
    CashFlowSheet_TableArray(35,(i+2))={CF_EquityNPV(1,i)};
    
    CashFlowSheet_TableArray(37,(i+2))={CF_NetOpIncome(1,i)};
 
    CashFlowSheet_TableArray(38,(i+2))={CF_DebtService(1,i)};

    CashFlowSheet_TableArray(39,(i+2))={CF_DebtRatio(1,i)}; 
    
    CashFlowSheet_TableArray(40,(i+2))={CF_AvgDebtRatio(1,i)};    
    
 end 

%% Cell Array for Report GUI Table 

FinancialReportSheet_TableArray=cell(145,(2+(ProjectLife+1)));

% Filling Inputs Sheet

FinancialReportSheet_TableArray(1:41,1:4)=InputsSheet_TableArray;

% Filling Revenue Sheet

FinancialReportSheet_TableArray(44:52,:)=RevenueSheet_TableArray;

% Filling Debt Servicing Sheet

FinancialReportSheet_TableArray(55:70,:)=DebtServicingSheet_TableArray;

% Filling Depreciation Sheet

FinancialReportSheet_TableArray(73:84,:)=DepreciationSheet_TableArray;

% Filling Operational Expenditure Sheet

FinancialReportSheet_TableArray(87:92,:)=OperationalExpenditureSheet_TableArray;

% Filling Working Capital Sheet

FinancialReportSheet_TableArray(95:103,:)=WorkingCapitalSheet_TableArray;

% Filling Cash Flow Sheet

FinancialReportSheet_TableArray(106:145,:)=CashFlowSheet_TableArray;

%% Initializing the Report GUI

% Initializing the Text Boxes
CF_PrjIRR1=num2str(CF_PrjIRR(1,1));
set(handles.Project_IRR,'String',CF_PrjIRR1);

CF_EquityIRR1=num2str(CF_EquityIRR(1,1));
set(handles.Equity_IRR,'String',CF_EquityIRR1);

CF_PrjNPV1=num2str(CF_PrjNPV(1,1));
set(handles.Project_NPV,'String',CF_PrjNPV1);

CF_EquityNPV1=num2str(CF_EquityNPV(1,1));
set(handles.Equity_NPV,'String',CF_EquityNPV1);

CF_AvgDebtRatio1=num2str(CF_AvgDebtRatio(1,1));
set(handles.Avg_DebtRatio,'String',CF_AvgDebtRatio1);

% Initializing the Radio Buttons

set(handles.r1,'Value',1);

set(handles.r2,'Value',0);

set(handles.r3,'Value',0);

set(handles.r4,'Value',0);

set(handles.r5,'Value',0);

% Initializing the Table Data

set(handles.Table1,'Data',FinancialReportSheet_TableArray);



%% Creating Title and Y Labels for all Computed Variables

%% Title and Y Labels for Revenue Computed Variables

% Tilte Variable

Revenue_Title={'Energy Generation','Auxiliary Consumption','Net Energy Generation','Revenue from Sale of Power','Net Revenue from Sale','Net Revenue'};

% YLabel Variable

Revenue_YLabel={'MU','MU','MU','Rs. Cr.','Rs. Cr.','Rs. Cr.'};

%% Title and Y Labels for Debt-Servicing Computed Variables

% Tilte Variable

DebtServicing_Title={'Opening Balance','Annual Principal Amount','Closing Balance','Interest without VGF','Interest with VGF','Repayment without VGF','Repayment with VGF'};

% YLabel Variable

DebtServicing_YLabel={'Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.'};

%% Title and Y Labels for Depreciation Computed Variables

% Tilte Variable

Depreciation_Title={'SL Opening Amount','SL Depreciation Rate','SL Depreciation Amount','SL Closing Balance';...
    'AD Opening Balance','AD Depreciation Rate','AD Depreciation Amount','AD Closing Balance'};

% YLabel Variable

Depreciation_YLabel={'Rs. Cr.','Percentage [%]','Rs. Cr.','Rs. Cr.'};

%% Title and Y Labels for Operational Expenditure Computed Variables

% Tilte Variable

OperationalExpenditure_Title={'O&M Cost','Insurance Cost','Net Operational Expense'};

% YLabel Variable

OperationalExpenditure_YLabel={'Rs. Cr.','Rs. Cr.','Rs. Cr.'};

%% Title and Y Labels for Working Capital Computed Variables

% Tilte Variable

WorkingCapital_Title={'WC from O&M Expenses','WC from Energy Charges','WC from Spares','Total Working Capital','Interest on Working Capital'};

% YLabel Variable

WorkingCapital_YLabel={'Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.'};

%% Title and Y Labels for Cash Flow Computed Variables

% Tilte Variable

CashFlow_Title={'CF Net Revenue from Sale','CF Net Operational Expenditure','EBITDA','CF Depreciation Amount','EBIT','Interest Amount','EBT','CF Applicable Tax Rate','CF Tax Amount','PAT','CF Project Cost','CF Project Cash Flow','CF Project IRR','CF Project NPV','CF Equity Invested','CF Net Interest Amount','CF Principal Payments','CF Cash Flow after Principal','CF Equity IRR','CF Equity NPV','CF Net Operating Income','CF Debt Service','CF Debt Ratio','CF Average Debt Ratio'};

% YLabel Variable

CashFlow_YLabel={'Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Percentage [%]','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Percentage [%]','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Percentage [%]','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.','Rs. Cr.'};

%% Combining to form Single Title and Single Ylabel Cell Array

% Single Title Cell Array

Graph_Title={Revenue_Title,DebtServicing_Title,Depreciation_Title,OperationalExpenditure_Title,WorkingCapital_Title,CashFlow_Title};

% Single YLabel Array

Graph_YLabel={Revenue_YLabel,DebtServicing_YLabel,Depreciation_YLabel,OperationalExpenditure_YLabel,WorkingCapital_YLabel,CashFlow_YLabel};


%% Intializing Global Variable for Next and Previous Buttons

global Next10

global VarLength;

global Parameter_Num;

%% Initializing the Graph

% Getting Radio Button Values

r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');
r3=get(handles.r3,'Value');
r4=get(handles.r4,'Value');
r5=get(handles.r5,'Value');
r6=get(handles.r6,'Value');

% Deciding Parameter to be plotted in accordance with the Radio Button Values

if (r1==1)
    
    Parameter_Num=1;     
   
elseif (r2==1)

    Parameter_Num=2;

elseif (r3==1)

    Parameter_Num=3;

elseif (r4==1)

    Parameter_Num=4;

elseif (r5==1)
    
    Parameter_Num=5;    
    
elseif (r6==1)
                
    Parameter_Num=6;                
                
end

% Generating X-axis Bar Graph Label

X_BarLabel=cell(1,ProjectLife);  

for i=1:ProjectLife

    ii=num2str(i);

    X_BarLabel(1,i)={ii};

end

% Getting Y axis Bar Graph Values

Next10=1;

Particular_Parameter=FinancialParameters_Computed{1,Parameter_Num};

Y_BarValues=Particular_Parameter{1,Next10};

VarLength=length(Revenue_Computed);

% Getting Graph Title & Y -Axis Label

Title_Var=Graph_Title{1,Parameter_Num};

Title={Title_Var{1,Next10}};

YLabel_Var=Graph_YLabel{1,Parameter_Num};

YLabel={YLabel_Var{1,Next10}};

    % Creating the Opening BAR Graph for the REPORT (PVout)
    axes(handles.G1);
    bar(Y_BarValues(1,2:end));
    title(Title);
    ylabel(YLabel);
    xlabel('Years');
    set(gca,'XTickLabel',X_BarLabel);   
  

%% Choose default command line output for SolarFinancialModule_Results_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Setting Up Current GUI Workspace
setappdata(0,'SolarFinancialModule_Results_GUI',gcf);

% Setting Computed Variables for Excel Sheet Creation in Current GUI Workspace

SolarFinancialModule_Results_GUI=getappdata(0,'SolarFinancialModule_Results_GUI');

setappdata(SolarFinancialModule_Results_GUI,'InputsSheet_TableArray',InputsSheet_TableArray);

setappdata(SolarFinancialModule_Results_GUI,'RevenueSheet_TableArray',RevenueSheet_TableArray);

setappdata(SolarFinancialModule_Results_GUI,'DebtServicingSheet_TableArray',DebtServicingSheet_TableArray);

setappdata(SolarFinancialModule_Results_GUI,'DepreciationSheet_TableArray',DepreciationSheet_TableArray);

setappdata(SolarFinancialModule_Results_GUI,'OperationalExpenditureSheet_TableArray',OperationalExpenditureSheet_TableArray);

setappdata(SolarFinancialModule_Results_GUI,'WorkingCapitalSheet_TableArray',WorkingCapitalSheet_TableArray);

setappdata(SolarFinancialModule_Results_GUI,'CashFlowSheet_TableArray',CashFlowSheet_TableArray);

setappdata(SolarFinancialModule_Results_GUI,'FinancialReportSheet_TableArray',FinancialReportSheet_TableArray);

% Setting Important Variables for Bar Graph Plotting in Current GUI Workspace

setappdata(SolarFinancialModule_Results_GUI,'X_BarLabel',X_BarLabel);

setappdata(SolarFinancialModule_Results_GUI,'Graph_Title',Graph_Title);

setappdata(SolarFinancialModule_Results_GUI,'Graph_YLabel',Graph_YLabel);

%% Setting up SL and AD Values in Current GUI Workspace);

setappdata(SolarFinancialModule_Results_GUI,'SL',SL);

setappdata(SolarFinancialModule_Results_GUI,'AD',AD);

% UIWAIT makes SolarFinancialModule_Results_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SolarFinancialModule_Results_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in b1.
function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current and Main GUI Workspaces

SolarFinancialModule_Inputs_GUI=getappdata(0,'SolarFinancialModule_Inputs_GUI');

SolarFinancialModule_Results_GUI=getappdata(0,'SolarFinancialModule_Results_GUI');

% Getting Important Variables from Current GUI Workspace

FinancialParameters_Computed=getappdata(SolarFinancialModule_Inputs_GUI,'FinancialParameters_Computed');

X_BarLabel=getappdata(SolarFinancialModule_Results_GUI,'X_BarLabel');

Graph_Title=getappdata(SolarFinancialModule_Results_GUI,'Graph_Title');

Graph_YLabel=getappdata(SolarFinancialModule_Results_GUI,'Graph_YLabel');

SL=getappdata(SolarFinancialModule_Results_GUI,'SL');

AD=getappdata(SolarFinancialModule_Results_GUI,'AD');

% Programming NEXT Button
global Next10;
global VarLength
global Parameter_Num
if Next10==VarLength
    Next10=0;
end 
Next10=Next10+1;

% Initializing Bar Graph

if (Parameter_Num==3)
    
    if (SL==1)
        
        Particular_Parameter1=FinancialParameters_Computed{1,Parameter_Num};
        
        Particular_Parameter=Particular_Parameter1{1,1};
        
        Y_BarValues=Particular_Parameter{1,Next10};
        
        VarLength=length(Particular_Parameter);

        % Getting Graph Title & Y -Axis Label

        Title_Var=Graph_Title{1,Parameter_Num};

        Title={Title_Var{1,Next10}};

        YLabel_Var=Graph_YLabel{1,Parameter_Num};

        YLabel={YLabel_Var{1,Next10}};         
        
    elseif (AD==1)
        
        Particular_Parameter1=FinancialParameters_Computed{1,Parameter_Num};
        
        Particular_Parameter=Particular_Parameter1{1,2};  
        
        Y_BarValues=Particular_Parameter{1,Next10};
        
        VarLength=length(Particular_Parameter);

        % Getting Graph Title & Y -Axis Label

        Title_Var=Graph_Title{1,Parameter_Num};

        Title={Title_Var{2,Next10}};

        YLabel_Var=Graph_YLabel{1,Parameter_Num};

        YLabel={YLabel_Var{1,Next10}};         
        
    end
    
else
    
    Particular_Parameter=FinancialParameters_Computed{1,Parameter_Num};

    Y_BarValues=Particular_Parameter{1,Next10};

    VarLength=length(Particular_Parameter);

    % Getting Graph Title & Y -Axis Label

    Title_Var=Graph_Title{1,Parameter_Num};

    Title={Title_Var{1,Next10}};

    YLabel_Var=Graph_YLabel{1,Parameter_Num};

    YLabel={YLabel_Var{1,Next10}};    
    
end

    % Creating the Opening BAR Graph for the REPORT (PVout)
    axes(handles.G1);
    bar(Y_BarValues(1,2:end));
    title(Title);
    ylabel(YLabel);
    xlabel('Years');
    set(gca,'XTickLabel',X_BarLabel); 

% --- Executes on button press in b2.
function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current and Main GUI Workspaces

SolarFinancialModule_Inputs_GUI=getappdata(0,'SolarFinancialModule_Inputs_GUI');

SolarFinancialModule_Results_GUI=getappdata(0,'SolarFinancialModule_Results_GUI');

% Getting Important Variables from Current GUI Workspace

FinancialParameters_Computed=getappdata(SolarFinancialModule_Inputs_GUI,'FinancialParameters_Computed');

X_BarLabel=getappdata(SolarFinancialModule_Results_GUI,'X_BarLabel');

Graph_Title=getappdata(SolarFinancialModule_Results_GUI,'Graph_Title');

Graph_YLabel=getappdata(SolarFinancialModule_Results_GUI,'Graph_YLabel');

SL=getappdata(SolarFinancialModule_Results_GUI,'SL');

AD=getappdata(SolarFinancialModule_Results_GUI,'AD');

% Programming PREVIOUS Button
global Next10;
global VarLength
global Parameter_Num
if Next10==1
    Next10=VarLength+1;
end 
Next10=Next10-1;

% Initializing Bar Graph

if (Parameter_Num==3)
    
    if (SL==1)
        
        Particular_Parameter1=FinancialParameters_Computed{1,Parameter_Num};
        
        Particular_Parameter=Particular_Parameter1{1,1};
        
        Y_BarValues=Particular_Parameter{1,Next10};
        
        VarLength=length(Particular_Parameter);

        % Getting Graph Title & Y -Axis Label

        Title_Var=Graph_Title{1,Parameter_Num};

        Title={Title_Var{1,Next10}};

        YLabel_Var=Graph_YLabel{1,Parameter_Num};

        YLabel={YLabel_Var{1,Next10}};         
        
    elseif (AD==1)
        
        Particular_Parameter1=FinancialParameters_Computed{1,Parameter_Num};
        
        Particular_Parameter=Particular_Parameter1{1,2};   
        
        Y_BarValues=Particular_Parameter{1,Next10};
        
        VarLength=length(Particular_Parameter);

        % Getting Graph Title & Y -Axis Label

        Title_Var=Graph_Title{1,Parameter_Num};

        Title={Title_Var{2,Next10}};

        YLabel_Var=Graph_YLabel{1,Parameter_Num};

        YLabel={YLabel_Var{1,Next10}};         
        
    end
    
else
    
    Particular_Parameter=FinancialParameters_Computed{1,Parameter_Num};

    Y_BarValues=Particular_Parameter{1,Next10};

    VarLength=length(Particular_Parameter);

    % Getting Graph Title & Y -Axis Label

    Title_Var=Graph_Title{1,Parameter_Num};

    Title={Title_Var{1,Next10}};

    YLabel_Var=Graph_YLabel{1,Parameter_Num};

    YLabel={YLabel_Var{1,Next10}};    
    
end

    % Creating the Opening BAR Graph for the REPORT (PVout)
    axes(handles.G1);
    bar(Y_BarValues(1,2:end));
    title(Title);
    ylabel(YLabel);
    xlabel('Years');
    set(gca,'XTickLabel',X_BarLabel); 

% --- Executes on button press in b4.
function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Close the Current GUI
close;


% --- Executes on button press in b3.
function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Getting the Current GUI WorkSpace and Table Arrays

% Getting Current GUI Workspace Name

SolarFinancialModule_Results_GUI=getappdata(0,'SolarFinancialModule_Results_GUI');

% Getting the Computed Table Arrays for Excel Sheet Creation

InputsSheet_TableArray=getappdata(SolarFinancialModule_Results_GUI,'InputsSheet_TableArray');

RevenueSheet_TableArray=getappdata(SolarFinancialModule_Results_GUI,'RevenueSheet_TableArray');

DebtServicingSheet_TableArray=getappdata(SolarFinancialModule_Results_GUI,'DebtServicingSheet_TableArray');

DepreciationSheet_TableArray=getappdata(SolarFinancialModule_Results_GUI,'DepreciationSheet_TableArray');

OperationalExpenditureSheet_TableArray=getappdata(SolarFinancialModule_Results_GUI,'OperationalExpenditureSheet_TableArray');

WorkingCapitalSheet_TableArray=getappdata(SolarFinancialModule_Results_GUI,'WorkingCapitalSheet_TableArray');

CashFlowSheet_TableArray=getappdata(SolarFinancialModule_Results_GUI,'CashFlowSheet_TableArray');

FinancialReportSheet_TableArray=getappdata(SolarFinancialModule_Results_GUI,'FinancialReportSheet_TableArray');

% Creating an Cell Array for Excel Sheet

ExcelArray={InputsSheet_TableArray,RevenueSheet_TableArray,DebtServicingSheet_TableArray,DepreciationSheet_TableArray,OperationalExpenditureSheet_TableArray,WorkingCapitalSheet_TableArray,CashFlowSheet_TableArray,FinancialReportSheet_TableArray};

%% Creating Excel Sheet

SheetNum=length(ExcelArray);

filename = 'SolarPVPlant_FinancialModel.xlsx';

for i=1:SheetNum   
    
    sheet = i;

    xlRange = 'A1';

    xlswrite(filename,ExcelArray{1,i},sheet,xlRange);

end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to Project_IRR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Project_IRR as text
%        str2double(get(hObject,'String')) returns contents of Project_IRR as a double


% --- Executes during object creation, after setting all properties.
function Project_IRR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Project_IRR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to Equity_IRR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Equity_IRR as text
%        str2double(get(hObject,'String')) returns contents of Equity_IRR as a double


% --- Executes during object creation, after setting all properties.
function Equity_IRR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Equity_IRR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to Project_NPV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Project_NPV as text
%        str2double(get(hObject,'String')) returns contents of Project_NPV as a double


% --- Executes during object creation, after setting all properties.
function Project_NPV_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Project_NPV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to Equity_NPV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Equity_NPV as text
%        str2double(get(hObject,'String')) returns contents of Equity_NPV as a double


% --- Executes during object creation, after setting all properties.
function Equity_NPV_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Equity_NPV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uibuttongroup5.
function uibuttongroup5_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup5 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Getting Current and Main GUI Workspaces

SolarFinancialModule_Inputs_GUI=getappdata(0,'SolarFinancialModule_Inputs_GUI');

SolarFinancialModule_Results_GUI=getappdata(0,'SolarFinancialModule_Results_GUI');

% Getting Important Variables from Current GUI Workspace

FinancialParameters_Computed=getappdata(SolarFinancialModule_Inputs_GUI,'FinancialParameters_Computed');

X_BarLabel=getappdata(SolarFinancialModule_Results_GUI,'X_BarLabel');

Graph_Title=getappdata(SolarFinancialModule_Results_GUI,'Graph_Title');

Graph_YLabel=getappdata(SolarFinancialModule_Results_GUI,'Graph_YLabel');

SL=getappdata(SolarFinancialModule_Results_GUI,'SL');

AD=getappdata(SolarFinancialModule_Results_GUI,'AD');

% Getting Radio Button Values

r1=get(handles.r1,'Value');
r2=get(handles.r2,'Value');
r3=get(handles.r3,'Value');
r4=get(handles.r4,'Value');
r5=get(handles.r5,'Value');
r6=get(handles.r6,'Value');

% Initializing Global Variables

global Parameter_Num;

global Next10;

global VarLength;

% Deciding Parameter to be plotted in accordance with the Radio Button Values

if (r1==1)
    
    Parameter_Num=1;
    
    Next10=1;   
   
elseif (r2==1)

    Parameter_Num=2;
    
    Next10=1;

elseif (r3==1)

    Parameter_Num=3;
    
    Next10=1;

elseif (r4==1)

    Parameter_Num=4;
    
    Next10=1;

elseif (r5==1)
    
    Parameter_Num=5; 
    
    Next10=1;
    
elseif (r6==1)
                
    Parameter_Num=6; 
    
    Next10=1;
                
end

% Initializing Bar Graph

if (Parameter_Num==3)
    
    if (SL==1)
        
        Particular_Parameter1=FinancialParameters_Computed{1,Parameter_Num};
        
        Particular_Parameter=Particular_Parameter1{1,1};
        
        Y_BarValues=Particular_Parameter{1,Next10};
        
        VarLength=length(Particular_Parameter);

        % Getting Graph Title & Y -Axis Label

        Title_Var=Graph_Title{1,Parameter_Num};

        Title={Title_Var{1,Next10}};

        YLabel_Var=Graph_YLabel{1,Parameter_Num};

        YLabel={YLabel_Var{1,Next10}};         
        
    elseif (AD==1)
        
        Particular_Parameter1=FinancialParameters_Computed{1,Parameter_Num};
        
        Particular_Parameter=Particular_Parameter1{1,2};   
        
        Y_BarValues=Particular_Parameter{1,Next10};        
        
        VarLength=length(Particular_Parameter);

        % Getting Graph Title & Y -Axis Label

        Title_Var=Graph_Title{1,Parameter_Num};

        Title={Title_Var{2,Next10}};

        YLabel_Var=Graph_YLabel{1,Parameter_Num};

        YLabel={YLabel_Var{1,Next10}};         
        
    end
    
else
    
    Particular_Parameter=FinancialParameters_Computed{1,Parameter_Num};

    Y_BarValues=Particular_Parameter{1,Next10};

    VarLength=length(Particular_Parameter);

    % Getting Graph Title & Y -Axis Label

    Title_Var=Graph_Title{1,Parameter_Num};

    Title={Title_Var{1,Next10}};

    YLabel_Var=Graph_YLabel{1,Parameter_Num};

    YLabel={YLabel_Var{1,Next10}};    
    
end


    % Creating the Opening BAR Graph for the REPORT (PVout)
    axes(handles.G1);
    bar(Y_BarValues(1,2:end));
    title(Title);
    ylabel(YLabel);
    xlabel('Years');
    set(gca,'XTickLabel',X_BarLabel); 