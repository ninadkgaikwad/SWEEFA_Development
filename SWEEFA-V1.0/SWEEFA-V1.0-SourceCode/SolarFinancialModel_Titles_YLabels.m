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

