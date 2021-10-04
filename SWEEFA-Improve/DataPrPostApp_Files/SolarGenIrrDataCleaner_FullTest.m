Headers=[1];
Res=[5];
DataCols=[1];
hem =[1];
Ltm=[82.5];
L=[72.682831];
Lat=[23.275];
GenCapacity=[500];
GenIrrad=[1];
WeatherFileHourlyOrRes=[0];
DataCumulativeOrNot=[1];


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
% GenIrrad = Vector of numbers describing Data Columns to be either Generation Data (if, GenIrrad=1), or Irradiance Data (if, GenIrrad=0)
% WeatherFileHourlyOrRes  = If Weather Files i.e Temperature and WindSpeed Files are in Hourly Format then "1" if in Resolution Format the "0"
% DataCumulativeOrNot = If Data is Cumulative "1", if it is not Cumulative then "0", for each Column

%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[~ ,~,DataFile]=xlsread(Fullpathname,1);

% Temprature File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Temperature File Selector');

Fullpathname=strcat(Pathname,Filename);

[Temp]=xlsread(Fullpathname,1);

% Wind File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Wind File Selector');

Fullpathname=strcat(Pathname,Filename);

[WS ]=xlsread(Fullpathname,1);

% Opening the PV Plant Information Sheet MATLAB Script

PVPlantInformationSheet;


%% Computing Data for getting EXACT ROWS and COLUMNS of the PROCESSED DATA FILE

% Finding Start and End Days of the Data Set
if Headers==1

    DateTimeStampStartday=strread(DataFile{2,1},'%s','delimiter',' ');

    % Start day Information

    StartDate=strread(DateTimeStampStartday{1,1},'%f','delimiter','/');

    StartMonth=StartDate(1,1);

    StartDay=StartDate(2,1);

    StartYear=StartDate(3,1);

    % End Day Information

    [rnum,colnum]=size(DataFile);

    DateTimeStampEndday=strread(DataFile{rnum,1},'%s','delimiter',' ');

    EndDate=strread(DateTimeStampEndday{1,1},'%f','delimiter','/');

    EndMonth=EndDate(1,1);

    EndDay=EndDate(2,1);

    EndYear=EndDate(3,1);

elseif Headers==0
    
    DateTimeStampStartday=strread(DataFile{1,1},'%s','delimiter',' ');

    % Start day Information

    StartDate=strread(DateTimeStampStartday{1,1},'%f','delimiter','/');

    StartMonth=StartDate(1,1);

    StartDay=StartDate(2,1);

    StartYear=StartDate(3,1);

    % End Day Information

    [rnum,colnum]=size(DataFile);

    DateTimeStampEndday=strread(DataFile{rnum,1},'%s','delimiter',' ');

    EndDate=strread(DateTimeStampEndday{1,1},'%f','delimiter','/');

    EndMonth=EndDate(1,1);

    EndDay=EndDate(2,1);

    EndYear=EndDate(3,1);

end

% Computing Rows And Columns for the Processed Data File using Pre-defined Function

[ Rows,Cols,TotDays ] = RowsColsToComputeDataCleaning( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,DataCols,4 );

% Initializing Processed Data File to zeros

% ProcessedData=zeros(Rows,Cols);

% Initializing Data Captur Matrix to Zeros

DataCapture=zeros(1,DataCols);

%% Putting Data into CORRECT ROWS & COLUMNS from Raw Data File to the Pre-Initialized Processed Data file

% Creating Date Time (Decimal Solar Time) Matrix for the given number of Days using Pre-Defined Function

[ DateTimeMatrix,~,TimeT ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,DataCols );

TimeT=TimeT'; % Converting Column Vector to Row Vector
len=length(TimeT); 

% Copying the DateTimeMatrix to the ProcessedData Matrix

ProcessedData=DateTimeMatrix;
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
           
            DateTimeStamp=strread(DataFile{i+1,1},'%s','delimiter',' ');

            % Current Instant Date Information

            Date=strread(DateTimeStamp{1,1},'%f','delimiter','/');

            Month=Date(1,1);

            Day=Date(2,1);

            Year=Date(3,1);
            
            % Current Instant Time Information
            
            Time=strread(DateTimeStamp{2,1},'%f','delimiter',':');

            Hour=Time(1,1);

            Min=Time(2,1);

            Sec=Time(3,1);

            DayAmPm=strread(DateTimeStamp{3,1},'%s');

            [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

            AmPm=strcmp(DayAmPm,'AM');

            if AmPm==1

                [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

            elseif AmPm==0
                
                if (TimeDeci>=12)&&(TimeDeci<=13)
                 
                   [ TimeDeci ] = HMToDeci( Hour,Min,Sec );
                   
                else

                   [ TimeDeci ] = HMToDeci( Hour,Min,Sec )+12;
                   
                end

            end 
            
            % Reading Data from the Current Row of DataFile into DataCapture Vector
            for k=2:(DataCols+1)
                
                DataCapture(1,k-1)=DataFile{i+1,k};
                
                if DataCapture(1,k-1)<0 % Converting NEGATIVE Values to ZEROS
                    
                  DataCapture(1,k-1)=0;  
                    
                end
                
            end
            
            % Finding the Julian Day for Current Date using Pre-defined Function
            [n]=JulianDay(Day,Month,Year);
            
            % Converting TimeDeci to Solar Time (As all calculations take place in Solar Time)
            [ TimeDeci] = ClockToSolarTime( n,hem,Ltm,L,TimeDeci); 
            
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
           
       elseif Headers==0 % Use Index as 'i'
           
           % Reading Date Time Signature of Current Data Row
           
            DateTimeStamp=strread(DataFile{i,1},'%s','delimiter',' ');

            % Current Instant Date Information

            Date=strread(DateTimeStamp{1,1},'%f','delimiter','/');

            Month=StartDate(1,1);

            Day=StartDate(2,1);

            Year=StartDate(3,1);
            
            % Current Instant Time Information
            
            Time=strread(DateTimeStamp{2,1},'%f','delimiter',':');

            Hour=Time(1,1);

            Min=Time(2,1);

            Sec=Time(3,1);

            DayAmPm=strread(DateTimeStamp{3,1},'%s');

            [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

%             AmPm=strcmp(DayAmPm,'AM');
% 
%             if AmPm==1
% 
%                 [ TimeDeci ] = HMToDeci( Hour,Min,Sec );
% 
%             elseif AmPm==0
% 
%                 [ TimeDeci ] = HMToDeci( Hour,Min,Sec )+12;
% 
%             end
            
            % Reading Data from the Current Row of DataFile into DataCapture Vector
            for k=2:(DataCols+1)
                
                DataCapture(1,k-1)=DataFile{i+1,k};
                
                if DataCapture(1,k-1)<0 % Converting NEGATIVE Values to ZEROS
                    
                  DataCapture(1,k-1)=0;  
                    
                end
                
            end
            
            % Finding the Julian Day for Current Date using Pre-defined Function
            [n]=JulianDay(Day,Month,Year);
            
            % Converting TimeDeci to Solar Time (As all calculations take place in Solar Time)
            [ TimeDeci] = ClockToSolarTime( n,hem,Ltm,L,TimeDeci); 
            
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

%% Converting the CUMULATIVE DATA into ACTUAL DATA using a Pre-defined Function
if DataCumulativeOrNot==1

    [ActualData,len1]=CumulativeGenToActual(ProcessedData,Res,GenCapacity,rrnum,DataCols,TotDays,len,Lat);

    ProcessedData=ActualData;

end

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
         
         for k=5:5+len1
             
             if ActualData(j,k)==0
                 
                 Z((j-((i-1)*DayDataPoints)),i,(k-4))=1;
                 
             elseif isnan(ActualData(j,k))
                 
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

% Initializing for making Correct Function Call to SolarPVEnergySimulationPointWiseSim1

% Temp=0;
% WS=0;

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
debugger=0;
debugger1=0;
% FOR LOOP for Days

for i=1:TotDays
    
    % Finding Julian Day for the Given Day
    
    RowForDate=(DayDataPoints*(i-1))+1; % Row Number for Starting of New Day
    
    Month=ProcessedData(RowForDate,2);

    Day=ProcessedData(RowForDate,1);

    Year=ProcessedData(RowForDate,3);
    
    [n]=JulianDay(Day,Month,Year); % Actual Call to the Pre-defined Function
    
    
    % FOR LOOP for Data Columns
    
    for k=1:DataCols
        
        % Checking for ALL ZEROS and NaN Values (i.e Data Points that day are EMPTY or UNFILLED)
        
        ZeroCheck=find(Z(:,i,k));
        
        NaNCheck=find(N(:,i,k));
        
        PercentNaNValues=(length(NaNCheck)/DayDataPoints)*100;
        
        if length(ZeroCheck)==DayDataPoints % Use PV Energy Evaluation Model to fill missing DATA
            
            Index=ZeroCheck;
            
            [ ProcessedData,PgridEnergy,Irradiance] = SolarPVEnergySimulationPointWiseSim1(ProcessedData,GenIrrad,WeatherFileHourlyOrRes,n,Index,i,k,Lat,Pmod,PVTech,ModNum,ModTemCF,SF,LID,LS,Arraymismat,OhmicLoss,rho,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,Years,RainSnowMonths,yr,mr,YearRain,MonthRain,HHres) ;
            
                        
        elseif PercentNaNValues>30 % Use PV Energy Evaluation Model to fill missing DATA
            
            Index=NaNCheck;
            
            [ProcessedData, PgridEnergy,Irradiance] = SolarPVEnergySimulationPointWiseSim1(ProcessedData,GenIrrad,WeatherFileHourlyOrRes,n,Index,i,k,Lat,Pmod,PVTech,ModNum,ModTemCF,SF,LID,LS,Arraymismat,OhmicLoss,rho,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,Years,RainSnowMonths,yr,mr,YearRain,MonthRain,HHres) ;
            
        elseif PercentNaNValues<=30 % Use CurveFitting Method by Gauss1
            
            % Using Pre-defined Function for CurveFitting
            
            [ ProcessedData ] = PVGenerationCurveFitting( ProcessedData,i,k,Res,Lat,n,NaNCheck );
            
%         elseif (length(ZeroCheck)~=DayDataPoints)&&(length(NaNCheck)==0) % Optimal Data is present in the given DAY
%             
%             break                       
              
        end
        debugger=debugger+1
        
    end
    
    debugger1=debugger1+1
end

%% Writing the ProcessedData Matrix to an Excel File

filename = 'GSPC_500kW_5minRes_Generation_File.xlsx';

sheet = 1;

xlRange = 'A2';

xlswrite(filename,ProcessedData,sheet,xlRange);


