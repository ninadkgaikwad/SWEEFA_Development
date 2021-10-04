function [ SummationDataMatrix ] = PVEnergySummationOfExcelFiles_1(DataAcquired, Type , DataSeriesNumVector)

%% Reading Excel Files 

%% Initializations

%Type=1; % 1==IntraDay, 2==Daily, 3==Monthly

% Computing Size of DataAcquired

[r,c,s]=size(DataAcquired);

% Computing Date-Time Column Number from Type

if (Type==1)
    
    DateTimeCol=4; % Intra-Day
    
elseif (Type==2)
    
    DateTimeCol=3; % Daily
    
elseif (Type==3)
    
    DateTimeCol=2; % Monthly
    
end

%% Extract Date Time Matrix

DateTime=DataAcquired(:,1:DateTimeCol,1);

% Computing Length of Data Series Numbers

DataSeriesLen=length(DataSeriesNumVector);

% Initializing Extracted Data Matrix

ExtractedDataMatrix=zeros(r,DateTimeCol+s,DataSeriesLen);

% Filling Date Time Columns in ExtractedDataMatrix

i=0; % Initialization

for i=1:DataSeriesLen

    ExtractedDataMatrix(:,1:DateTimeCol,i)=DateTime;

end

%% Isolation of Desired Data Series from All Excel Sheets

i=0; % Initialization

j=0; % Initialization

for i=1:DataSeriesLen % Data Series Number Level
    
    for j=1:s % Excel Sheet Number Level
        
        ExtractedDataMatrix(:,DateTimeCol+j,i)=DataAcquired(:,(DataSeriesNumVector(1,i)+DateTimeCol),j);
        
    end
    
end

% Computing Size of ExtractedDataMatrix

[row,col,sheet]=size(ExtractedDataMatrix);

% Initializing Summation Data Matrix

SummationDataMatrix=zeros(r,DateTimeCol+3,sheet);



%% Summation of Energy in ExtractedDataMatrix

i=0; % Initialization

for i=1:sheet % Sheet Number Level
    
    for j=1:r  % Row Number Level
    
        for k=(DateTimeCol+1):col % Column Number Level

               SummationDataMatrix(j,DateTimeCol+1,i)=SummationDataMatrix(j,DateTimeCol+1,i)+ExtractedDataMatrix(j,k,i);    

        end
        
    end
    
    % Computing Energies in kW
    
    SummationDataMatrix(:,DateTimeCol+2,i)=SummationDataMatrix(:,DateTimeCol+1,i)/(10^(3));
    
    % Computing Energies in MW
    
    SummationDataMatrix(:,DateTimeCol+3,i)=SummationDataMatrix(:,DateTimeCol+1,i)/(10^(6));    
    
    % Copying DateTime to SummationDataMatrix

    SummationDataMatrix(:,1:DateTimeCol,i)=DateTime;
        
end

%% Writing Summation Data Marix to Excel File

DataNames={'PVoutEnergy','INVpinEnergy','INVpoutEnergy','PgridEnergy','ArrayMismatchLossEnergy','ShadingLossEnergy','LIDLossEnergy','OhmicLossPEnergy','InverterLossEnergy','TrackerLossEnergy','TransformerLossPEnergy'};

if (Type==1) % Intra-Day
    
    % HorizontalExcelIntraDay={'Day','Month','Year','Time','Data (Wh)','Data (kWh)','Data (MWh)'};
    
    HorizontalExcel1={'Day','Month','Year','Time'};
    
    xlRange1='E1';
    
    filename = 'PVPlantSummationEnergy_IntraDay_File.xlsx';
    
elseif (Type==2) % Daily
    
   % HorizontalExcelDay={'Day','Month','Year','Data (Wh)','Data (kWh)','Data (MWh)'};
   
   HorizontalExcel1={'Day','Month','Year'};
   
   xlRange1='D1';
    
    filename = 'PVPlantSummationEnergy_Daily_File.xlsx';
    
elseif (Type==3) % Monthly
    
   % HorizontalExcelMonth={'Month','Year','Data (Wh)','Data (kWh)','Data (MWh)'};
   
   HorizontalExcel1={'Month','Year'};
   
   xlRange1='C1';
   
   filename = 'PVPlantSummationEnergy_Monthly_File.xlsx';
    
end 

    
    % Creating Excel Files from EnergyMATRIX Intra-Day Values
    
    for m=1:sheet    
     
       % Wrting First Part of Headers
       
       s = m;

       xlRange = 'A1';

       xlswrite(filename,HorizontalExcel1,s,xlRange); 
       
       % Writing Second Part of Headers
       
       s = m;

       xlRange = xlRange1;
       
       DataNameNum=DataSeriesNumVector(1,m);
       
       Header1=DataNames{1,DataNameNum};
                    
       HorizontalExcel2={strcat(Header1,' (Wh)'),strcat(Header1,' (kWh)'),strcat(Header1,' (MWh)')};
       
       xlswrite(filename,HorizontalExcel2,s,xlRange);
       
       % Writing Entire Data to the Current Sheet

       s = m;

       xlRange = 'A2';

       xlswrite(filename,SummationDataMatrix(:,:,m),s,xlRange); 
        
    end


end



