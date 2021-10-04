function [ DTGeneration_Cleaned_Cell ] = WTGGenerationDataCleaner_ForecastMode( DTGeneration_Cell,DTWeather_Cleaned_Cell,Res,N,GenIrrad,DataCumulativeOrNot,WTGGenCleanAlgorithm,AllParameters,WindLossParameters,SheetNum,SheetType   )

%% Function Details:

% DTGeneration_Cell = Date-Time and Generation Columns with Headers in a Cell Structure
% Res = Time Step of the Data File in Minutes
% N = It is number elements for N-Point Running Average
% GenIrrad = Vector of numbers describing Data Columns to be either Generation Data (if, GenIrrad=1), or Power Data (if, GenIrrad=2), Irradiance Data (if, GenIrrad=0)
% DataCumulativeOrNot = If Data is Cumulative "1", if it is not Cumulative then "0", for each Column
% WTGGenCleanAlgorithm = A Scalar containing information for WTG Power/Energy Cleaning Algorithm ; If 1 , Then Use N-Point Average Method ; If 2 , Then Use Standard Power Curve ; If 3 , Then Use Averaged Power Curves per Turbine ; If 4 , Then Use Averaged Power Curve for Plant
% AllParmeters = A Cell Structure containiing Wind Plant Static Information
% WindLossParameters = A Cell Structure containing Wind Plant Loss Information
% SheetNum = A Scalar containing the Ordered Number of the Sheet
% SheetType = A Scalar : If 1 One Sheet for each PVTechs, Then  ; If 2 , Then One Sheet for All PVTechs

%% Cleaning Solar PV Generation Variable Data Column

%% Preliminary Computations

% Computing DataCols and Rows

[r,c]=size(DTGeneration_Cell);

DataCols=c-4;

%Rows=r-1;

% Getting ProcessedData

ProcessedData=cell2mat(DTGeneration_Cell(2:end,:));

% Getting Size of ProcessedData

[rrnum,ccnum]=size(ProcessedData);

% Getting Start-End: Day, Month and Year

StartDay=ProcessedData(1,1);

EndDay=ProcessedData(end,1);

StartMonth=ProcessedData(1,2);

EndMonth=ProcessedData(end,2);

StartYear=ProcessedData(1,3);

EndYear=ProcessedData(end,3);

[ ~,~,TotDays ] = RowsColsToComputeDataCleaning( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,DataCols,4 );

% Creating Date Time (Decimal Solar Time) Matrix for the given number of Days using Pre-Defined Function

[ ~,~,TimeT ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,DataCols );

TimeT=TimeT'; % Converting Column Vector to Row Vector
len=length(TimeT); 

% Setting Temp and Ws and TurbineStatus

Temp=cell2mat(DTWeather_Cleaned_Cell(2:end,6));

WS=cell2mat(DTWeather_Cleaned_Cell(2:end,5));

TurbineStatus=cell2mat(DTWeather_Cleaned_Cell(2:end,8));

%% Disintegrating AllParameters using External Function

[AllParameters_Disintegrated_Cell]=WTG_AllParametersDisintegrator(AllParameters,SheetNum,WTGGenCleanAlgorithm);


%% Converting the CUMULATIVE DATA into ACTUAL DATA using a Pre-defined Function

% Getting the PowerCurve from the AllParameters_Disintegrated

if DataCumulativeOrNot==1

    WTG_Gen_Deviation_Percent=10; % Can be changed as per requirement
    
    [ActualData]=WTG_CumulativeGenToActual(ProcessedData,AllParameters_Disintegrated_Cell,WindLossParameters,Temp,WS,TurbineStatus,Res,GenIrrad,WTGGenCleanAlgorithm,WTG_Gen_Deviation_Percent);

    ProcessedData=ActualData;

end

%% Filling Missing Data

% Filling Missing Data according to WTGGenCleanAlgorithm

if (WTGGenCleanAlgorithm==1) % N-Point Average Method
    
    % Creating a Cell Structure for WeatherDataCleaner_ForecastMode
    
    WTG_GenerationDataSheet_Cell=vertcat(DTGeneration_Cell(1,:),mat2cell(ProcessedData));
    
    % Cleaning Generation File using External Function
    
    [ DTGeneration_Cleaned_Cell ] = WeatherDataCleaner_ForecastMode( WTG_GenerationDataSheet_Cell,N );
    
else % Methods based on Power-Curves
    
    for i=1:rrnum % For Each Row in ProcessedData
        
        if (isnan(ProcessedData(i,end))) % Checking for Missing Data           
           
            % Computing Missing Data
            
            [WTG_Generation]=WTGEnergySimulation_PointWise_ForecastMode(WS(i,1),Temp(i,1),TurbineStatus(i,1),Res,GenIrrad,AllParameters_Disintegrated_Cell,WindLossParameters,WTGGenCleanAlgorithm);
            
            % Putting WTG_Generation in ProcessedData
            
            ProcessedData(i,end)=WTG_Generation;
            
        end
        
    end
    
    % Creating DTGeneration_Cleaned_Cell

    DTGeneration_Cleaned_Cell=vertcat(DTGeneration_Cell(1,:),mat2cell(ProcessedData));    
    
end

end

