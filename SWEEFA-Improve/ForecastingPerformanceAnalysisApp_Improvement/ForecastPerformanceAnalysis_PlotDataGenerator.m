function [Plot_DataMatrix, Plot_Index, Plot_Title, Plot_XAxisLabel, Plot_YAxisLabel] = ForecastPerformanceAnalysis_PlotDataGenerator(PerformanceAnalysis_Database_SelectedSheet, Year, Month, Day, VariablePair_Index, VariablePair_String)

%% Function Details:

% PerformanceAnalysis_Database_SelectedSheet = A Matrix containing :  Date-Time, Forecasted Weather-Variables, Forecasted Power-Energy Variables, Actual Weather-Variables, Actual Power-Energy , AbsError Weather-Variables, AbsError Power-Energy Variables, PolicyError Power-Energy Variables
% Year = A Scalar of the Selected Year
% Month = A Scalar of the Selected Month
% Day = A Scalar of the Selected Day
% VariablePair_Index = A Cell Structure containing Column Numbers of the required Data Columns for plotting from PerformanceAnalysis_Database_SelectedSheet
% VariablePair_String = A Cell Structure containing Header for the Title of the Plot 


%% Computing Data for Plotting 

Len_VariablePair_Index=length(VariablePair_Index); % Computing Length of the Variable

% Creating Plot Data based on the Len_VariablePair_Index

if (Len_VariablePair_Index==2) % 2 Variable Columns have to be Selected
    
   
    % Getting the required Subset of the Coulmns using External Function
    
    [Plot_DataMatrix] = ForecastingPerformanceAnalysis_PlotDataSelector(PerformanceAnalysis_Database_SelectedSheet, Year, Month, Day, Len_VariablePair_Index, VariablePair_Index);
    
    % Creating Plot_Index
    
    Plot_Index=2;
    
    % Creating Plot_Title
    
    Plot_Title=strcat(VariablePair_String,' Graph');
    
    % Creating Plot_XAxisLabel
    
    Plot_XAxisLabel='Time (Hours)';
    
    % Creating Plot_YAxisLabel
    
    Plot_YAxisLabel=VariablePair_String;    
    
elseif (Len_VariablePair_Index==1) % 1 Variable Columns have to be Selected 
 
 
    % Getting the required Subset of the Coulmns using External Function
    
    [Plot_DataMatrix] = ForecastingPerformanceAnalysis_PlotDataSelector(PerformanceAnalysis_Database_SelectedSheet, Year, Month, Day, Len_VariablePair_Index, VariablePair_Index);    
    
    % Creating Plot_Index
    
    Plot_Index=2;
    
    % Creating Plot_Title
    
    Plot_Title=strcat(VariablePair_String,' Graph');
    
    % Creating Plot_XAxisLabel
    
    Plot_XAxisLabel='Time (Hours)';
    
    % Creating Plot_YAxisLabel
    
    Plot_YAxisLabel=VariablePair_String;      
    
end

end

