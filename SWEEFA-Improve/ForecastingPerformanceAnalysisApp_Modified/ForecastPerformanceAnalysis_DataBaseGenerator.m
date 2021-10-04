function [PerformanceAnalysis_Database,PerformanceAnalysis_StdErrors,PerformanceAnalysis_Database_Header,PerformanceAnalysis_StdErrors_HeaderHorz,PerformanceAnalysis_StdErrors_HeaderVert] = ForecastPerformanceAnalysis_DataBaseGenerator(ActualDataFile_Cell,ForecastDataMultiFile_Cell,FileColumnStructure_Cell,PlantCapacity,Res)

%% Function Details

% ActualDataFile_Cell : It is a Single File and may or may not have multiple sheets [Usual Column Structure - DT,W,P/E] (Number of sheets should be equal in both Actual and all Forecasted Files and correspond to the same Date-Time and Part of the Plant)    
% ForecastDataMultiFile_Cell : It may or may not be Multiple Files and may or may not have multiple sheets [Usual Column Structure - DT,W,P/E] (Number of sheets should be equal in both Actual and all Forecasted Files and correspond to the same Date-Time and Part of the Plant) (Number of Files depend on the different models used for forecasting)       
% FileColumnStructure_Cell : Date-Time Column == 0 ; Weather Column == 1 ; Power Column == 2 ; Energy Column == 3 , (Note: Provide for Forecast as well as Actual file spearated by semi-colon ';' and the column indicators separated by commas ',')  
% PlantCapacity : Capacity of the Plant in Kilo Watts (Note: Provide Plant Capacity as per the amount of Sheets present, as Plant Capacity will be divided equally between every sheet)
% Res : Time Resolution in minutes of the Files (Note: All the Files Selected both Forecast and Actual should have the same Resolution)

%% Generating Performance Analysis Data-Base and Standard Errors

% Getting the File Column Structure

FileColumnStructure_Forecast=FileColumnStructure_Cell{1,1};
FileColumnStructure_Actual=FileColumnStructure_Cell{1,2};

% Computing Column Info from File Column Structure

DateTime_Col_Num=length(find(FileColumnStructure_Actual==0));

WeatherData_Col_Num=length(find(FileColumnStructure_Actual==1));

PowerDataActual_Col_Num=length(find(FileColumnStructure_Actual==2));

EnergyDataActual_Col_Num=length(find(FileColumnStructure_Actual==3));

PowerDataForecast_Col_Num=length(find(FileColumnStructure_Forecast==2));

EnergyDataForecast_Col_Num=length(find(FileColumnStructure_Forecast==3));

% Getting Headers of Forecast and Actual Files

ForecastDataFile_File=ForecastDataMultiFile_Cell{1,1};
ForecastDataFile_Sheet=ForecastDataFile_File{1,1};
ForecastDataFile_Headers=ForecastDataFile_Sheet(1,1:end);

ActualDataFile_Sheet=ActualDataFile_Cell{1,1};
ActualDataFile_Headers=ActualDataFile_Sheet(1,1:end);

% Creating Header for the PerformanceAnalysis_Database

if (PowerDataForecast_Col_Num>0) % Forecast File has Power Column
    
    ForecastDataFile_Headers(1,(length(ForecastDataFile_Headers)+1))={'Energy'};
    
elseif (EnergyDataForecast_Col_Num>0) % Forecast File has Energy Column
    
    ForecastDataFile_Headers(1,(length(ForecastDataFile_Headers)))={'Power'};
    
    ForecastDataFile_Headers(1,(length(ForecastDataFile_Headers)+1))={'Energy'};
    
end

ForecastDataFile_Headers1=ForecastDataFile_Headers; % For PerformanceAnalysis_StdErrors_Header

if (PowerDataActual_Col_Num>0) % Actual File has Power Column
    
    ActualDataFile_Headers(1,(length(ActualDataFile_Headers)+1))={'Energy'};
    
elseif (EnergyDataActual_Col_Num>0) % Actual File has Energy Column
    
    ActualDataFile_Headers(1,(length(ActualDataFile_Headers)))={'Power'};
    
    ActualDataFile_Headers(1,(length(ActualDataFile_Headers)+1))={'Energy'};
    
end

ActualDataFile_Headers1=ActualDataFile_Headers; % For PerformanceAnalysis_StdErrors_Header

for i=(DateTime_Col_Num+1):length(ActualDataFile_Headers) % Adding '_AbsError' to Actual File Headers
    
    DataFileAbsError_Headers(1,(i-DateTime_Col_Num))={strcat(ActualDataFile_Headers{1,i},'_AbsError')};
    
end

for i=(DateTime_Col_Num+1):length(ForecastDataFile_Headers) % Adding '_Forecast' to Forecast File Headers
    
    ForecastDataFile_Headers(1,i)={strcat(ForecastDataFile_Headers{1,i},'_Forecast')};
    
end

for i=(DateTime_Col_Num+1):length(ActualDataFile_Headers) % Adding '_Actual' to Actual File Headers
    
    ActualDataFile_Headers(1,i)={strcat(ActualDataFile_Headers{1,i},'_Actual')};
    
end

PerformanceAnalysis_Database_Header=[ForecastDataFile_Headers,ActualDataFile_Headers(1,(DateTime_Col_Num+1):end),DataFileAbsError_Headers,'Power_PolicyError','Energy_PolicyError'];

PerformanceAnalysis_StdErrors_HeaderHorz={'MAE','MSE','RMSE'};

PerformanceAnalysis_StdErrors_HeaderVert=[ForecastDataFile_Headers1,ActualDataFile_Headers1(1,(DateTime_Col_Num+1):end)];

PerformanceAnalysis_StdErrors_HeaderVert=PerformanceAnalysis_StdErrors_HeaderVert'; % Taking transpose for Vertical Header

% Converting the Sheet Data in ForecastDataMultiFile_Cell and ActualDataFile_Cell from Cell Type to Matrix Type

for i=1:length(ForecastDataMultiFile_Cell) % Converting ForecastDataMultiFile_Cell 
    
    ForecastFile=ForecastDataMultiFile_Cell{1,i};
    
    ForecastFile_Mat={}; % Initializing
    
    for j=1:length(ForecastFile)
    
        ForecastSheet=ForecastFile{1,j};

        ForecastSheet_Converted=cell2mat(ForecastSheet{2:end,:}); %
        
        ForecastFile_Mat(1,j)={ForecastSheet_Converted};
    
    end
    
    ForecastDataMultiFile_CellMat(1,i)={ForecastFile_Mat};
    
end

for i=1:length(ActualDataFile_Cell) % Converting ActualDataFile_Cell
    
    ActualSheet=ActualDataFile_Cell{1,i};

    ActualSheet_Converted=cell2mat(ActualSheet{2:end,:});

    ActualDataFile_CellMat(1,i)={ActualSheet_Converted};    
    
end


% Computing Power/Energy for Forecast/Actual Files

if (PowerDataForecast_Col_Num>0) % Forecast File has Power Column - Compute and Concatenate Energy Column
    
    for i=1:length(ForecastDataMultiFile_CellMat) % For Each File

        ForecastFile=ForecastDataMultiFile_CellMat{1,i};

        ForecastFile_Mat={}; % Initializing

        for j=1:length(ForecastFile) % For Each Sheet         
       
            ForecastSheet=ForecastFile{1,j};
            
            Power_Column=ForecastSheet(:,end);

            Energy_Column=Power_Column*(Res/60);

            ForecastSheet_Augmented=horzcat(ForecastSheet,Energy_Column);

            ForecastFile_Mat(1,j)={ForecastSheet_Augmented};              

        end

        ForecastDataMultiFile_CellMat(1,i)={ForecastFile_Mat};

    end    
    
elseif (EnergyDataForecast_Col_Num>0) % Forecast File has Energy Column - Compute and Concatenate Power Column

    for i=1:length(ForecastDataMultiFile_Cell) % For Each File 

        ForecastFile=ForecastDataMultiFile_CellMat{1,i};

        ForecastFile_Mat={}; % Initializing

        for j=1:length(ForecastFile) % For Each Sheet

            ForecastSheet=ForecastFile{1,j};
            
            Energy_Column=ForecastSheet(:,end);

            Power_Column=Energy_Column/(Res/60);
            
            ForecastSheet(:,end)=Power_Column;

            ForecastSheet_Augmented=horzcat(ForecastSheet,Energy_Column);

            ForecastFile_Mat(1,j)={ForecastSheet_Augmented}; 

        end

        ForecastDataMultiFile_CellMat(1,i)={ForecastFile_Mat};

    end
    
end

if (PowerDataActual_Col_Num>0) % Actual File has Power Column - Compute and Concatenate Energy Column
    
    for i=1:length(ActualDataFile_CellMat) % For Each Sheet

        ActualSheet=ActualDataFile_CellMat{1,i};

        Power_Column=ActualSheet(:,end);
        
        Energy_Column=Power_Column*(Res/60);
        
        ActualSheet_Augmented=horzcat(ActualSheet,Energy_Column);

        ActualDataFile_CellMat(1,i)={ActualSheet_Augmented};    

    end
    
elseif (EnergyDataActual_Col_Num>0) % Actual File has Energy Column - Compute and Concatenate Power Column
    
    for i=1:length(ActualDataFile_CellMat) % For Each Sheet

        ActualSheet=ActualDataFile_CellMat{1,i};

        Energy_Column=ActualSheet(:,end);
        
        Power_Column=Energy_Column/(Res/60);
        
        ActualSheet(:,end)=Power_Column;
        
        ActualSheet_Augmented=horzcat(ActualSheet,Energy_Column);

        ActualDataFile_CellMat(1,i)={ActualSheet_Augmented};    

    end
    
end

% Concatenating Each Forecast File with Actual File to respective Sheets

ForecastActualFile_Concatenated=cell(1,length(ForecastDataMultiFile_CellMat)); % Intialization

for i=1:length(ForecastDataMultiFile_CellMat) % For Each File
    
    ForecastFile=ForecastDataMultiFile_CellMat{1,i};
    
    ConcatenatedFile=cell(1,length(ActualDataFile_CellMat)); % Initialization
    
    for j=1:length(ActualDataFile_CellMat) % For Each Sheet
        
        ForecastSheet=ForecastFile{1,j};
        
        ActualSheet=ActualDataFile_CellMat{1,j};
        
        ConcatenatedSheet=horzcat(ForecastSheet,ActualSheet(:,(DateTime_Col_Num+1:end)));
        
        ConcatenatedFile(1,j)={ConcatenatedSheet};
        
    end
    
    ForecastActualFile_Concatenated(1,i)={ConcatenatedFile};
    
end

% Computing Absolute and Policy Errors

ForecastActualFileError_Concatenated=cell(length(ForecastActualFile_Concatenated)); % Initialization

for i=1:length(ForecastActualFile_Concatenated) % For Each File
    
    ForecastActualFile=ForecastActualFile_Concatenated{1,i};
    
    ForecastActualErrorConcatenatedFile=cell(1,length(ForecastActualFile)); % Initialization
    
    for j=1:length(ForecastActualFile) % For Each Sheet
        
        ForecastActualSheet=ForecastActualFile{1,j};
        
        [Row,Col]=size(ForecastActualSheet); % Getting Size of ForecastActualSheet
        
        % Getting Forecast/Actual Weather-Power-Energy Variables
        
        Forecast_WeatherVarible_Matrix=ForecastActualSheet(:,(DateTime_Col_Num+1):(DateTime_Col_Num+WeatherData_Col_Num));
        
        Forecast_PowerVarible_Matrix=ForecastActualSheet(:,(DateTime_Col_Num+WeatherData_Col_Num+1));
        
        Forecast_EnergyVarible_Matrix=ForecastActualSheet(:,(DateTime_Col_Num+WeatherData_Col_Num+2));
        
        Actual_WeatherVarible_Matrix=ForecastActualSheet(:,(DateTime_Col_Num+WeatherData_Col_Num+2+1):(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num));
        
        Actual_PowerVarible_Matrix=ForecastActualSheet(:,(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+1));
        
        Actual_EnergyVarible_Matrix=ForecastActualSheet(:,(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2));       
        
        % Computing Weather variable Absolute Error Percentage
        
        WeatherVariable_AbsError_Matrix=((Forecast_WeatherVarible_Matrix-Actual_WeatherVarible_Matrix)./(Forecast_WeatherVarible_Matrix))*100;
        
        % Computing Power variable Absolute Error Percentage
        
        PowerVariable_AbsError_Matrix=((Forecast_PowerVarible_Matrix-Actual_PowerVarible_Matrix)./(Forecast_PowerVarible_Matrix))*100; 
        
        % Computing Energy variable Absolute Error Percentage
        
        EnergyVariable_AbsError_Matrix=((Forecast_EnergyVarible_Matrix-Actual_EnergyVarible_Matrix)./(Forecast_EnergyVarible_Matrix))*100; 
        
        % Computing Correct Plant Capacity
        
        PlantCapacity_Corrected=PlantCapacity/length(ForecastActualFile);
        
        % Computing Power variable Policy Error Percentage
        
        PowerVariable_PolicyError_Matrix=((Forecast_PowerVarible_Matrix-Actual_PowerVarible_Matrix)./(PlantCapacity_Corrected))*100; 
        
        % Computing Energy variable Policy Error Percentage
        
        EnergyVariable_PolicyError_Matrix=((Forecast_EnergyVarible_Matrix-Actual_EnergyVarible_Matrix)./(PlantCapacity_Corrected*(Res/60)))*100;       
                 
        % Arranging the Data Appropriately
        
        ConcatenatedSheet=horzcat(ForecastActualSheet,WeatherVariable_AbsError_Matrix,PowerVariable_AbsError_Matrix,EnergyVariable_AbsError_Matrix,PowerVariable_PolicyError_Matrix,EnergyVariable_PolicyError_Matrix);
        
        ForecastActualErrorConcatenatedFile(1,j)={ConcatenatedSheet};
        
    end
    
    ForecastActualFileError_Concatenated(1,i)={ForecastActualErrorConcatenatedFile};
    
end

% Creating Output

PerformanceAnalysis_Database=ForecastActualFileError_Concatenated;

% Computing MAE, MSE and RMSE

PerformanceAnalysis_StdErrors=cell(1,length(PerformanceAnalysis_Database)); % Initialization

for i=1:length(PerformanceAnalysis_Database) % For Each File
    
    PerformanceAnalysis_Database_File=PerformanceAnalysis_Database{1,i};
    
    PerformanceAnalysis_StdErrors_File=cell(1,length(PerformanceAnalysis_Database_File)); % Initialization
    
    for j=1:length(PerformanceAnalysis_Database_File) % For Each Sheet in the File
        
        PerformanceAnalysis_Database_Sheet=PerformanceAnalysis_Database_File{1,j};
        
        % Getting the Actual and Forecast Variables
        
        PerformanceAnalysis_Database_ForecastVariables=PerformanceAnalysis_Database_Sheet(:,(DateTime_Col_Num+1):(DateTime_Col_Num+WeatherData_Col_Num+2));
        
        PerformanceAnalysis_Database_ActualVariables=PerformanceAnalysis_Database_Sheet(:,(DateTime_Col_Num+WeatherData_Col_Num+2+1):(DateTime_Col_Num+WeatherData_Col_Num+2+WeatherData_Col_Num+2));
        
        % Computing MAE using External Function
        
        [MAE_Matrix] = ForecastPerformanceAnalysis_MAE(PerformanceAnalysis_Database_ForecastVariables, PerformanceAnalysis_Database_ActualVariables);
        
        MAE_Matrix=MAE_Matrix'; % Taking Transpose
        
        % Computing MSE using External Function
        
        [MSE_Matrix] = ForecastPerformanceAnalysis_MSE(PerformanceAnalysis_Database_ForecastVariables, PerformanceAnalysis_Database_ActualVariables);
        
        MSE_Matrix=MSE_Matrix'; % Taking Transpose
        
        % Computing RMSE using External Function
        
        [RMSE_Matrix] = ForecastPerformanceAnalysis_RMSE(PerformanceAnalysis_Database_ForecastVariables, PerformanceAnalysis_Database_ActualVariables);
        
        RMSE_Matrix=RMSE_Matrix'; % Taking Transpose
        
        % Arranging the Standard Errors Appropriately
        
        StdErrorMatrix_Sheet=horzcat(MAE_Matrix,MSE_Matrix,RMSE_Matrix);
        
        PerformanceAnalysis_StdErrors_File(1,j)={StdErrorMatrix_Sheet};
        
    end
    
    PerformanceAnalysis_StdErrors(1,i)={PerformanceAnalysis_StdErrors_File};
    
end

end

