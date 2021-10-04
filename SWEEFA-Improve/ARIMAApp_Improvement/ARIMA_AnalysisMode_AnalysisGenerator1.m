function [ARIMA_AnalysisMode_Report_Cell]=ARIMA_AnalysisMode_AnalysisGenerator1(WindPlant,SolarPlant,ARIMA_AnalysisMode_FolderPath,Plant_HistoricalDataSheet_Cell,Detrending_LagPairs,ARMA_LagPairs_Cell,DateTime_Array,TrainingDataSeries_Duration,TrainingDataSeries_WindowLengths,ForecastedDataSeries_Duration,ForecastedDataSeries_WindowLengths,ForecastedDataSeries_DateTime_Array_Cell,PlantLevel_FolderName,SheetLevel_FolderName_Cell,TrainingDurationLevel_FolderName_Cell,ForecastedDurationLevel_FolderName_Cell,DetrendingLagLevel_FolderName_Cell,ARMALagLevel_FolderName_Cell)

%% Function Details:

% WindPlant = 
% Solar Plant = 
% ARIMA_AnalysisMode_FolderPath = 
% Plant_HistoricalDataSheet_Cell = 
% Detrending_LagPairs = 
% ARMA_LagPairs_Cell = 
% DateTime_Array = 
% TrainingDataSeries_Duration = 
% TrainingDataSeries_WindowLengths = 
% ForecastedDataSeries_Duration = 
% ForecastedDataSeries_WindowLengths = 
% ForecastedDataSeries_DateTime_Array_Cell = 
% PlantLevel_FolderName = 
% SheetLevel_FolderName_Cell = 
% TrainingDurationLevel_FolderName_Cell = 
% ForecastedDurationLevel_FolderName_Cell = 
% DetrendingLagLevel_FolderName_Cell = 
% ARMALagLevel_FolderName_Cell = 

%% Creating ARIMA Analysis

%% Getting General Information from Plant_HistoricalDataFile_Cell

% Getting Size of the Plant_HistoricalDataSheet_Cell

[R,C]=size(Plant_HistoricalDataSheet_Cell);

for i=1:C % For Each Sheet in the Data File

    Plant_HistoricalDataSheet_Matrix(:,:,i)=cell2mat(Plant_HistoricalDataSheet_Cell{2:end,:});
    
end

% Computing Data Columns

DataCols=C-4;

% Getting Headers

Complete_Headers=Plant_HistoricalDataSheet_Cell(1,:);

DateTime_Headers=Plant_HistoricalDataSheet_Cell(1,1:4);

DataCols_Headers=Plant_HistoricalDataSheet_Cell(1,5:end);

%% ARIMA Analysis

% Creating Plant Level Folder

mkdir(ARIMA_AnalysisMode_FolderPath,PlantLevel_FolderName);

% Creating Plant Level Folder Path 

PlantLevel_FolderPath=srtcat(ARIMA_AnalysisMode_FolderPath,'\',PlantLevel_FolderName);

% Creating ARIMA_AnalysisMode_Report

ARIMA_AnalysisMode_Report_Header={'Model Number','Sheet Number','Training Duration Value','Forecast Duration Value','Single Lag Number','Sesonal Lag Number','AR Lags','MA Lags','Forecast Start Date-Time','Forecast End Date-Time','AIC','BIC','MAE','MSE','RMSE'};

ARIMA_AnalysisMode_Report_Cell=cell(1,15,DataCols);

ARIMA_AnalysisMode_Report_Cell_RowCounter=0; % Initialization

% Sheet Level - For Loop

for i=1:length(SheetLevel_FolderName_Cell) % For Each Sheet in the Data File (Level-1)
    
   % Creating Sheet Level Folder
   
   mkdir(PlantLevel_FolderPath,SheetLevel_FolderName_Cell{1,i});
   
   % Creating Current Sheet Level Folder Path
   
   SheetLevel_Current_FolderPath=srtcat(PlantLevel_FolderPath,'\',SheetLevel_FolderName_Cell{1,i});
   
   % Getting the Appropriate Sheet from the Data File
   
   SheetLevel_Historical_DataFile_Matrix=Plant_HistoricalDataSheet_Matrix(:,:,i);
   
   % Creating Training Duration Level - For Loop
   
   for j=1:length(TrainingDataSeries_Duration) % For Each Training Duration Value (Level-2)
       
       % Creating Training Duration Level Folder

       mkdir(SheetLevel_Current_FolderPath,TrainingDurationLevel_FolderName_Cell{1,j});

       % Creating Current Training Duration Level Folder Path

       TrainingDurationLevel_Current_FolderPath=srtcat(SheetLevel_Current_FolderPath,'\',TrainingDurationLevel_FolderName_Cell{1,j}); 
       
       % Getting Appropriate Training Duration Value
       
       TrainingDuration_Value=TrainingDataSeries_Duration(1,j);
       
       % Getting Appropriate Training Duration Window Lengths
       
       TrainingDuration_WindowLength_Value=TrainingDataSeries_WindowLengths(1,j);
       
       % Creating Forecast Duration Level -For Loop
       
       for k=1:length(ForecastedDataSeries_Duration) % For Each Forecast Duration Value (Level-3)
           
           % Creating Forecast Duration Level Folder

           mkdir(TrainingDurationLevel_Current_FolderPath,ForecastedDurationLevel_FolderName_Cell{1,k});

           % Creating Current Forecast Duration Level Folder Path

           ForecastDurationLevel_Current_FolderPath=srtcat(TrainingDurationLevel_Current_FolderPath,'\',ForecastedDurationLevel_FolderName_Cell{1,k}); 

           % Getting Appropriate Forecast Duration Value

           ForecastDuration_Value=ForecastedDataSeries_Duration(1,k);

           % Getting Appropriate Forecast Duration Window Lengths

           ForecastDuration_WindowLength_Value=ForecastedDataSeries_WindowLengths(1,k); 
           
           % Getting Appropriate ForecastedDataSeries_DateTime_Array_Cell
           
           ForecastedDataSeries_DateTime_Array=ForecastedDataSeries_DateTime_Array_Cell{j,k};
           
           % Creating Detrending Lag Level - For Loop
           
           for m=1:length(Detrending_LagPairs) % For Each Detrending Lag Pair (Level-4)
               
               % Creating Detrending Lag Level Folder

               mkdir(ForecastDurationLevel_Current_FolderPath,DetrendingLagLevel_FolderName_Cell{1,m});

               % Creating Current Detrending Lag Level Folder Path

               DetrendLagLevel_Current_FolderPath=srtcat(ForecastDurationLevel_Current_FolderPath,'\',DetrendingLagLevel_FolderName_Cell{1,m}); 
               
               % Getting Appropriate Single Lag Number
               
               SingleLagNumber=Detrending_LagPairs(1,m);
               
               % Getting Appropriate Seasonal Lag Number
               
               SeasonalLagNumber=Detrending_LagPairs(2,m);
               
               % Creating ARIMA Model Order Level -For Loop
               
               for n=1:length(ARMA_LagPairs_Cell) % For Each ARMA Lag Pair (Level-5)

                   % Creating ARMA Lag Level Folder

                   mkdir(DetrendLagLevel_Current_FolderPath,ARMALagLevel_FolderName_Cell{1,n});

                   % Creating Current ARMA Lag Level Folder Path

                   ARMALagLevel_Current_FolderPath=srtcat(DetrendLagLevel_Current_FolderPath,'\',ARMALagLevel_FolderName_Cell{1,n}); 
                   
                   % Getting Appropriate AR Lag
                   
                   AR_Lag=ARMA_LagPairs_Cell{1,n};
                   
                   % Getting Appropriate MA Lag
                                                      
                   MA_Lag=ARMA_LagPairs_Cell{2,n};
                   
                   % Getting Size of ForecastedDataSeries_DateTime_Array
                   
                   [R1,C1]=size(ForecastedDataSeries_DateTime_Array);
                   
                   % Creating ARIMA Model
                   
                   Const=NaN;
                   
                   ARIMA_Model=arima('D',SingleLagNumber,'ARLags',AR_Lag,'MALags',MA_Lag,'Seasonality',SeasonalLagNumber,'SARLags',SeasonalLagNumber,'SMALags',SeasonalLagNumber,'Constant',Const);
                   
                   % Creating ARIMA_ForecastData_Matrix_Complete
                   
                   ARIMA_ForecastData_Matrix_Complete=0; % Initialization
                   
                   % Creating ForecastedDataSeries_DateTime_Array Level -For Loop
                   
                   for p=1:R1 % For Each Date-Time Pair (Level-6)
                       
                       % Incrementing ARIMA_AnalysisMode_Report_Cell_RowCounter
                       
                       ARIMA_AnalysisMode_Report_Cell_RowCounter=ARIMA_AnalysisMode_Report_Cell_RowCounter+1;
                       
                       % Getting Current Forecast Start and End Date-Time                       
                      
                       Forecast_StartDateTime_Current=datestr(ForecastedDataSeries_DateTime_Array(p,1),'dd/mm/yyyy - HH:MM:SS');
                       
                       Forecast_EndDateTime_Current=datestr(ForecastedDataSeries_DateTime_Array(p,2),'dd/mm/yyyy - HH:MM:SS');
                       
                       % Getting Appropriate Current Training Dataset
                       
                       if (p==1)
                           
                          TrainingWindow_StartIndex=1;
                          
                          TrainingWindow_EndIndex=TrainingDuration_WindowLength_Value;
                           
                       else
                           
                           TrainingWindow_EndIndex=ForecastedWindow_EndIndex; 
                           
                          TrainingWindow_StartIndex=TrainingWindow_EndIndex-TrainingDuration_WindowLength_Value+1;                         
                                                    
                           
                       end
                       
                       TrainingDataset_Current=SheetLevel_Historical_DataFile_Matrix((TrainingWindow_StartIndex:TrainingWindow_EndIndex),:);
                       
                       % Getting Appropriate Current Test Dataset
                       
                       ForecastedWindow_StartIndex=TrainingWindow_EndIndex+1;
                       
                       ForecastedWindow_EndIndex=ForecastedWindow_StartIndex+ForecastDuration_WindowLength_Value-1;
                       
                       TestDataset_Current=SheetLevel_Historical_DataFile_Matrix((ForecastedWindow_StartIndex:ForecastedWindow_EndIndex),:);
                       
                       % Estimating the ARIMA Model using External Function
                       
                       [ARIMA_Estimated_Model_Cell,AIC_BIC_Matrix]=ARIMA_EstimatedModel_Generator(ARIMA_Model,TrainingDataset_Current);
                       
                       % Forecasting from the ARIMA Model using External Function                       
                       
                       [ARIMA_ForecastData_Matrix,MAE_MSE_RMSE_Matrix]=ARIMA_ModelForecast_Generator(ARIMA_Estimated_Model_Cell,TrainingDataset_Current,TestDataset_Current);
                       
                       % Creating the ARIMA_ForecastData_Matrix_Complete
                       
                       if (p==1)
                           
                           ARIMA_ForecastData_Matrix_Complete=ARIMA_ForecastData_Matrix;
                           
                       else
                           
                           ARIMA_ForecastData_Matrix_Complete=vertcat(ARIMA_ForecastData_Matrix_Complete,ARIMA_ForecastData_Matrix);
                           
                       end
                       
                       % Creating ARIMA_AnalysisMode_Report_Matrix
                       
                       for q=1:DataCols % For Each Data Column
                           
                           ARIMA_AnalysisMode_Report_Cell(ARIMA_AnalysisMode_Report_Cell_RowCounter,1:13,q)={ARIMA_AnalysisMode_Report_Cell_RowCounter,i,TrainingDuration_Value,ForecastDuration_Value,SingleLagNumber,SeasonalLagNumber,num2str(AR_Lag),num2str(MA_Lag),Forecast_StartDateTime_Current,Forecast_EndDateTime_Current,AIC_BIC_Matrix(q,1),AIC_BIC_Matrix(q,2),MAE_MSE_RMSE_Matrix(q,1),MAE_MSE_RMSE_Matrix(q,2),MAE_MSE_RMSE_Matrix(q,3)};
                           
                       end
                                              
                   end
                   
                   % Creating Excel Files according to the Plant Type
                   
                   if (WindPlant==1)
                   
                       % Getting Size of ARIMA_ForecastData_Matrix_Complete

                       [R2,C2]=size(ARIMA_ForecastData_Matrix_Complete);

                       % Creating All Ones File - Turbine Status
                       
                       ARIMA_ForecastData_Matrix_Complete_AllOnes=ARIMA_ForecastData_Matrix_Complete;

                       TurbineStatus_Col_AllOnes=ones(R2,1);

                       ARIMA_ForecastData_Matrix_Complete_AllOnes(:,8)=TurbineStatus_Col_AllOnes;

                       % Creating Logic Ones File - Turbine Status
                       
                       ARIMA_ForecastData_Matrix_Complete_LogicOnes=ARIMA_ForecastData_Matrix_Complete;

                        [ TurbineStatus_Col_LogicOnes ] = WTG_TurbineStatusConverter( ARIMA_ForecastData_Matrix_Complete_LogicOnes(:,8),100,15 ); % Gamesa Savalsung

                        ARIMA_ForecastData_Matrix_Complete_LogicOnes(:,8)=TurbineStatus_Col_LogicOnes;
                        
                       % Creating Excel File for ARIMA_ForecastData_Matrix_Complete

                        filename = strcat(ARMALagLevel_Current_FolderPath,'\','ARIMA_Forecasted_WindPlant_AllOnes.xlsx');

                        sheet = 1;

                        xlRange = 'A1';

                        xlswrite(filename,Complete_Headers,sheet,xlRange);  

                        xlRange = 'A2';

                        xlswrite(filename,ARIMA_ForecastData_Matrix_Complete_AllOnes,sheet,xlRange);  

                        filename = strcat(ARMALagLevel_Current_FolderPath,'\','ARIMA_Forecasted_WindPlant_LogicOnes.xlsx');

                        sheet = 1;

                        xlRange = 'A1';

                        xlswrite(filename,Complete_Headers,sheet,xlRange);  

                        xlRange = 'A2';

                        xlswrite(filename,ARIMA_ForecastData_Matrix_Complete_LogicOnes,sheet,xlRange);  
                        
                   elseif (SolarPlant==1)
                       
                       % Creating Excel File for ARIMA_ForecastData_Matrix_Complete

                        filename = strcat(ARMALagLevel_Current_FolderPath,'\','ARIMA_Forecasted_SolarPlant.xlsx');

                        sheet = 1;

                        xlRange = 'A1';

                        xlswrite(filename,Complete_Headers,sheet,xlRange);  

                        xlRange = 'A2';

                        xlswrite(filename,ARIMA_ForecastData_Matrix_Complete,sheet,xlRange);                         
                       
                   end

               end
               
           end
           
       end
       
   end
    
end

% Creating Performance-Wise Ordered ARIMA_AnalysisMode_Report_Cell

for i=1:Datacols % For each Sheet in the ARIMA_AnalysisMode_Report_Cell
    
   % ARIMA_AnalysisMode_Report_Cell ordered on AIC Values
   
   ARIMA_AnalysisMode_Report_Cell_OrderAIC(:,:,i)=sortrows(ARIMA_AnalysisMode_Report_Cell(:,:,i),[2,11]);
   
   % ARIMA_AnalysisMode_Report_Cell ordered on BIC and Sheet Values
   
   ARIMA_AnalysisMode_Report_Cell_OrderBIC(:,:,i)=sortrows(ARIMA_AnalysisMode_Report_Cell(:,:,i),[2,12]);
   
   % ARIMA_AnalysisMode_Report_Cell ordered on MAE and Sheet  Values
   
   ARIMA_AnalysisMode_Report_Cell_OrderMAE(:,:,i)=sortrows(ARIMA_AnalysisMode_Report_Cell(:,:,i),[2,13]);
   
   % ARIMA_AnalysisMode_Report_Cell ordered on MSE and Sheet  Values
   
   ARIMA_AnalysisMode_Report_Cell_OrderMSE(:,:,i)=sortrows(ARIMA_AnalysisMode_Report_Cell(:,:,i),[2,14]);
   
   % ARIMA_AnalysisMode_Report_Cell ordered on RMSE and Sheet  Values
    
   ARIMA_AnalysisMode_Report_Cell_OrderRMSE(:,:,i)=sortrows(ARIMA_AnalysisMode_Report_Cell(:,:,i),[2,15]);
   
end

% Creating Excel File for ARIMA_AnalysisMode_Report_Cell

filename = strcat(PlantLevel_FolderPath,'\','ARIMA_AnalysisReport.xlsx');

for i=1:DataCols

    sheet = i;

    xlRange = 'A1';

    xlswrite(filename,ARIMA_AnalysisMode_Report_Header,sheet,xlRange);  

    xlRange = 'A2';

    xlswrite(filename,ARIMA_AnalysisMode_Report_Cell(:,:,i),sheet,xlRange);   

end

end



