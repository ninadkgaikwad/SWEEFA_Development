function [ProcessedData]=Extract_PostProcess_NETCDFVariables(Fullpathname, DateTime_Index, Plant_Index, UTCTimeDiff, AdditionalFields, LatLongFile, AltFile,Netcdf_Total_GUI_Var)

%% Function Details:

% Fullpathname = The full path of the NETCDF File location
% DateTime_Index = If DateTime_Index=1, Then No Conversion of Date-Time Stamp to Regional Time ; If DateTime_Index=2, Then Conversion of Date-Time Stamp to Regional Time
% Plant_Index = If Plant_Index=1, Then Wind Plant is Selected  ; If Plant_Index=1, Then Solar Plant is Selected
% UTCTimeDiff = The relative time difference between the Regional Time and UTC Time in decimal hours
% AdditionalFields = A string of Comma separated additional NETCDF Variables to be extracted
% LatLongFile = A matrix(n,2) with Latitudes in the 1st column and Longitudes in the 2nd column
% AltFile = A Vector(n,1) with Altitudes in 1st column


%% Getting the WRF-NETCDF File and Storing its Maximum details in a Text File

    clc;

    % Creating File CommandLine_Output to store Netcdf File Details
    diary('FileCompleteDetails')

    diary on;

    ncdisp(Fullpathname);

    diary off;

    output=fileread('FileCompleteDetails');
    
    %output1 = convertCharsToStrings(output);
    %% Note:
    %Displaying File Data to Edit Box 
    set(Netcdf_Total_GUI_Var,'string',output);  %Note: The handles.Netcdf_Total variable is out of Scope for the External Function
    

%% Creating List of Variables to be Extracted from the WRF-NETCDF File

% Creating List of Static Variables to be Extracted according to PlantIndex
if (Plant_Index==1) % Wind Plant is Selected
    
    WRFNetcdf_StaticVariables = {'U10', 'V10', 'T2', 'SINALPHA', 'COSALPHA'};
    
elseif (Plant_Index==2) % Solar Plant is Selected
    
    WRFNetcdf_StaticVariables = {'U10', 'V10', 'T2', 'SWDOWN'};
    
end

% Creating AdditionalFields List
AdditionalFields_Cell = strsplit(AdditionalFields,',');

Len1=length(AdditionalFields_Cell);

% Concatenating both the Static and Additional Field List Cells according to AdditionalFields_Cell contents
if (Len1==1) % May or may not contain Correct Field Name
    
    % Checking for empty or one correct Field Name
    
    startIndex = regexp(AdditionalFields_Cell{1,1},'\w'); % Regular Expression for finding the StartIndex of any Alphanumeric character in the AdditionalFields_Cell
    
    if (isempty(startIndex)) % No additional fields requested by the User
        
        WRFNetcdf_AllVariables=[WRFNetcdf_StaticVariables];
        
    else % One Additional Field requested by the User
        
        WRFNetcdf_AllVariables=[WRFNetcdf_StaticVariables, AdditionalFields_Cell];
        
    end
    
elseif (Len1>1) % Contains Correct Field Names
    
    WRFNetcdf_AllVariables=[WRFNetcdf_StaticVariables, AdditionalFields_Cell];
    
end

% Computing the Length of WRFNetcdf_AllVariables

Len_WRFNetcdf_AllVariables=length(WRFNetcdf_AllVariables);

%% Converting String DateTimes to D-M-Y-T Format

% Getting The Time Varible from the WRF-NETCDF File

VarDataTime = ncread(Fullpathname,'Times');

Times=VarDataTime;

Times=Times';

[r,c]=size(Times);

TimesCell=cell(r,1);

for i=1:r

TimesCell(i,1)={Times(i,:)};

end

% Converting the TimesCell into D-M-Y-T Numeric Matrix according to DateTime_Index and UTCTimeDiff Using External Function
if (DateTime_Index==1) % Do not convert to Regional Time
    
    [ DateTime_Matrix ] = WRFDateTimeStamp_Converter( TimesCell,UTCTimeDiff);
    
elseif (DateTime_Index==2) % Convert to Regional Time
    
    [ DateTime_Matrix ] = WRFDateTimeStamp_Converter( TimesCell,UTCTimeDiff);
    
end

%% Initial Set-Up for Extracting Every Variable in the List Appropriately
% Calculation of Heights ; z = (PH + PHB)/9.81 

% Computing the Size of the LatLong and Alt Files [LatLong and Alt Files will/should have equal Row Lengh] 

[LatLongFile_Row, LatLong_Col]=size(LatLongFile);

[AltFile_Row, Alt_Col]=size(AltFile);

% Getting the XLAT, XLONG, PH and PHB from the WRF-NETCDF File

LongData = ncread(Fullpathname,'XLONG');

LatData = ncread(Fullpathname,'XLAT');

PH_Data = ncread(Fullpathname,'PH');

PHB_Data = ncread(Fullpathname,'PHB');

% Computing the M_Grid_LocationMatrix : [Row_Index, Col_Index, Z_Index]

M_Grid_LocationMatrix=zeros(1,3); % Initializing M_Grid_LocationMatrix

for i=1:LatLongFile_Row
    
    % Computing Row_Index and Col_Index using External Function
    
    [ Row_Index, Col_Index ] = WRFNetcdf_HorizontalGrid_CellFinder(LongData, LatData, LatLongFile(i,1), LatLongFile(i,2) );
    
    % Computing Z_Index using External Function
    
    [ Z_Index ] = WRFNetcdf_VerticalGrid_CellFinder( PH_Data, PHB_Data, Row_Index, Col_Index, AltFile(i,1) );
    
    % Filling the M_Grid_LocationMatrix
    
    M_Grid_LocationMatrix(i,:)=[Row_Index, Col_Index, Z_Index];
    
end

% Creating the WRFNetcdf_MetaData_Cell [Size, Dimensions, Coordinates] using an External Function

[WRFNetcdf_MetaData_Cell] = WRFNetcdf_Metadata_Parser(WRFNetcdf_AllVariables, Len_WRFNetcdf_AllVariables);

%% Creating WRFNetcdf_AllVariables_DateTime_Matrix

WRFNetcdf_AllVariables_DateTime_Matrix=zeros(r,4,LatLongFile_Row); % Initializing WRFNetcdf_AllVariables_DateTime_Matrix

for i=1:LatLongFile_Row
    
    WRFNetcdf_AllVariables_DateTime_Matrix(:,:,i)=DateTime_Matrix;
    
end

%% Extracting Every Variable in the List Appropriately

% Initializing WRFNetcdf_AllVariable_ALLLocation

WRFNetcdf_AllVariable_ALLLocation=zeros(r,Len_WRFNetcdf_AllVariables,LatLongFile_Row);

for i=1:LatLongFile_Row % For each Lat-Long-Alt of a particular Plant/PlantEntity
    
    % Initializing WRFNetcdf_AllVariable_OneLocation
    
    WRFNetcdf_AllVariable_OneLocation=zeros(r,Len_WRFNetcdf_AllVariables);
    
    % Getting the appropriate contents from M_Grid_LocationMatrix
    
    Row_Index=M_Grid_LocationMatrix(i,1);
    Col_Index=M_Grid_LocationMatrix(i,2);
    Z_Index=M_Grid_LocationMatrix(i,3);
    
    for j=1:Len_WRFNetcdf_AllVariables % For each WRF-NETCDF Variable
        
        % Getting the Variable Name
        
        Var_Name=WRFNetcdf_AllVariables{1,j};
        
        % Getting the appropriate contents from WRFNetcdf_MetaData_Cell
        
        Var_Size=WRFNetcdf_MetaData_Cell{j,1};
        Var_Dimensions=WRFNetcdf_MetaData_Cell{j,2};
        Var_Coordinates=WRFNetcdf_MetaData_Cell{j,3};
        
        % Extracting the Single WRF-NETCDF Variable using External Function
        
        WRFNetcdf_AllVariable_OneLocation(:,j)=WRFNetcdf_SingleVariable_Extractor(Fullpathname,Var_Name,Var_Size,Var_Dimensions,Var_Coordinates,Row_Index, Col_Index, Z_Index,r);
        
    end
    
    % Filling WRFNetcdf_AllVariable_ALLLocation
    
    WRFNetcdf_AllVariable_ALLLocation(:,:,i)=WRFNetcdf_AllVariable_OneLocation;
    
end

%% Post-Processing of the Known WRF-NETCDF Variables

% Dividing WRFNetcdf_AllVariable_ALLLocation based on Known and Unknown Variables
 
if (Len_WRFNetcdf_AllVariables==length(WRFNetcdf_StaticVariables)) % No Additional Fields Requested by the User

    WRFnetcdf_KnownVariables=WRFNetcdf_AllVariable_ALLLocation;

    WRFnetcdf_UnKnownVariables=[];

else % Additional Fields Requested by the User

    WRFnetcdf_KnownVariables=WRFNetcdf_AllVariable_ALLLocation(:,1:length(WRFNetcdf_StaticVariables),:);

    WRFnetcdf_UnKnownVariables=WRFNetcdf_AllVariable_ALLLocation(:,(length(WRFNetcdf_StaticVariables)+1):end,:);       

end
    
% Post-Processing the WRFnetcdf_KnownVariables using External Function

[WRFNetcdf_KnownVariables_PostProcessed] = WRFNetcdf_KnownVariables_PostProcessor(WRFnetcdf_KnownVariables,Plant_Index);

% Concatenating WRFNetcdf_KnownVariables_PostProcessed, WRFnetcdf_UnKnownVariables

WRFNetcdf_AllVariables_PostProcessed = horzcat(WRFNetcdf_KnownVariables_PostProcessed,WRFnetcdf_UnKnownVariables);

[Row_WRFNetcdf_AllVariables_PostProcessed,Len_WRFNetcdf_AllVariables_PostProcessed]=size(WRFNetcdf_AllVariables_PostProcessed);

% Concatenating WRFNetcdf_AllVariables_DateTime_Matrix and WRFNetcdf_AllVariables_PostProcessed

WRFNetcdf_AllVariables_CompleteMatrix=horzcat(WRFNetcdf_AllVariables_DateTime_Matrix,WRFNetcdf_AllVariables_PostProcessed);

% Computing WRFNetcdf_AllVariables_AverageMatrix

WRFNetcdf_AllVariables_AverageMatrix=zeros(r,(Len_WRFNetcdf_AllVariables_PostProcessed+4)); % Initializing WRFNetcdf_AllVariables_AverageMatrix

WRFNetcdf_AllVariables_AverageMatrix(:,1:4)=DateTime_Matrix;

for i=5:(Len_WRFNetcdf_AllVariables_PostProcessed+4) % For Each WRF-NETCDF Column  
   
   for j=1:r % For Each Date-Time Stamp
      
       for k=1:LatLongFile_Row
           
           % Summing the Same Variable at Same Date-Time Stamp over all Locations           
       
           WRFNetcdf_AllVariables_AverageMatrix(j,i)=WRFNetcdf_AllVariables_AverageMatrix(j,i)+WRFNetcdf_AllVariables_CompleteMatrix(j,i,k);
       
       end
       
       % Averaging the Variable over all Locations
       if (i==8) % Not averaging Plant Status
           
           % Do Nothing
           
       else % Averaging all variables other than Plant Status
           
           WRFNetcdf_AllVariables_AverageMatrix(j,i)=WRFNetcdf_AllVariables_AverageMatrix(j,i)/LatLongFile_Row;
           
       end
              
   end
    
end

%% Deleting the FileCompleteDetails Text File

delete('FileCompleteDetails');

%% Creating Output for the Function

ProcessedData={WRFNetcdf_AllVariables_CompleteMatrix,WRFNetcdf_AllVariables_AverageMatrix};

%% Creating Appropriate Excel File Outputs

% Creating Excel File for WRFNetcdf_AllVariables_CompleteMatrix

% Creating Headers for the Excel Files
if (Plant_Index==1) % Wind Plant is Selected
    
    StaticHeader={'Day','Month','Year', 'Time', 'Wind Speed','Temperature','Wind Direction','Turbine Status'};

    if (Len1==1) % May or may not contain Correct Field Name

        % Checking for empty or one correct Field Name

        startIndex = regexp(AdditionalFields_Cell{1,1},'\w'); % Regular Expression for finding the StartIndex of any Alphanumeric character in the AdditionalFields_Cell

        if (isempty(startIndex)) % No additional fields requested by the User

            WRFNetcdf_Header=[StaticHeader];

        else % One Additional Field requested by the User

            WRFNetcdf_Header=[StaticHeader, AdditionalFields_Cell];

        end

    elseif (Len1>1) % Contains Correct Field Names

        WRFNetcdf_Header=[StaticHeader, AdditionalFields_Cell];

    end   
    
    FileName='WindPlant';
    
else (Plant_Index==2) % Solar Plant is Selected
    
    StaticHeader={'Day','Month','Year', 'Time', 'Wind Speed','Temperature','Irradiance','Plant Status'};
    
    if (Len1==1) % May or may not contain Correct Field Name

        % Checking for empty or one correct Field Name

        startIndex = regexp(AdditionalFields_Cell{1,1},'\w'); % Regular Expression for finding the StartIndex of any Alphanumeric character in the AdditionalFields_Cell

        if (isempty(startIndex)) % No additional fields requested by the User

            WRFNetcdf_Header=[StaticHeader];

        else % One Additional Field requested by the User

            WRFNetcdf_Header=[StaticHeader, AdditionalFields_Cell];

        end

    elseif (Len1>1) % Contains Correct Field Names

        WRFNetcdf_Header=[StaticHeader, AdditionalFields_Cell];

    end    
    
    FileName='SolarPlant';
    
end

% Creating Excel Files 

for m=1:LatLongFile_Row

   filename = [FileName,'WRF-NETCDF_CompleteFile.xlsx'];

   sheet = m;

   xlRange = 'A1';

   xlswrite(filename,WRFNetcdf_Header,sheet,xlRange);       

   sheet = m;

   xlRange = 'A2';

   xlswrite(filename,WRFNetcdf_AllVariables_CompleteMatrix(:,:,m),sheet,xlRange); 

end



% Creating Excel File for WRFNetcdf_AllVariables_AverageMatrix

% Creating Headers for the Excel Files
if (Plant_Index==1) % Wind Plant is Selected
    
    StaticHeader={'Day','Month','Year', 'Time', 'Wind Speed','Temperature','Wind Direction','Plant Status'};
    
else (Plant_Index==2) % Solar Plant is Selected
    
    StaticHeader={'Day','Month','Year', 'Time', 'Wind Speed','Temperature','Irradiance','Plant Status'};
    
    
end

% Creating Excel Files 

filename = [FileName,'WRF-NETCDF_AveragedFile.xlsx'];

sheet = 1;

xlRange = 'A1';

xlswrite(filename,WRFNetcdf_Header,sheet,xlRange);       

sheet = 1;

xlRange = 'A2';

xlswrite(filename,WRFNetcdf_AllVariables_AverageMatrix,sheet,xlRange); 

end

