function [ ProcessedData,Z,N ] = WTGGenerationDataCleaner( Headers,Res,hem,Ltm, DataCumulativeOrNot,GenIrrad, AllParameters,WindLossParameters,DateTimeString,NegativeCols,WTGGenCleanAlgorithm,TurbineStatusVal,TurbineStatusVal_ErrorPercentBand )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% Headers = If Data File Contains Headers, then 1, otherwise 0
% Res = Time Step of the Data File in Minutes
% DataCols = Number of Columns in Data File Which Represents Data, other than date and time Columns
% Hem = 1 if Eastern Hemisphere; -1 if Western Hemisphere
% Ltm = Longitude for Regional Time Zone
% DataCumulativeOrNot = If Data is Cumulative "1", if it is not Cumulative then "0", for each Column
% GenIrrad = Vector of numbers describing Data Columns to be either Generation Data (if, GenIrrad=1), or Power Data (if, GenIrrad=0)
% AllParmeters = A Cell Structure containiing Wind Plant Static Information
% WindLossParameters = A Cell Structure containing Wind Plant Loss Information
% DateTimeString = Contains the Format String of the Date-Time Specification
% NegativeCol = A Vector containing column numbers of Data Columns which can have negative values
% SolarRegionalTime = A Scalar to indicate need for conversion of Date-Time Stamp ; If 1 , Then Date-Time in Regional and convert to Solar/Local ; If 2 , Then Date-Time in Solar/Local and convert to Regional ; If 0 , Then Do Not Convert
% WTGGenCleanAlgorithm = A Scalar containing information for WTG Power/Energy Cleaning Algorithm ; If 1 , Then Use N-Point Average Method ; If 2 , Then Use Standard Power Curve ; If 3 , Then Use Averaged Power Curves per Turbine ; If 4 , Then Use Averaged Power Curve for Plant
% TurbineStatusVal = A Vector containing all the Status Values for which WTG produces Power/Energy
% TurbineStatusVal_ErrorPercentBand = A Vector containing Percentage Deviation Band Values for each TurbineStatusVal ; If not known ENTER NEGATIVE VALUE

%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Wind Power Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[~,sheets] = xlsfinfo(Fullpathname);

DataFile_Cell_Len=sheets;

for i=1:DataFile_Cell_Len

   [~ ,~,DataFile1]=xlsread(Fullpathname,i); 

   DataFile_Cell(1,i)={DataFile1};

end

% Getting Weather Files based on Normal and Forecast Mode 

if (WTGGenCleanAlgorithm==1) % Use N-Point Average Method

    % Weather Information is not required 


elseif((WTGGenCleanAlgorithm==2)||(WTGGenCleanAlgorithm==3)||(WTGGenCleanAlgorithm==4)) % Other Methods

    % Weather Information is reqired

    % Temperature File Selection
    [Filename,Pathname]=uigetfile({'*.*'},'Temperature File Selector');

    Fullpathname=strcat(Pathname,Filename);

    [~,sheets] = xlsfinfo(Fullpathname);

    Tt_Len=sheets;

    Temp_Cell2={''}; % Blank Header
    
    for i=1:Tt_Len

       [~,~,T1]=xlsread(Fullpathname,i); 

       Temp_Cell1(1,i)={T1};
       
       Temp_Cell=vertcat(Temp_Cell2,Temp_Cell1);

    end   

    % Wind File Selection
    [Filename,Pathname]=uigetfile({'*.*'},'Wind File Selector');

    Fullpathname=strcat(Pathname,Filename);

    [~,sheets] = xlsfinfo(Fullpathname);

    Wss_Len=sheets;

    WS_Cell2={''}; % Blank Header
    
    for i=1:Wss_Len

       [~,~,Ws1]=xlsread(Fullpathname,i); 

       WS_Cell1(1,i)={Ws1};

       WS_Cell=vertcat(WS_Cell2,WS_Cell1);
       
    end
    
    WeatherFile=0; % Initializing (Not Required)

end

%% Processing Date-Time String using External Function

[ DateTimeString_Processor1_OutputCell ] = DateTimeString_Processor1( DateTimeString );

%% Putting Data in Corrected Rows and Columns using External Function

for i=1:DataFile_Cell_Len
    
    DataFileSheet_Cell={DataFile_Cell(1,i)};

    [PlantPreFillingCorrectedDataSheet]=PreFillingDataCleaner(DataFileSheet_Cell,Headers,Res,hem,Ltm,L,Lat,DateTimeString_Processor1_OutputCell,NegativeCols,0,1); % 0 == Do not Convert Date-Time Stamp Region ; 1 == Wind Plant

    PlantPreFillingCorrectedDataFile_Cell1(1,i)={PlantPreFillingCorrectedDataSheet};
    
end

%% Creating a Complete PlantPreFillingCorrectedDataFile_Cell

for i=1:DataFile_Cell_Len
    
    PlantPreFillingCorrectedDataFileSheet_Cell={PlantPreFillingCorrectedDataFile_Cell1(1,i)}; % Generation Cell

    [R,C]=size(PlantPreFillingCorrectedDataFileSheet_Cell);
    
    DateTimeSheet_Cell = PlantPreFillingCorrectedDataFileSheet_Cell(:,1:4);
    
    GenerationSheet_Cell = PlantPreFillingCorrectedDataFileSheet_Cell(:,end);
    
    WindSpeedSheet_Cell = WS_Cell{1,i};
    
    TemperatureSheet_Cell = Temp_Cell{1,i};
    
    WindDirectionSheet_Cell = vertcat({''},mat2cell(zeros(R,1)));
    
    PlantStatusSheet_Cell = vertcat({''},mat2cell(zeros(R,1)));
    
    CompleteSheet_Cell=[DateTimeSheet_Cell,WindSpeedSheet_Cell,TemperatureSheet_Cell,WindDirectionSheet_Cell,PlantStatusSheet_Cell,GenerationSheet_Cell];
    
    PlantPreFillingCorrectedDataFile_Cell(1,i)=CompleteSheet_Cell;
    
end

%% Filling  Missing Data 

% Computing SheetType

if (DataFile_Cell_Len==1) 
    
    SheetType=2;
    
elseif (DataFile_Cell_Len>1)
    
    SheetType=1;
    
end

for i=1:DataFile_Cell_Len
    
    SheetNum=i;
    
    PlantPreFillingCorrectedData_Sheet={PlantPreFillingCorrectedDataFile_Cell(1,i)};
    
    DateTime_Variables=PlantPreFillingCorrectedData_Sheet(:,1:4); % Getting Date-Time Columns
    
    Weather_Variables=PlantPreFillingCorrectedData_Sheet(:,5:8); % Getting Weather Variable Columns
           
    Generation_Variable=PlantPreFillingCorrectedData_Sheet(:,9); % Getting Generation Column
    
    % Combining Weather-Irradiance-Generation Columns with Date-Time Columns

    DTWeather_Cell=horzcat(DateTime_Variables,Weather_Variables);   
   
    DTGeneration_Cell=horzcat(DateTime_Variables,Generation_Variable);  

    % Cleaning Generation File using External Function
           
    [ DTGeneration_Cleaned_Cell ] = WTGGenerationDataCleaner_NormalMode( DTGeneration_Cell,DTWeather_Cell,Res,N,GenIrrad,DataCumulativeOrNot,WTGGenCleanAlgorithm,AllParameters,WindLossParameters,SheetNum,SheetType   );        
        
    PlantCleanedFile_Cell(1,i)={DTGeneration_Cleaned_Cell};    
    
end

%% Creating a Proper File Name and Storing in Excel File (Generation File)

Filename1 = strread(Filename,'%s','delimiter','_'); % Using '_' as Delimiter for removing File Extensions

Filename = Filename1{1,1};

filename = [Filename,'_ProcessedWindPlantGenerationFile.xlsx'];

% Creating the Excel File

for i=1:length(PlantCleanedFile_Cell)
    
    PlantCleanedSheet_Cell=PlantCleanedFile_Cell{1,i};

    sheet = i;

    xlRange = 'A1';

    xlswrite(filename,PlantCleanedSheet_Cell,sheet,xlRange);

end
    
    
end





