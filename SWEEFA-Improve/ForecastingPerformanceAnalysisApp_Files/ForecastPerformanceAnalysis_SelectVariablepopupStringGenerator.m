function [SelectVariablePair_Popup_String,SelectVariablePair_IndexVector_Cell] = ForecastPerformanceAnalysis_SelectVariablepopupStringGenerator(PerformanceAnalysis_Database_Header,FileColumnStructure_Cell)

%% Function Details:

% PerformanceAnalysis_Database_Header = A Cell containing Headers for the PerformanceAnalysis_Database
% FileColumnStructure_Cell = Date-Time Column == 0 ; Weather Column == 1 ; Power Column == 2 ; Energy Column == 3 , (Note: Provide for Forecast as well as Actual file spearated by semi-colon ';' and the column indicators separated by commas ',')

%% Computing String for SelectVariablePair_Popup

% Getting the File Column Structure

FileColumnStructure_Forecast=FileColumnStructure_Cell{1,1};
FileColumnStructure_Actual=FileColumnStructure_Cell{1,2};

% Computing Column Info from File Column Structure

DateTime_Col_Num=length(find(FileColumnStructure_Actual==0));

WeatherData_Col_Num=length(find(FileColumnStructure_Actual==1));

% Getting Forecasted Headers

ForecastVariable_Headers=PerformanceAnalysis_Database_Header(1,(DateTime_Col_Num+1):(DateTime_Col_Num+WeatherData_Col_Num+2));

ForecastVariable_IndexVector=(DateTime_Col_Num+1):(DateTime_Col_Num+WeatherData_Col_Num+2); % For Capturing Column Positions

% Getting Actual Headers

ActualVariable_Headers=PerformanceAnalysis_Database_Header(1,(DateTime_Col_Num+WeatherData_Col_Num+2+1):(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2));

ActualVariable_IndexVector=(DateTime_Col_Num+WeatherData_Col_Num+2+1):(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2); % For Capturing Column Positions

% Getting AbsError Headers (Weather Variables)

AbsErrorWeatherVariable_Headers=PerformanceAnalysis_Database_Header(1,(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+1):(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+WeatherData_Col_Num));

AbsErrorWeatherVariable_IndexVector=(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+1):(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+WeatherData_Col_Num); % For Capturing Column Positions

for i=1:length(AbsErrorWeatherVariable_IndexVector)
    
    AbsErrorWeatherVariable_IndexVector_Cell={AbsErrorWeatherVariable_IndexVector(1,i)};
    
end

% Getting AbsError Headers (Power/Energy Variables)

AbsErrorPowerEnergyVariable_Headers=PerformanceAnalysis_Database_Header(1,(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+WeatherData_Col_Num+1):(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+WeatherData_Col_Num+1+1));

AbsErrorPowerEnergyVariable_IndexVector=(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+WeatherData_Col_Num+1):(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+WeatherData_Col_Num+1+1); % For Capturing Column Positions

% Getting PolicyError Headers (Power/Energy Variables)

PolicyErrorPowerEnergyVariable_Headers=PerformanceAnalysis_Database_Header(1,(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+WeatherData_Col_Num+2+1):(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+WeatherData_Col_Num+2+2));

PolicyErrorPowerEnergyVariable_IndexVector=(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+WeatherData_Col_Num+2+1):(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2+WeatherData_Col_Num+2+2); % For Capturing Column Positions

% Creating Forecast Vs Actual Variable-Pair Names

for i=1:length(ActualVariable_Headers)
    
    ForecastVsActual_VariablePair(1,i)={strcat(ForecastVariable_Headers{1,i},' Vs ',ActualVariable_Headers{1,i})};
    
    ForecastVsActual_IndexVector_Cell(1,i)={[ForecastVariable_IndexVector(1,i),ActualVariable_IndexVector(1,i)]};
    
end

% Creating Abs Vs Policy Variable-Pair Names

for i=1:length(AbsErrorPowerEnergyVariable_Headers)
    
    AbsVsPolicy_VariablePair(1,i)={strcat(AbsErrorPowerEnergyVariable_Headers{1,i},' Vs ',PolicyErrorPowerEnergyVariable_Headers{1,i})};
    
    AbsVsPolicy_IndexVector_Cell(1,i)={[AbsErrorPowerEnergyVariable_IndexVector(1,i),PolicyErrorPowerEnergyVariable_IndexVector(1,i)]};
    
end

% Creating SelectVariablePair_Popup_String 

SelectVariablePair_Popup_String=['Variable-Pair',ForecastVsActual_VariablePair,AbsErrorWeatherVariable_Headers,AbsVsPolicy_VariablePair];

SelectVariablePair_IndexVector_Cell=[ForecastVsActual_IndexVector_Cell,AbsErrorWeatherVariable_IndexVector_Cell,AbsVsPolicy_IndexVector_Cell];

end

