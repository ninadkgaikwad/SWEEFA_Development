function [ ProcessedData ] = WindPlant_DataCleaner( Headers,Res,hem,Ltm,N,GenIrrad,DataCumulativeOrNot,DateTimeString,NegativeCols,WTGGenCleanAlgorithm,TurbineStatusVal,TurbineStatusVal_ErrorPercentBand,AllParameters,WindLossParameters,RelevantColumnPositions,ExtraColumnPositions  )

%% Function Details:

% Headers = If Data File Contains Headers, then 1, otherwise 0
% Res = Time Step of the Data File in Minutes
% Hem = 1 if Eastern Hemisphere; -1 if Western Hemisphere
% Ltm = Longitude for Regional Time Zone
% N = It is number elements for N-Point Running Average
% GenIrrad = Vector of numbers describing Data Columns to be either Generation Data (if, GenIrrad=1), or Power Data (if, GenIrrad=2), Irradiance Data (if, GenIrrad=0)
% DataCumulativeOrNot = If Data is Cumulative "1", if it is not Cumulative then "0", for each Column
% DateTimeString = Contains the Format String of the Date-Time Specification
% NegativeCol = A Vector containing column numbers of Data Columns which can have negative values
% WTGGenCleanAlgorithm = A Scalar containing information for WTG Power/Energy Cleaning Algorithm ; If 1 , Then Use N-Point Average Method ; If 2 , Then Use Standard Power Curve ; If 3 , Then Use Averaged Power Curves per Turbine ; If 4 , Then Use Averaged Power Curve for Plant
% TurbineStatusVal = A Vector containing all the Status Values for which WTG produces Power/Energy
% TurbineStatusVal_ErrorPercentBand = A Vector containing Percentage Deviation Band Values for each TurbineStatusVal ; If not known ENTER NEGATIVE VALUE
% AllParameters = A Cell Structure containiing Wind Plant Static Information
% WindLossParameters = A Cell Structure containing Wind Plant Loss Information
% RelevantColumnPositions = A Scalar containing the Column Numbers of the original file selected and ordered as per application requirement 
% ExtraColumnPositions = A Scalar containing the extra Column Numbers of the original file selected and ordered as per user requirement 

%% Cleaning Wind Plant Data

%% Getting the Solar Plant Raw Data File in the MATLAB WorkSpace

% File Selection

[Filename,Pathname]=uigetfile({'*.*'},'Wind Plant Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[~,sheets] = xlsfinfo(Fullpathname);

DataFile_Cell_Len=sheets;

for i=1:DataFile_Cell_Len

   [~ ,~,DataFile1]=xlsread(Fullpathname,i); 

   PlantRawDataFile_Cell(1,i)={DataFile1};

end


%% Processing Date-Time String using External Function

[ DateTimeString_Processor1_OutputCell ] = DateTimeString_Processor1( DateTimeString );

%% Arranging the Columns as per Application Requirement

for i=1:DataFile_Cell_Len
    
    PlantRawDataSheet_Cell={PlantRawDataFile_Cell(1,i)};

    [PlantCorrectlyArrangedDataSheet]=ColumnArrangerDataCleaner(PlantRawDataSheet_Cell,RelevantColumnPositions,ExtraColumnPositions,1); % 1 == Wind Plant

    PlantCorrectlyArrangedDataFile_Cell(1,i)={PlantCorrectlyArrangedDataSheet};
    
end

%% Putting Data in Corrected Rows and Columns using External Function

for i=1:DataFile_Cell_Len
    
    PlantCorrectlyArrangedDataSheet_Cell={PlantCorrectlyArrangedDataFile_Cell(1,i)};

    [PlantPreFillingCorrectedDataSheet]=PreFillingDataCleaner(PlantCorrectlyArrangedDataSheet_Cell,Headers,Res,hem,Ltm,L,Lat,DateTimeString_Processor1_OutputCell,NegativeCols,0,1); % 0 == Do not Convert Date-Time Stamp Region ; 1 == Wind Plant

    PlantPreFillingCorrectedDataFile_Cell(1,i)={PlantPreFillingCorrectedDataSheet};
    
end

%% Dividing the PlantPreFillingCorrectedDataFile-Sheets into Weather-Irradiance-Generation Columns

% Computing SheetType

if (DataFile_Cell_Len==1) 
    
    SheetType=2;
    
elseif (DataFile_Cell_Len>1)
    
    SheetType=1;
    
end

% Getting Length of ExtraColumnPositions

ExtraColumnPositions_Len=length(ExtraColumnPositions);

for i=1:DataFile_Cell_Len
    
    SheetNum=i;
    
    PlantPreFillingCorrectedData_Sheet={PlantPreFillingCorrectedDataFile_Cell(1,i)};
    
    DateTime_Variables=PlantPreFillingCorrectedData_Sheet(:,1:4); % Getting Date-Time Columns
    
    Weather_Variables=PlantPreFillingCorrectedData_Sheet(:,5:8); % Getting Weather Variable Columns
           
    Generation_Variable=PlantPreFillingCorrectedData_Sheet(:,9); % Getting Generation Column
    
    if (ExtraColumnPositions_Len>0) % Extra Variables are present
        
        Extra_Variable=PlantPreFillingCorrectedData_Sheet(:,(10):end); % Getting Extra Columns
        
    end   
    
    % Combining Weather-Irradiance-Generation Columns with Date-Time Columns

    DTWeather_Cell=horzcat(DateTime_Variables,Weather_Variables);   
   
    DTGeneration_Cell=horzcat(DateTime_Variables,Generation_Variable);
    
    if (ExtraColumnPositions_Len>0) % Extra Variables are present
        
        DTExtra_Cell=horzcat(DateTime_Variables,Extra_Variable);
        
    end       
    
    % Cleaning Weather File using External Function
    
    [ DTWeather_Cleaned_Cell ] = WeatherDataCleaner_ForecastMode( DTWeather_Cell,N );   
    
    % Correcting TurbineStatus Column according to WTGGenCleanAlgorithm
    
    TurbineStatusCol_Conversion=1; % Turbine Status to be corrected
    
    [ DTWeather_Cleaned_TstatCorrected_Cell ] = WTG_TstatCorrector_DataCleaner( DTWeather_Cell,WTGGenCleanAlgorithm,TurbineStatusVal,TurbineStatusVal_ErrorPercentBand,TurbineStatusCol_Conversion );
    
    % Cleaning Generation File using External Function
           
    [ DTGeneration_Cleaned_Cell ] = WTGGenerationDataCleaner_ForecastMode( DTGeneration_Cell,DTWeather_Cleaned_Cell,Res,N,GenIrrad,DataCumulativeOrNot,WTGGenCleanAlgorithm,AllParameters,WindLossParameters,SheetNum,SheetType   );        
   
    % Correcting Generation Column 
     
    TurbineStatusBased_GenerationCorrection=1; % Generation to be corrected
    
    [ DTGeneration_Cleaned_GenCorrected_Cell ] = WTG_GenCorrector_DataCleaner(DTGeneration_Cleaned_Cell,DTWeather_Cleaned_TstatCorrected_Cell,TurbineStatusBased_GenerationCorrection );
    
    % Cleaning Extra File using External Function
    
    if (ExtraColumnPositions_Len>0) % Extra Variables are present
        
        [ DTExtra_Cleaned_Cell ] = WeatherDataCleaner_ForecastMode( DTExtra_Cell,N );
        
    end      
    
    % Arranging the Cleaned Columns of Weather-Irradiance-Generation Appropriately
    
    if (ExtraColumnPositions_Len==0) % Extra Variable/s is/are not present
    
        % For ANN and ARIMA Input with Turbine Status as Real Values
        
        PlantCleanedSheet_Cell1=[DTWeather_Cleaned_Cell(:,1:end),DTGeneration_Cleaned_GenCorrected_Cell(:,end)];
        
        % For Energy Estimation Input with Turbine Status as 1,0
        
        PlantCleanedSheet_Cell=[DTWeather_Cleaned_TstatCorrected_Cell(:,1:end),DTGeneration_Cleaned_GenCorrected_Cell(:,end)];
    
    elseif (ExtraColumnPositions_Len>0) % Extra Variable/s is/are present
        
        % For ANN and ARIMA Input with Turbine Status as Real Values
        
        PlantCleanedSheet_Cell1=[DTWeather_Cleaned_Cell(:,1:end),DTGeneration_Cleaned_GenCorrected_Cell(:,end),DTExtra_Cleaned_Cell(:,5:end)];
        
        % For Energy Estimation Input with Turbine Status as 1,0
        
        PlantCleanedSheet_Cell=[DTWeather_Cleaned_TstatCorrected_Cell(:,1:end),DTGeneration_Cleaned_GenCorrected_Cell(:,end),DTExtra_Cleaned_Cell(:,5:end)];
        
    end
    
    PlantCleanedFile_Cell1(1,i)={PlantCleanedSheet_Cell1};
        
    PlantCleanedFile_Cell(1,i)={PlantCleanedSheet_Cell};
    
end

%% Creating Extra Files from PlantCleanedFile_Cell according to WTGGenCleanAlgorithm

if (WTGGenCleanAlgorithm==1) % N-Point Average Method is Used
    
    % Using External Function - For ANN and ARIMA Input with Turbine Status as Real Values
    
    FileType=1; % Turbine Status as Real Values
    
    [WTG_ExtraFile_Cell1]=WTG_ExtraFileCreator_Opt1_ForecastMode(PlantCleanedFile_Cell1,FileType,GenIrrad,Res);      
    
    % Using External Function - For Energy Estimation Input with Turbine Status as 1,0
    
    FileType=2; % Turbine Status as 1,0
    
    [WTG_ExtraFile_Cell]=WTG_ExtraFileCreator_Opt1_ForecastMode(PlantCleanedFile_Cell,FileType,GenIrrad,Res);   
      
elseif (WTGGenCleanAlgorithm==2) % Standard Power Curves are Used
    
    % Using External Function - For ANN and ARIMA Input with Turbine Status as Real Values
    
    FileType=1; % Turbine Status as Real Values
    
    [WTG_ExtraFile_Cell1]=WTG_ExtraFileCreator_Opt2_ForecastMode(PlantCleanedFile_Cell1,FileType,GenIrrad,Res,AllParameters,WindLossParameters);     
     
    
    % Using External Function - For Energy Estimation Input with Turbine Status as 1,0
    
    FileType=2; % Turbine Status as 1,0
    
    [WTG_ExtraFile_Cell]=WTG_ExtraFileCreator_Opt2_ForecastMode(PlantCleanedFile_Cell,FileType,GenIrrad,Res,AllParameters,WindLossParameters); 
    
elseif (WTGGenCleanAlgorithm==3) % Average Power Curves per Turbine are Used
    
    % Using External Function - For ANN and ARIMA Input with Turbine Status as Real Values
    
    FileType=1; % Turbine Status as Real Values
    
    [WTG_ExtraFile_Cell1]=WTG_ExtraFileCreator_Opt3_ForecastMode(PlantCleanedFile_Cell1,FileType,GenIrrad,Res);      
    
    % Using External Function - For Energy Estimation Input with Turbine Status as 1,0
    
    FileType=2; % Turbine Status as 1,0
    
    [WTG_ExtraFile_Cell]=WTG_ExtraFileCreator_Opt3_ForecastMode(PlantCleanedFile_Cell,FileType,GenIrrad,Res); 
    
elseif (WTGGenCleanAlgorithm==4) % Average Power Curves for Plant are Used
    
    % Using External Function - For ANN and ARIMA Input with Turbine Status as Real Values
    
    FileType=1; % Turbine Status as Real Values
    
    [WTG_ExtraFile_Cell1]=WTG_ExtraFileCreator_Opt4_ForecastMode(PlantCleanedFile_Cell1,FileType,GenIrrad,Res);      
    
    % Using External Function - For Energy Estimation Input with Turbine Status as 1,0
    
    FileType=2; % Turbine Status as 1,0
    
    [WTG_ExtraFile_Cell]=WTG_ExtraFileCreator_Opt4_ForecastMode(PlantCleanedFile_Cell,FileType,GenIrrad,Res); 
    
end

%% Creating a Proper File Name and Storing in Excel File (Plant File)

% For ANN and ARIMA Input with Turbine Status as Real Values

Filename1 = strread(Filename,'%s','delimiter','_'); % Using '_' as Delimiter for removing File Extensions

Filename = Filename1{1,1};

filename = [Filename,'_ProcessedWindPlantFile_ARIMA-ANNInput.xlsx'];

% Creating the Excel File

for i=1:length(PlantCleanedFile_Cell1)
    
    PlantCleanedSheet_Cell1=PlantCleanedFile_Cell1{1,i};

    sheet = i;

    xlRange = 'A1';

    xlswrite(filename,PlantCleanedSheet_Cell1,sheet,xlRange);

end

% For Energy Estimation Input with Turbine Status as 1,0

Filename1 = strread(Filename,'%s','delimiter','_'); % Using '_' as Delimiter for removing File Extensions

Filename = Filename1{1,1};

filename = [Filename,'_ProcessedWindPlantFile_EnergyEstimation.xlsx'];

% Creating the Excel File

for i=1:length(PlantCleanedFile_Cell)
    
    PlantCleanedSheet_Cell=PlantCleanedFile_Cell{1,i};

    sheet = i;

    xlRange = 'A1';

    xlswrite(filename,PlantCleanedSheet_Cell,sheet,xlRange);

end

end

