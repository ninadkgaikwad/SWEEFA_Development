function [ ProcessedData,Z,N ] = SolarPVIrradianceDataCleaner( Headers,Res,DataCols,hem,Ltm,L,Lat,GenIrrad,PlantInfo_Parameters,DateTimeString,NegativeCol,SolarRegionalTime )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% Headers = If Data File Contains Headers, then 1, otherwise 0
% Res = Time Step of the Data File in Minutes
% DataCols = Number of Columns in Data File Which Represents Data, other than date and time Columns
% Hem = 1 if Eastern Hemisphere; -1 if Western Hemisphere
% Ltm = Longitude for Regional Time Zone
% L = Logitude at Location
% Lat = Latitude at Location
% GenCapacity = Vector of Capacity in each Field (kW), used to calculate theoretical maximum value of of energy generated in one time step
% GenIrrad = Vector of numbers describing Data Columns to be either Generation Data (if, GenIrrad=1), or Irradiance Data (if, GeIrrad=0)
% WeatherFileHourlyOrRes  = If Weather Files i.e Temperature and WindSpeed Files are in Hourly Format then "1" if in Resolution Format the "0"
% DataCumulativeOrNot = If Data is Cumulative "1", if it is not Cumulative then "0", for each Column
% DateTimeString = Contains the Format String of the Date-Time Specification
% NegativeCol = A Vector containing column numbers of Data Columns which can have negative values
% SolarRegionalTime = A Scalar to indicate need for conversion of Date-Time Stamp ; If 1 , Then Date-Time in Regional and convert to Solar/Local ; If 2 , Then Date-Time in Solar/Local and convert to Regional ; If 0 , Then Do Not Convert

%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Irradiance Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[~ ,~,DataFile]=xlsread(Fullpathname,1);

% % Temprature File Selection
% [Filename,Pathname]=uigetfile({'*.*'},'Temperature File Selector');
% 
% Fullpathname=strcat(Pathname,Filename);
% 
% [Temp]=xlsread(Fullpathname,1);
% 
% % Wind File Selection
% [Filename,Pathname]=uigetfile({'*.*'},'Wind File Selector');
% 
% Fullpathname=strcat(Pathname,Filename);
% 
% [WS ]=xlsread(Fullpathname,1);

% Opening the PV Plant Information Sheet MATLAB Script

%% Processing Date-Time String using External Function

[ DateTimeString_Processor1_OutputCell ] = DateTimeString_Processor1( DateTimeString );

%% Plant Info Parameters

% From Script

%PVPlantInformationSheet;

% From PlantInfo_GUI

Pmod=PlantInfo_Parameters{1,1};
ModNum=PlantInfo_Parameters{1,2};
PVTech=PlantInfo_Parameters{1,3};
ModTemCF=PlantInfo_Parameters{1,4};
RainSnowMonths=PlantInfo_Parameters{1,5};
yr=PlantInfo_Parameters{1,6};
mr=PlantInfo_Parameters{1,7};
YearRain=PlantInfo_Parameters{1,8};
MonthRain=PlantInfo_Parameters{1,9};
OrientationType=PlantInfo_Parameters{1,10};
OrientationParameters=PlantInfo_Parameters{1,11};
SF=PlantInfo_Parameters{1,12};
LID=PlantInfo_Parameters{1,13};
LS=PlantInfo_Parameters{1,14};
Arraymismat=PlantInfo_Parameters{1,15};
OhmicLoss=PlantInfo_Parameters{1,16};
rho=PlantInfo_Parameters{1,17};
INVeff=PlantInfo_Parameters{1,18};
TransLoss=PlantInfo_Parameters{1,19};
Uo=PlantInfo_Parameters{1,20};
U1=PlantInfo_Parameters{1,21};
Shading=PlantInfo_Parameters{1,22};
bo=PlantInfo_Parameters{1,23};

%% Computing Data for getting EXACT ROWS and COLUMNS of the PROCESSED DATA FILE

% Finding Start and End Days of the Data Set
if Headers==1

    DateTimeStampStartday=DataFile{2,1};
    
    [ Day, Month, Year ] = DateTimeString_Processor2( DateTimeString_Processor1_OutputCell, DateTimeStampStartday );

    % Start day Information

    StartMonth=Month;

    StartDay=Day;

    StartYear=Year ;

    % End Day Information

    [rnum,colnum]=size(DataFile);

    DateTimeStampEndday=DataFile{rnum,1};

   [ Day, Month, Year ] = DateTimeString_Processor2( DateTimeString_Processor1_OutputCell, DateTimeStampEndday );

    EndMonth=Month;

    EndDay=Day;

    EndYear=Year;

elseif Headers==0
    
    % Start day Information

    DateTimeStampStartday=DataFile{1,1};
    
    [ Day, Month, Year ] = DateTimeString_Processor2( DateTimeString_Processor1_OutputCell, DateTimeStampStartday );

    % Start day Information

    StartMonth=Month;

    StartDay=Day;

    StartYear=Year ;

    % End Day Information

    [rnum,colnum]=size(DataFile);

    DateTimeStampEndday=DataFile{rnum,1};

   [ Day, Month, Year ] = DateTimeString_Processor2( DateTimeString_Processor1_OutputCell, DateTimeStampEndday );

    EndMonth=Month;

    EndDay=Day;

    EndYear=Year;

end

% Computing DataCols [Modification]
DataCols=colnum-1;

% Computing Rows And Columns for the Processed Data File using Pre-defined Function

[ Rows,Cols,TotDays ] = RowsColsToComputeDataCleaning( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,DataCols,4 );

% Initializing Processed Data File to zeros

ProcessedData=NaN(Rows,Cols); % Modification: From Zeros Array to NaN Array to improve Filling missing Data

% Initializing Data Captur Matrix to Zeros

DataCapture=zeros(1,DataCols);

% Getting Header Strings

if (Headers==1)
    
    % Getting Headers
    
    [~ ,~,DataFile]=xlsread(Fullpathname,1);
    
    % Getting the Header Text
    
    Header1 = DataFile(1,5:(DataCols+4));    
    
    % Clearing the not needed DataFile Variable
    
    clearvars DataFile
    
    Header = {'Day', 'Month', 'Year', 'Time'};
    
    % Concatenating Headers derived frome the Original File
    
    Header = [Header, Header1];    
    
elseif (Headers==0)
    
    Header = {'Day', 'Month', 'Year', 'Time'};
    
end


%% Putting Data into CORRECT ROWS & COLUMNS from Raw Data File to the Pre-Initialized Processed Data file

% Creating Date Time (Decimal Solar Time) Matrix for the given number of Days using Pre-Defined Function

[ DateTimeMatrix,~,TimeT ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,DataCols );

TimeT=TimeT'; % Converting Column Vector to Row Vector
len=length(TimeT); 

% Copying the DateTimeMatrix to the ProcessedData Matrix

ProcessedData(:,1:4)=DateTimeMatrix(:,1:4); % Modification: Parsing DateTimeMatrix exactly to maintain NaN in ProcessedData
[rrnum,ccnum]=size(ProcessedData);
len1=rrnum;
Up=1; % This variable will be updated whithin the following for loop to make UPDATEING FOR LOOP Dynamic to Compute FASTER

% Updating ProcessedData Data Columns in ProcessedData matrix for each row in Original Data File

for i=1:rnum
    
       if Headers==1 % Use Index as 'i+1'
           
           % Providing a BREAK SITUATION when index 'i' goes out of bounds
           Breaker=i+1;
           
           if Breaker>rnum
               
               break;
               
           end
           
           % Reading Date Time Signature of Current Data Row
           
            DateTimeStamp=DataFile{i+1,1};

            [ Day, Month, Year, Hour, Min, Sec, AMPM, AMPM_Indicator ] = DateTimeString_Processor2( DateTimeString_Processor1_OutputCell, {DateTimeStamp} );

            DayAmPm=AMPM;

            [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

            if (AMPM_Indicator==1) % AM/PM String are Present-Indicating 12 Hour Time Signatures
            
                AmPm=strcmp(DayAmPm,'AM')||strcmp(DayAmPm,'Am')||strcmp(DayAmPm,'am');

                if AmPm==1

                    [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

                elseif AmPm==0

                    if (TimeDeci>=12)&&(TimeDeci<=13)

                       [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

                    else

                       [ TimeDeci ] = HMToDeci( Hour,Min,Sec )+12;

                    end

                end 
                
            end
            
            % Reading Data from the Current Row of DataFile into DataCapture Vector
            for k=2:(DataCols+1)
                
                DataCapture(1,k-1)=DataFile{i+1,k};
                
                if (DataCapture(1,k-1)<0) % [Modified]Converting NEGATIVE Values to ZEROS only for Variables other than Temperature Column
                    
                    for m = 1:length(NegativeCol)
                        
                        if ((k-1)~=NegativeCol(1,m))
                            
                            DataCapture(1,k-1)=0; 
                            
                        end
                        
                    end                 
                 
                
                end
                
            end
            
            % Converting Time based on SolarRegionalTime
            
            if (SolarRegionalTime==1) % Date-Time in Regional convert to Solar/Local Date-Time
                
                %Finding the Julian Day for Current Date using Pre-defined Function
                [n]=JulianDay(Day,Month,Year); 
                
                %Converting TimeDeci to Solar Time 
                [ TimeDeci] = ClockToSolarTime( n,hem,Ltm,L,TimeDeci); 
                        
            elseif (SolarRegionalTime==2) % Date-Time in Solar/Local convert to Regional Date-Time
                
                %Finding the Julian Day for Current Date using Pre-defined Function
                [n]=JulianDay(Day,Month,Year); 
                
                %Converting TimeDeci to Regional Time 
                [ TimeDeci] = SolarToClockTime( n,hem,Ltm,L,TimeDeci);                 
                
            elseif (SolarRegionalTime==0) % Use the Same Date-Time Stamp
                
                TimeDeci = TimeDeci;
                
            end 
            
            % Updating Day, Month & Year for TimeDeci<0 and TimeDeci>24
            
            if ((TimeDeci<0)&&(Day==StartDay)&&(Month==StartMonth)&&(Year==StartYear)) % Leave Out the Data Points
                
                Indicator1=1;
                
            elseif ((TimeDeci>24)&&(Day==EndDay)&&(Month==EndMonth)&&(Year==EndYear)) % Leave Out the Data Points                
                
                Indicator1=1;
                
            elseif ((TimeDeci>=0)&&(TimeDeci<=24)) % Use the Normal Method
                
                Indicator1=2;
                
            elseif (TimeDeci<0) % Decrease the Day by 1
                                
                Indicator1=2;
                
                % Finding Corrected TimeDeci
                
                TimeDeci=24-abs(TimeDeci);
                
                % Reducing Day By 1
                
                Date_1=datetime(Year,Month,Day);
                
                Date_1=Date_1-1;
                
                % Getting Updated Day, Month and Year
                
                Day=Date_1.Day;
                
                Month=Date_1.Month;
                
                Year=Date_1.Year;
                
            elseif (TimeDeci>24) % Increase the Day by 1       
                            
                Indicator1=2;
                
                % Finding Corrected TimeDeci
                
                TimeDeci=TimeDeci-24;
                
                % Increasing Day By 1
                
                Date_1=datetime(Year,Month,Day);
                
                Date_1=Date_1+1;
                
                % Getting Updated Day, Month and Year
                
                Day=Date_1.Day;
                
                Month=Date_1.Month;
                
                Year=Date_1.Year;
                
            else
                
                Indicator1=2;
                                
            end
            
            if (Indicator1==1)
                
                % Do not save the data as it lies outside the ranges of DateTime Matrix
                                
            elseif (Indicator1==2)
                
                % Finding Corrected Time value for Time Deci as per the Time Signature of ProcessedData Matrix
                for j=1:len

                    diffrence(1,j)=abs(TimeDeci-TimeT(1,j));

                end

                [M,I]=min(diffrence);

                T=TimeT(1,I); % Corrected Time Value 

                % Computing CORRECT INDEX (Using: Day, Month, Year and T) of the ProcessesdData Matrix where the Current Data should be Stored

                for l=Up:len1

                    if (Day==ProcessedData(l,1))&&(Month==ProcessedData(l,2))&&(Year==ProcessedData(l,3))&&(T==ProcessedData(l,4))

                      break; 

                    end                

                end

                Up=Up+1; % Updating Loop Starting Point for Faster Computation

                % Storing Data from DataCapture Matrix to the ProcessedData Matrix at the Correct Location (Given by INDEX 'l')

                for m=1:DataCols

                    ProcessedData(l,m+4)=DataCapture(1,m);                

                end               
                
            end
           
       elseif Headers==0 % Use Index as 'i'
           
           % Reading Date Time Signature of Current Data Row
           
            DateTimeStamp=DataFile{i,1};

            [ Day, Month, Year, Hour, Min, Sec, AMPM, AMPM_Indicator ] = DateTimeString_Processor2( DateTimeString_Processor1_OutputCell, {DateTimeStamp} );

            DayAmPm=AMPM;
            
            [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

            if (AMPM_Indicator==1) % AM/PM String are Present-Indicating 12 Hour Time Signatures
            
                AmPm=strcmp(DayAmPm,'AM')||strcmp(DayAmPm,'Am')||strcmp(DayAmPm,'am');

                if AmPm==1

                    [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

                elseif AmPm==0

                    if (TimeDeci>=12)&&(TimeDeci<=13)

                       [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

                    else

                       [ TimeDeci ] = HMToDeci( Hour,Min,Sec )+12;

                    end

                end 
                
            end
            
            % Reading Data from the Current Row of DataFile into DataCapture Vector
            for k=2:(DataCols+1)
                
                DataCapture(1,k-1)=DataFile{i+1,k};
                
                if (DataCapture(1,k-1)<0) % [Modified]Converting NEGATIVE Values to ZEROS only for Variables other than Temperature Column
                    
                    for m = 1:length(NegativeCol)
                        
                        if ((k-1)~=NegativeCol(1,m))
                            
                            DataCapture(1,k-1)=0; 
                            
                        end
                        
                    end                 
                 
                
                end
                
            end
            
            % Converting Time based on SolarRegionalTime
            
            if (SolarRegionalTime==1) % Date-Time in Regional convert to Solar/Local Date-Time
                
                %Finding the Julian Day for Current Date using Pre-defined Function
                [n]=JulianDay(Day,Month,Year); 
                
                %Converting TimeDeci to Solar Time 
                [ TimeDeci] = ClockToSolarTime( n,hem,Ltm,L,TimeDeci); 
                        
            elseif (SolarRegionalTime==2) % Date-Time in Solar/Local convert to Regional Date-Time
                
                %Finding the Julian Day for Current Date using Pre-defined Function
                [n]=JulianDay(Day,Month,Year);  
                
                %Converting TimeDeci to Regional Time 
                [ TimeDeci] = SolarToClockTime( n,hem,Ltm,L,TimeDeci);                 
                
            elseif (SolarRegionalTime==0) % Use the Same Date-Time Stamp
                
                TimeDeci = TimeDeci;
                
            end          
                        
            % Updating Day, Month & Year for TimeDeci<0 and TimeDeci>24
            
            if ((TimeDeci<0)&&(Day==StartDay)&&(Month==StartMonth)&&(Year==StartYear)) % Leave Out the Data Points
                
                Indicator1=1;
                
            elseif ((TimeDeci>24)&&(Day==EndDay)&&(Month==EndMonth)&&(Year==EndYear)) % Leave Out the Data Points                
                
                Indicator1=1;
                
            elseif ((TimeDeci>=0)&&(TimeDeci<=24)) % Use the Normal Method
                
                Indicator1=2;
                
            elseif (TimeDeci<0) % Decrease the Day by 1
                                
                Indicator1=2;
                
                % Finding Corrected TimeDeci
                
                TimeDeci=24-abs(TimeDeci);
                
                % Reducing Day By 1
                
                Date_1=datetime(Year,Month,Day);
                
                Date_1=Date_1-1;
                
                % Getting Updated Day, Month and Year
                
                Day=Date_1.Day;
                
                Month=Date_1.Month;
                
                Year=Date_1.Year;
                
            elseif (TimeDeci>24) % Increase the Day by 1       
                            
                Indicator1=2;
                
                % Finding Corrected TimeDeci
                
                TimeDeci=TimeDeci-24;
                
                % Increasing Day By 1
                
                Date_1=datetime(Year,Month,Day);
                
                Date_1=Date_1+1;
                
                % Getting Updated Day, Month and Year
                
                Day=Date_1.Day;
                
                Month=Date_1.Month;
                
                Year=Date_1.Year;
                
            else
                
                Indicator1=2;
                                
            end
            
            if (Indicator1==1)
                
                % Do not save the data as it lies outside the ranges of DateTime Matrix
                                
            elseif (Indicator1==2)
                
                % Finding Corrected Time value for Time Deci as per the Time Signature of ProcessedData Matrix
                for j=1:len

                    diffrence(1,j)=abs(TimeDeci-TimeT(1,j));

                end

                [M,I]=min(diffrence);

                T=TimeT(1,I); % Corrected Time Value 

                % Computing CORRECT INDEX (Using: Day, Month, Year and T) of the ProcessesdData Matrix where the Current Data should be Stored

                for l=Up:len1

                    if (Day==ProcessedData(l,1))&&(Month==ProcessedData(l,2))&&(Year==ProcessedData(l,3))&&(T==ProcessedData(l,4))

                      break; 

                    end                

                end

                Up=Up+1; % Updating Loop Starting Point for Faster Computation

                % Storing Data from DataCapture Matrix to the ProcessedData Matrix at the Correct Location (Given by INDEX 'l')

                for m=1:DataCols

                    ProcessedData(l,m+4)=DataCapture(1,m);                

                end               
                
            end
            
           
       end
    
end

% %% Converting the CUMULATIVE DATA into ACTUAL DATA using a Pre-defined Function
% if DataCumulativeOrNot==1
% 
%     [ActualData,len1]=CumulativeGenToActual(ProcessedData,Res,GenCapacity,rrnum,DataCols,TotDays,len,Lat);
% 
%     ProcessedData=ActualData;
% 
% end

%% Finding Missing Data 


% FOR LOOP for Day-Wise finding of Missing Data

DayDataPoints=24*(60/Res); % Total Data Points in ONE DAY

Count=0; % Counter for EXACT ROW NUMBER

Z=zeros(DayDataPoints,TotDays,DataCols); % Initializing 3D-Matrix for Mapping Zeros in ONE DAY
N=zeros(DayDataPoints,TotDays,DataCols); % Initializing 3D-Matrix for Mapping NaN in ONE DAY

for i=1:TotDays
    
     % Checking Total Number of ZERO VALUES in CURRENT DAY
     
     for j=(Count+1):(i*DayDataPoints)
         
         % Checking Total Number of ZERO/NaN VALUES in EACH DATA COLUMN
         
         for k=5:5+(DataCols-1)
             
             if ProcessedData(j,k)==0
                 
                 Z((j-((i-1)*DayDataPoints)),i,(k-4))=1;
                 
             elseif isnan(ProcessedData(j,k))
                 
                 N((j-((i-1)*DayDataPoints)),i,(k-4))=1;
                 
             else
                 
                 Z((j-((i-1)*DayDataPoints)),i,(k-4))=0;
                 
                 N((j-((i-1)*DayDataPoints)),i,(k-4))=0;
                 
             end
             
         end
         
     end
     
     % Updating Exact Row Counter
     
     Count=Count+DayDataPoints;       
         
    
end

%% Filling  Missing Data in COMPLETELY EMPTY DAYS & DAYS with NaN VALUES

% Res=5;
% TotDays=363;
% len1=4;
% DataCols=5;
% Lat=23.275;
  
DayDataPoints=24*(60/Res);

% Computing Year Vector for use in the ClearnessIndexDataCleaner Function inside SolarPVEnergySimulationPointWiseSim1 Function

  NumYear=EndYear-StartYear; % Computing Number of Years of Data
  
  OneVector=ones(1,(NumYear+1)); % Creating One Vector
  
  x=find(OneVector); % Creating Incrementing Index for the FOR LOOP
  
  for ii=x % FOR LOOP for creating the Year Vector
      
      if ii==1
          
        Years(1,ii)=StartYear;
        
      end
      
      Years(1,ii)=StartYear+(ii-1);
      
      if Years(1,ii)==EndYear
          
         break; 
          
      end
      
      
  end

% FOR LOOP for Days

for i=1:TotDays
    
    % Finding Julian Day for the Given Day
    
    RowForDate=(DayDataPoints*(i-1))+1; % Row Number for Starting of New Day
    
    Month=ProcessedData(RowForDate,2);

    Day=ProcessedData(RowForDate,1);

    Year=ProcessedData(RowForDate,3);
    
    [n]=JulianDay(Day,Month,Year); % Actual Call to the Pre-defined Function
    
    % Finding the SunRise and SunSet for the particular Day using Pre-defined Function

    [~,~,~,~,Sr,Ss,~] = Sun1(n,Lat,Res);
    
    T1=find(TimeT>=Sr); % Getting Indices Greater Than Sr

    T2=find(TimeT<=Ss); % Getting Indices Lesser Than Ss

    T=intersect(T1,T2); % Getting Indices Between Sr and Ss
    
    % FOR LOOP for Data Columns
    
    for k=1:DataCols
        
        % Checking for ALL ZEROS and NaN Values (i.e Data Points that day are EMPTY or UNFILLED)
        
        ZeroCheck1=find(Z(:,i,k));
        
        ZeroCheck=intersect(T,ZeroCheck1);
        
        NaNCheck1=find(N(:,i,k));
        
        NaNCheck=intersect(T,NaNCheck1);
        
        PercentNaNValues=(length(NaNCheck)/length(T))*100;
        
        PercentZeroValues=(length(ZeroCheck)/length(T))*100;
        
        PercentUnknownValues=((length(ZeroCheck)+length(NaNCheck))/length(T))*100;
        
        if length(NaNCheck1)==DayDataPoints % length(ZeroCheck)==DayDataPoints % Use PV Energy Evaluation Model to fill missing DATA
            
            Index=NaNCheck1;
            
            [ ProcessedData,PgridEnergy,Irradiance] = SolarPVEnergySimulationPointWiseSim1(ProcessedData,GenIrrad,WeatherFileHourlyOrRes,n,Index,i,k,Lat,Pmod,PVTech,ModNum,ModTemCF,SF,LID,LS,Arraymismat,OhmicLoss,rho,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,Years,RainSnowMonths,yr,mr,YearRain,MonthRain,Res) ;
            
                        
        elseif (PercentNaNValues>30) % Use PV Energy Evaluation Model to fill missing DATA
            
            Index=[NaNCheck1];
            
            [ProcessedData, PgridEnergy,Irradiance] = SolarPVEnergySimulationPointWiseSim1(ProcessedData,GenIrrad,WeatherFileHourlyOrRes,n,Index,i,k,Lat,Pmod,PVTech,ModNum,ModTemCF,SF,LID,LS,Arraymismat,OhmicLoss,rho,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,Years,RainSnowMonths,yr,mr,YearRain,MonthRain,Res) ;
            
        elseif ((PercentNaNValues<=30)&&(PercentNaNValues>0)) % Use CurveFitting Method by Gauss1
            
            Index=[NaNCheck1];
            
            % Using Pre-defined Function for CurveFitting
            
            [ ProcessedData ] = PVGenerationCurveFitting( ProcessedData,i,k,Res,Lat,n,Index );
            
%         elseif (length(ZeroCheck)~=DayDataPoints)&&(length(NaNCheck)==0) % Optimal Data is present in the given DAY
%             
%             break                       
              
        end
        
        
    end
    
    
end

% Filling NaNs Outside Sr-Ss to zeros

for hh=1:rrnum    
    
    for jj=1:DataCols
        
       if (isnan(ProcessedData(hh,(4+DataCols)))) 
           
           ProcessedData(hh,(4+DataCols))=0;
           
       end
        
    end    
    
end


%% Creating a Proper File Name

Filename1 = strread(Filename,'%s','delimiter','_'); % Using '_' as Delimiter for removing File Extensions

Filename = Filename1{1,1};

filename = [Filename,'_ProcessedIrradianceFile.xlsx'];

% Wrting the Header

if (Headers==1)
    
    % Getting Headers
    
    [~ ,~,DataFile]=xlsread(Fullpathname,1);
    
    % Getting the Header Text
    
    Header1 = DataFile(1,5:(DataCols+4));    
    
    % Clearing the not needed DataFile Variable
    
    clearvars DataFile
    
    Header = {'Day', 'Month', 'Year', 'Time'};
    
    % Concatenating Headers derived frome the Original File
    
    Header = [Header, Header1];    
    
elseif (Headers==0)
    
    Header = {'Day', 'Month', 'Year', 'Time'};
    
end

sheet = 1;

xlRange = 'A1';

xlswrite(filename,Header,sheet,xlRange);

% Wrting the Cleaned Data

sheet = 1;

xlRange = 'A2';

xlswrite(filename,ProcessedData1,sheet,xlRange);


end



