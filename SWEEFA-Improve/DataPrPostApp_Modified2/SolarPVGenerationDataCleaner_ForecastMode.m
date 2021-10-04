function [ DTGeneration_Cleaned_Cell ] = SolarPVGenerationDataCleaner_ForecastMode( DTGeneration_Cell,DTWeather_Cleaned_Cell,Res,Lat,GenCapacity,GenIrrad,WeatherFileHourlyOrRes,DataCumulativeOrNot,PlantInfo_Parameters,SheetNum,SheetType   )

%% Function Details:

% DTGeneration_Cell = Date-Time and Generation Columns with Headers in a Cell Structure
% DTWeather_Cell = Date-Time and Weather Columns with Headers in a Cell Structure
% Res = Time Step of the Data File in Minutes 
% Lat = Latitude at Location
% GenCapacity = Vector of Capacity in each Field (kW), used to calculate theoretical maximum value of of energy generated in one time step
% GenIrrad = Vector of numbers describing Data Columns to be either Generation Data (if, GenIrrad=1), or Irradiance Data (if, GeIrrad=0)
% WeatherFileHourlyOrRes = If Weather Files i.e Temperature and WindSpeed Files are in Hourly Format then "1" if in Resolution Format the "0"
% DataCumulativeOrNot = If Data is Cumulative "1", if it is not Cumulative then "0", for each Column
% PlantInfo_Parameters = A Cell structure containing Solar Plant Static Data
% SheetNum = A Scalar containing the Ordered Number of the Sheet
% SheetType = A Scalar : If 1 One Sheet for each PVTechs, Then  ; If 2 , Then One Sheet for All PVTechs

%% Cleaning Solar PV Generation Variable Data Column

%% Preliminary Computations

% Computing DataCols and Rows

[r,c]=size(DTGeneration_Cell);

DataCols=c-4;

%Rows=r-1;

% Getting ProcessedData

ProcessedData=cell2mat(DTGeneration_Cell(2:end,:));

% Getting Size of ProcessedData

[rrnum,ccnum]=size(ProcessedData);

% Getting Start-End: Day, Month and Year

StartDay=ProcessedData(1,1);

EndDay=ProcessedData(end,1);

StartMonth=ProcessedData(1,2);

EndMonth=ProcessedData(end,2);

StartYear=ProcessedData(1,3);

EndYear=ProcessedData(end,3);

[ ~,~,TotDays ] = RowsColsToComputeDataCleaning( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,DataCols,4 );

% Creating Date Time (Decimal Solar Time) Matrix for the given number of Days using Pre-Defined Function

[ ~,~,TimeT ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,DataCols );

TimeT=TimeT'; % Converting Column Vector to Row Vector
len=length(TimeT); 

% Setting Temp and Ws

Temp=cell2mat(DTWeather_Cleaned_Cell(2:end,6));

WS=cell2mat(DTWeather_Cleaned_Cell(2:end,5));

%% From PlantInfo_GUI

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

%% Converting the CUMULATIVE DATA into ACTUAL DATA using a Pre-defined Function
if DataCumulativeOrNot==1

    [ActualData,len1]=WTG_CumulativeGenToActual(ProcessedData,Res,GenCapacity,rrnum,DataCols,TotDays,len,Lat);

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
            
            [ ProcessedData,PgridEnergy,Irradiance] = SolarPVEnergySimulationPointWiseSim2_ForecastMode(ProcessedData,GenIrrad,WeatherFileHourlyOrRes,n,Index,i,SheetNum,Lat,Pmod,PVTech,ModNum,ModTemCF,SF,LID,LS,Arraymismat,OhmicLoss,rho,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,Years,RainSnowMonths,yr,mr,YearRain,MonthRain,Res,SheetType) ;
            
                        
        elseif (PercentNaNValues>30) % Use PV Energy Evaluation Model to fill missing DATA
            
            Index=[NaNCheck1];
            
            [ProcessedData, PgridEnergy,Irradiance] = SolarPVEnergySimulationPointWiseSim2_ForecastMode(ProcessedData,GenIrrad,WeatherFileHourlyOrRes,n,Index,i,SheetNum,Lat,Pmod,PVTech,ModNum,ModTemCF,SF,LID,LS,Arraymismat,OhmicLoss,rho,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,Years,RainSnowMonths,yr,mr,YearRain,MonthRain,Res,SheetType) ;
            
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

%% Creating DTGeneration_Cleaned_Cell

DTGeneration_Cleaned_Cell=vertcat(DTGeneration_Cell(1,:),mat2cell(ProcessedData));


end

