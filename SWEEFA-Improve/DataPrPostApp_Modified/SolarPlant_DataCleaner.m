function [ ProcessedData ] = SolarPlant_DataCleaner( Headers,Res,hem,Ltm,L,Lat,N,GenIrrad,GenCapacity,DataCumulativeOrNot,DateTimeString,NegativeCols,SolarRegionalTime,PlantInfo_Parameters,RelevantColumnPositions,ExtraColumnPositions )

%% Function Details:

% Headers = If Data File Contains Headers, then 1, otherwise 0
% Res = Time Step of the Data File in Minutes
% Hem = 1 if Eastern Hemisphere; -1 if Western Hemisphere
% Ltm = Longitude for Regional Time Zone
% L = Logitude at Location
% Lat = Latitude at Location
% GenCapacity = Vector of Capacity in each Field (kW), used to calculate theoretical maximum value of of energy generated in one time step
% GenIrrad = Vector of numbers describing Data Columns to be either Generation Data (if, GenIrrad=1), or Power Data (if, GenIrrad=0), Irradiance Data (if, GenIrrad<0)
% N = It is number elements for N-Point Running Average
% DataCumulativeOrNot = If Data is Cumulative "1", if it is not Cumulative then "0", for each Column
% DateTimeString = Contains the Format String of the Date-Time Specification
% NegativeCol = A Vector containing column numbers of Data Columns which can have negative values
% SolarRegionalTime = A Scalar to indicate need for conversion of Date-Time Stamp ; If 1 , Then Date-Time in Regional and convert to Solar/Local ; If 2 , Then Date-Time in Solar/Local and convert to Regional ; If 0 , Then Do Not Convert
% PlantInfo_Parameters = A Cell Structure containing the Solar Plant Static Data
% RelevantColumnPositions = A Scalar containing the Column Numbers of the original file selected and ordered as per application requirement 
% ExtraColumnPositions = A Scalr containing the extra Column Numbers of the original file selected and ordered as per user requirement 

%% Cleaning Solar Plant Data

%% Getting the Solar Plant Raw Data File in the MATLAB WorkSpace

% File Selection

[Filename,Pathname]=uigetfile({'*.*'},'Solar Plant Raw Data File Selector');

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

    [PlantCorrectlyArrangedDataSheet]=ColumnArrangerDataCleaner(PlantRawDataSheet_Cell,RelevantColumnPositions,ExtraColumnPositions,2); % 2 == Solar Plant

    PlantCorrectlyArrangedDataFile_Cell(1,i)={PlantCorrectlyArrangedDataSheet};
    
end

%% Putting Data in Corrected Rows and Columns using External Function

for i=1:DataFile_Cell_Len
    
    PlantCorrectlyArrangedDataSheet_Cell={PlantCorrectlyArrangedDataFile_Cell(1,i)};

    [PlantPreFillingCorrectedDataSheet]=PreFillingDataCleaner(PlantCorrectlyArrangedDataSheet_Cell,Headers,Res,hem,Ltm,L,Lat,DateTimeString_Processor1_OutputCell,NegativeCols,SolarRegionalTime,2); % 2 == Solar Plant

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
    
    Weather_Variables=[PlantPreFillingCorrectedData_Sheet(:,5:6),PlantPreFillingCorrectedData_Sheet(:,8)]; % Getting Weather Variable Columns
    
    Irradiance_Variable=PlantPreFillingCorrectedData_Sheet(:,7); % Getting Irradiance Column
    
    Generation_Variable=PlantPreFillingCorrectedData_Sheet(:,9); % Getting Generation Column
    
    if (ExtraColumnPositions_Len>0) % Extra Variables are present
        
        Extra_Variable=PlantPreFillingCorrectedData_Sheet(:,(10):end); % Getting Extra Columns
        
    end   
    
    % Combining Weather-Irradiance-Generation Columns with Date-Time Columns

    DTWeather_Cell=horzcat(DateTime_Variables,Weather_Variables);
    
    DTIrradiance_Cell=horzcat(DateTime_Variables,Irradiance_Variable);
    
    DTGeneration_Cell=horzcat(DateTime_Variables,Generation_Variable);
    
    if (ExtraColumnPositions_Len>0) % Extra Variables are present
        
        DTExtra_Cell=horzcat(DateTime_Variables,Extra_Variable);
        
    end       
    
    % Cleaning Weather File using External Function
    
    [ DTWeather_Cleaned_Cell ] = WeatherDataCleaner_ForecastMode( DTWeather_Cell,N );
    
    % Cleaning Irradiance File using External Function
    
    [ DTIrradiance_Cleaned_Cell ] = SolarPVIrradianceDataCleaner_ForecastMode( DTIrradiance_Cell,Res,Lat,GenIrrad,WeatherFileHourlyOrRes,PlantInfo_Parameters,SheetNum,SheetType );
    
    % Cleaning Generation File using External Function
    
    [ DTGeneration_Cleaned_Cell ] = SolarPVGenerationDataCleaner_ForecastMode( DTGeneration_Cell,DTWeather_Cleaned_Cell,Res,Lat,GenCapacity,GenIrrad,WeatherFileHourlyOrRes,DataCumulativeOrNot,PlantInfo_Parameters,SheetNum,SheetType   );
   
    % Cleaning Extra File using External Function
    
    if (ExtraColumnPositions_Len>0) % Extra Variables are present
        
        [ DTExtra_Cleaned_Cell ] = WeatherDataCleaner_ForecastMode( DTExtra_Cell,N );
        
    end      
    
    % Arranging the Cleaned Columns of Weather-Irradiance-Generation Appropriately
    
    if (ExtraColumnPositions_Len==0) % Extra Variable/s is/are not present
    
        PlantCleanedSheet_Cell=[DTWeather_Cleaned_Cell(:,1:(end-1)),DTIrradiance_Cleaned_Cell(:,end),DTWeather_Cleaned_Cell(:,end),DTGeneration_Cleaned_Cell(:,end)];
    
    elseif (ExtraColumnPositions_Len>0) % Extra Variable/s is/are present
        
        PlantCleanedSheet_Cell=[DTWeather_Cleaned_Cell(:,1:(end-1)),DTIrradiance_Cleaned_Cell(:,end),DTWeather_Cleaned_Cell(:,end),DTGeneration_Cleaned_Cell(:,end),DTExtra_Cleaned_Cell(:,5:end)];
        
    end
        
    PlantCleanedFile_Cell(1,i)={PlantCleanedSheet_Cell};
    
end

%% Creating a Proper File Name

Filename1 = strread(Filename,'%s','delimiter','_'); % Using '_' as Delimiter for removing File Extensions

Filename = Filename1{1,1};

filename = [Filename,'_ProcessedSolarPlantFile.xlsx'];

% Creating the Excel File

for i=1:length(PlantCleanedFile_Cell)
    
    PlantCleanedSheet_Cell=PlantCleanedFile_Cell{1,i};

    sheet = i;

    xlRange = 'A1';

    xlswrite(filename,PlantCleanedSheet_Cell,sheet,xlRange);

end



end

