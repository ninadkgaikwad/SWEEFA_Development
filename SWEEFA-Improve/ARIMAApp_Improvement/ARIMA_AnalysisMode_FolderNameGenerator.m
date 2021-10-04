function [PlantLevel_FolderName,SheetLevel_FolderName_Cell,TrainingDurationLevel_FolderName_Cell,ForecastedDurationLevel_FolderName_Cell,DetrendingLagLevel_FolderName_Cell,ARMALagLevel_FolderName_Cell]=ARIMA_AnalysisMode_FolderNameGenerator(PlantName,Plant_HistoricalDataFile_Cell,TrainingDataSeries_Duration,ForecastedDataSeries_Duration,Detrending_LagPairs,ARMA_LagPairs_Cell)

%% Function Details:

% PlantName = 
% Plant_HistoricalDataFile_Cell = 
% TrainingDataSeries_Duration = 
% ForecastedDataSeries_Duration = 
% Detrending_LagPairs = 
% ARMA_LagPairs_Cell =

%% Creating ARIMA Analysis - Folder Structure

% Creating Folder Names

% Plant-Level
PlantLevel_FolderName=PlantName;

% Plant File Sheet-Level
SheetLevel_FolderName_Cell={}; % Initialization

for i=1:length(Plant_HistoricalDataFile_Cell) % For Each Sheet in the Plant Data Historical File
    
    SheetLevel_FolderName_Cell(1,i)={strcat('SheetLevel-',num2str(i))};
    
end

% Training Duration Level

TrainingDurationLevel_FolderName_Cell={}; % Initialization

for i=1:length(TrainingDataSeries_Duration) % For Each Training Duration Value
    
    TrainingDurationLevel_FolderName_Cell(1,i)={strcat('TrainingDurationLevel-',num2str(TrainingDataSeries_Duration(1,i)))};
    
end

% Forecasted Duration Level

ForecastedDurationLevel_FolderName_Cell={}; % Initialization

for i=1:length(TrainingDataSeries_Duration) % For Each Forecast Duration Value
    
    ForecastedDurationLevel_FolderName_Cell(1,i)={strcat('ForecastDurationLevel-',num2str(ForecastedDataSeries_Duration(1,i)))};
    
end

% Detrending Lag Level

    % Creating Detrending_LagPairs_Str

    [R,C]=size(Detrending_LagPairs); % Getting the Size

    for i=1:C % For Each Column

       SingleLag_Str=num2str(Detrending_LagPairs(1,i)); 
       SeasonalLag_Str=num2str(Detrending_LagPairs(2,i));

       Detrending_LagPairs_Str_Cell(1,i)={strcat('(',SingleLag_Str,',',SeasonalLag_Str,')')};

    end

    DetrendingLagLevel_FolderName_Cell={}; % Initialization

    for i=1:length(Detrending_LagPairs_Str_Cell) % For Each Detrending Lag Pair

        DetrendingLagLevel_FolderName_Cell(1,i)={strcat('DetrendingLevel-',Detrending_LagPairs_Str_Cell{1,i})};

    end
    
% ARMA Lag Level

    % Creating ARMA_LagPairs_Str

    [R,C]=size(ARMA_LagPairs_Cell); % Getting the Size

    for i=1:C % For Each Column

       AR_Lag=ARMA_LagPairs_Cell{1,i}; 
       MA_Lag=ARMA_LagPairs_Cell{2,i};
       
       AR_Lag_Str=''; % Initialization
       
       for j=1:length(AR_Lag) % For Each AR Lag Value
           
          AR_Lag_Str=strcat(AR_Lag_Str,',',num2str(AR_Lag(1,j))); 
           
       end
       
       MA_Lag_Str=''; % Initialization
       
       for j=1:length(MA_Lag) % For Each MA Lag Value
           
          MA_Lag_Str=strcat(MA_Lag_Str,',',num2str(MA_Lag(1,j))); 
           
       end       

       ARMA_LagPairs_Str_Cell(1,i)={strcat('(','AR-',AR_Lag_Str,';MA-',MA_Lag_Str,')')};

    end

    ARMALagLevel_FolderName_Cell={}; % Initialization

    for i=1:length(ARMA_LagPairs_Str_Cell) % For Each Detrending Lag Pair

        ARMALagLevel_FolderName_Cell(1,i)={strcat('ARMALevel-',ARMA_LagPairs_Str_Cell{1,i})};

    end
    
% Forecasted Duration Individual Time Period Level  

end

