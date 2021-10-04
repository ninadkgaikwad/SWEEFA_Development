function [StartYear,EndYear,StartMonth,EndMonth,StartDay,EndDay, SelectYear_Popup_String,SelectMonth_Popup_String,SelectMonth_Popup_Vector,YearVector] = ForecastingPerformanceAnalysis_SelectedFileSheetInfoGenerator(PerformanceAnalysis_Database_SelectedSheet)

%% Function Details:

% PerformanceAnalysis_Database_SelectedSheet = This is a Matrix with Columns : Date-Time, Weather Variables Forecasted, Power Forecasted, Energy Forecasted, Weather Variables Actual, Power Actual, Energy Actual

%% Computing PerformanceAnalysis_Sheet Information

% Computing Values for Step 5.2

StartYear= PerformanceAnalysis_Database_SelectedSheet(1,3);

EndYear= PerformanceAnalysis_Database_SelectedSheet(end,3); 

StartMonth= PerformanceAnalysis_Database_SelectedSheet(1,2); 

EndMonth= PerformanceAnalysis_Database_SelectedSheet(end,2); 

StartDay= PerformanceAnalysis_Database_SelectedSheet(1,1); 

EndDay= PerformanceAnalysis_Database_SelectedSheet(end,1);

% Computing Strings for Step 5.3

% Computing SelectYear_Popup_String
YearVector=StartYear:EndYear;

Len_YearVector=length(YearVector); % Computing the Length

SelectYear_Popup_String=cell(1,Len_YearVector);

for i=1:Len_YearVector 
    
    SelectYear_Popup_String1(1,i)={num2str(YearVector(1,i))};
    
    SelectYear_Popup_String(1,i)=['Year',SelectYear_Popup_String1];
    
end

% Computing SelectMonth_Popup_String using External Function

[SelectMonth_Popup_String,SelectMonth_Popup_Vector] = ForecastingPerformanceAnalysis_SelectMonthpopupStringGenerator(YearVector,Len_YearVector,StartMonth,EndMonth);


end

