function [ARIMA_AnalysisMode_Report_Cell]=ARIMA_AnalysisMode_AnalysisGenerator(ARIMA_AnalysisMode_InputData_Cell)

%% Function Details:

% ARIMA_AnalysisMode_InputData_Cell = A Cell Structure containing all the User inputs required for creating a custom ARIMA Analysis

%% Performing ARIMA Analysis:

%% Disassembling ARIMA_AnalysisMode_InputData_Cell

% Getting the Folder Path 

ARIMA_AnalysisMode_FolderPath = ARIMA_AnalysisMode_InputData_Cell{1,1};

% Getting Step 1 Data

WindPlant=ARIMA_AnalysisMode_InputData_Cell{1,2};
SolarPlant=ARIMA_AnalysisMode_InputData_Cell{1,3};

PlantName=ARIMA_AnalysisMode_InputData_Cell{1,4};

% Getting Step 2 Data

Plant_HistoricalDataFile_Cell=ARIMA_AnalysisMode_InputData_Cell{1,5};

Res=ARIMA_AnalysisMode_InputData_Cell{1,6};

% Getting Step 3 Data

TrainingDataSeries_Duration=ARIMA_AnalysisMode_InputData_Cell{1,7}; 

ForecastedDataSeries_Duration=ARIMA_AnalysisMode_InputData_Cell{1,8}; 

% Getting Step 4 Data

DetrendingLag_Convoluted=ARIMA_AnalysisMode_InputData_Cell{1,9};
DetrendingLag_NonConvoluted=ARIMA_AnalysisMode_InputData_Cell{1,10};

Single_LagNumber_Vector=ARIMA_AnalysisMode_InputData_Cell{1,11}; 

Seasonal_LagNumber_Vector=ARIMA_AnalysisMode_InputData_Cell{1,12}; 

% Getting Step 5 Data

ARIMA_ModelOrder_Convoluted=ARIMA_AnalysisMode_InputData_Cell{1,13};
ARIMA_ModelOrder_NonConvoluted=ARIMA_AnalysisMode_InputData_Cell{1,14};

AR_LagNumber_Vector=ARIMA_AnalysisMode_InputData_Cell{1,15}; 

MA_LagNumber_Vector=ARIMA_AnalysisMode_InputData_Cell{1,16};

%% Getting General Information from Plant_HistoricalDataFile_Cell

% Getting first Sheet from multiple sheets

Plant_HistoricalDataSheet_Cell=Plant_HistoricalDataFile_Cell{1,1};

% Getting Size of the Plant_HistoricalDataSheet_Cell

[R,C]=size(Plant_HistoricalDataSheet_Cell);

% Computing Data Columns

DataCols=C-4;

% Getting Headers

Complete_Headers=Plant_HistoricalDataSheet_Cell(1,:);

DateTime_Headers=Plant_HistoricalDataSheet_Cell(1,1:4);

DataCols_Headers=Plant_HistoricalDataSheet_Cell(1,5:end);

% Getting First and Last Date-Time Stamp

Start_Year=Plant_HistoricalDataSheet_Cell{2,3};
Start_Month=Plant_HistoricalDataSheet_Cell{2,2};
Start_Day=Plant_HistoricalDataSheet_Cell{2,1};
Start_Time=Plant_HistoricalDataSheet_Cell{2,4};

% Getting Time Info (H, M, S) using External Function

[ Start_hr,Start_min,Start_sec ] = DeciToHM( Start_Time );

End_Year=Plant_HistoricalDataSheet_Cell{end,3};
End_Month=Plant_HistoricalDataSheet_Cell{end,2};
End_Day=Plant_HistoricalDataSheet_Cell{end,1};
End_Time=Plant_HistoricalDataSheet_Cell{end,4};

% Getting Time Info (H, M, S) using External Function

[ End_hr,End_min,End_sec ] = DeciToHM( End_Time );

%% Creating Convoluted and Non-Convoluted Lag Pairs 

% Using External Function

[Detrending_LagPairs,ARMA_LagPairs_Cell] = ARIMA_AnalysisMode_LagPairGenerator(DetrendingLag_Convoluted,DetrendingLag_NonConvoluted,Single_LagNumber_Vector,Seasonal_LagNumber_Vector,ARIMA_ModelOrder_Convoluted,ARIMA_ModelOrder_NonConvoluted,AR_LagNumber_Vector,MA_LagNumber_Vector);

%% Creating Forecast Duration Dates and Indices 

% Creating Start and End Date-Time Objects

Start_DateTime = datetime(Start_Year,Start_Month,Start_Day,Start_hr,Start_min,Start_sec);
End_DateTime = datetime(End_Year,End_Month,End_Day,End_hr,End_min,End_sec);

% Using External Function

[DateTime_Array,TrainingDataSeries_Duration_Corrected,TrainingDataSeries_WindowLengths,ForecastedDataSeries_Duration_Corrected,ForecastedDataSeries_WindowLengths,ForecastedDataSeries_DateTime_Array_Cell] = ARIMA_AnalysisMode_TrainForecastDuration_Generator(TrainingDataSeries_Duration,ForecastedDataSeries_Duration,Start_DateTime,End_DateTime,Res);
   
%% Creating ARIMA Analysis - Folder Structure

% Using External Function

[PlantLevel_FolderName,SheetLevel_FolderName_Cell,TrainingDurationLevel_FolderName_Cell,ForecastedDurationLevel_FolderName_Cell,DetrendingLagLevel_FolderName_Cell,ARMALagLevel_FolderName_Cell]=ARIMA_AnalysisMode_FolderNameGenerator(PlantName,Plant_HistoricalDataFile_Cell,TrainingDataSeries_Duration_Corrected,ForecastedDataSeries_Duration_Corrected,Detrending_LagPairs,ARMA_LagPairs_Cell);

%% Creating ARIMA Analysis

% Using External Function

[ARIMA_AnalysisMode_Report_Cell]=ARIMA_AnalysisMode_AnalysisGenerator1(WindPlant,SolarPlant,ARIMA_AnalysisMode_FolderPath,Plant_HistoricalDataSheet_Cell,Detrending_LagPairs,ARMA_LagPairs_Cell,DateTime_Array,TrainingDataSeries_Duration_Corrected,TrainingDataSeries_WindowLengths,ForecastedDataSeries_Duration_Corrected,ForecastedDataSeries_WindowLengths,ForecastedDataSeries_DateTime_Array_Cell,PlantLevel_FolderName,SheetLevel_FolderName_Cell,TrainingDurationLevel_FolderName_Cell,ForecastedDurationLevel_FolderName_Cell,DetrendingLagLevel_FolderName_Cell,ARMALagLevel_FolderName_Cell);

%% Creating Excel File for ARIMA Analysis Report



end



