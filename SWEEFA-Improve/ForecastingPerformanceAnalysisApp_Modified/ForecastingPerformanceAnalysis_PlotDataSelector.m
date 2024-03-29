function [Plot_DataMatrix] = ForecastingPerformanceAnalysis_PlotDataSelector(PerformanceAnalysis_Database_SelectedSheet, Year, Month, Day, Len_VariablePair_Index, VariablePair_Index)

%% Function Details:

% PerformanceAnalysis_Database_SelectedSheet = A Matrix containing :  Date-Time, Forecasted Weather-Variables, Forecasted Power-Energy Variables, Actual Weather-Variables, Actual Power-Energy , AbsError Weather-Variables, AbsError Power-Energy Variables, PolicyError Power-Energy Variables
% Year = A Scalar of the Selected Year
% Month = A Scalar of the Selected Month
% Day = A Scalar of the Selected Day
% Len_VariablePair_Index = Length of VariablePair_Index
% VariablePair_Index = A Cell Structure containing Column Numbers of the required Data Columns for plotting from PerformanceAnalysis_Database_SelectedSheet
 
%% Selecting Data for Plotting 

% Selecting Data according to Len_VariablePair_Index

if (Len_VariablePair_Index==2) % 2 Variable Columns have to be Selected 
    
    % Getting the required Columns
    
    DataCol1_YAxis=VariablePair_Index(1,1);
    DataCol2_YAxis=VariablePair_Index(1,2);
    
    DataCol3_XAxis=4; % Time Vector
    
    % Getting Correct Row Indices based on Year, Month and Day
    
    Year_IndexVector=find((PerformanceAnalysis_Database_SelectedSheet(:,3)==Year)); % Getting Year Indices
    
    Month_IndexVector=find((PerformanceAnalysis_Database_SelectedSheet(:,2)==Month)); % Getting Month Indices
    
    Day_IndexVector=find((PerformanceAnalysis_Database_SelectedSheet(:,1)==Day)); % Getting Day Indices
    
    CorrectRow_IndexVector1=intersect(Year_IndexVector,Month_IndexVector); % Intersecting Year and Month Indices
    
    CorrectRow_IndexVector=intersect(CorrectRow_IndexVector1,Day_IndexVector); % Intersecting Intersection of Year-Month Indices with Day Indices
    
    % Creating the Plot_DataMatrix
    
    Plot_DataMatrix=[PerformanceAnalysis_Database_SelectedSheet(CorrectRow_IndexVector,DataCol3_XAxis),PerformanceAnalysis_Database_SelectedSheet(CorrectRow_IndexVector,DataCol1_YAxis),PerformanceAnalysis_Database_SelectedSheet(CorrectRow_IndexVector,DataCol2_YAxis)];
    
elseif (Len_VariablePair_Index==1) % 1 Variable Column has to be Selected
    
    % Getting the required Column
    
    DataCol1_YAxis=VariablePair_Index(1,1);    
    
    DataCol2_XAxis=4; % Time Vector
    
    % Getting Correct Row Indices based on Year, Month and Day
    
    Year_IndexVector=find((PerformanceAnalysis_Database_SelectedSheet(:,3)==Year)); % Getting Year Indices
    
    Month_IndexVector=find((PerformanceAnalysis_Database_SelectedSheet(:,2)==Month)); % Getting Month Indices
    
    Day_IndexVector=find((PerformanceAnalysis_Database_SelectedSheet(:,1)==Day)); % Getting Day Indices
    
    CorrectRow_IndexVector1=intersect(Year_IndexVector,Month_IndexVector); % Intersecting Year and Month Indices
    
    CorrectRow_IndexVector=intersect(CorrectRow_IndexVector1,Day_IndexVector); % Intersecting Intersection of Year-Month Indices with Day Indices
    
    % Creating the Plot_DataMatrix
    
    Plot_DataMatrix=[PerformanceAnalysis_Database_SelectedSheet(CorrectRow_IndexVector,DataCol2_XAxis),PerformanceAnalysis_Database_SelectedSheet(CorrectRow_IndexVector,DataCol1_YAxis)];    
    
end

end

