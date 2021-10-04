function [ ProcessedData ] = SolarPVWeatherDataCleaner( Headers,Res,DataCols,hem,Ltm,L,Lat,NegativeCol,N  )
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

%% Changes

% 1. Date-Time Stamp Handling for Custom GMC Date-Time Stamp Sting Added
% 2. The conversion of local to to solar time is omitted as we want to preserve local timestamp
% 3. The AM/PM part is omitted as the GMC Date-Time Stamp does not contain Am/Pm as it is 24-Hour Format

%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[~ ,~,DataFile]=xlsread(Fullpathname,1);


%% Computing Data for getting EXACT ROWS and COLUMNS of the PROCESSED DATA FILE

% Finding Start and End Days of the Data Set
if Headers==1

    % Getting the Header Text
    
    Header1 = DataFile(1,2:(DataCols+1));
    
    % Changes for handling GMC Date-Time Stamp
    
    DateTimeStampStartday=strread(DataFile{2,1},'%s','delimiter','T'); % The Delimiter is chnaged from ' ' to 'T'

    % Start day Information

    StartDate=strread(DateTimeStampStartday{1,1},'%f','delimiter','-'); % The Delimiter is chnaged from '/' to '-'

    StartYear=StartDate(1,1);

    StartMonth=StartDate(2,1);

    StartDay=StartDate(3,1);

    % End Day Information

    [rnum,colnum]=size(DataFile);

    DateTimeStampEndday=strread(DataFile{rnum,1},'%s','delimiter','T'); % The Delimiter is chnaged from ' ' to 'T'

    EndDate=strread(DateTimeStampEndday{1,1},'%f','delimiter','-'); % The Delimiter is chnaged from '/' to '-'

    EndYear=EndDate(1,1);

    EndMonth=EndDate(2,1);

    EndDay=EndDate(3,1);

elseif Headers==0
    
    DateTimeStampStartday=strread(DataFile{1,1},'%s','delimiter','T'); % The Delimiter is chnaged from ' ' to 'T'

    % Start day Information

    StartDate=strread(DateTimeStampStartday{1,1},'%f','delimiter','-'); % The Delimiter is chnaged from '/' to '-'

    StartYear=StartDate(1,1);

    StartMonth=StartDate(2,1);

    StartDay=StartDate(3,1);

    % End Day Information

    [rnum,colnum]=size(DataFile);

    DateTimeStampEndday=strread(DataFile{rnum,1},'%s','delimiter','T'); % The Delimiter is chnaged from ' ' to 'T'

    EndDate=strread(DateTimeStampEndday{1,1},'%f','delimiter','-'); % The Delimiter is chnaged from '/' to '-'

    EndYear=EndDate(1,1);

    EndMonth=EndDate(2,1);

    EndDay=EndDate(3,1);

end

% Computing Rows And Columns for the Processed Data File using Pre-defined Function

[ Rows,Cols,TotDays ] = RowsColsToComputeDataCleaning( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,DataCols,4 );

% Initializing Processed Data File to zeros

ProcessedData=NaN(Rows,Cols);

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

First=0; % Debugger

% Updating ProcessedData Data Columns in ProcessedData matrix for each row in Original Data File

for i=1:rnum
    
    First=First+1 % Debugger
    
       if Headers==1 % Use Index as 'i+1'
           
           % Providing a BREAK SITUATION when index 'i' goes out of bounds
           Breaker=i+1;
           
           if Breaker>rnum
               
               break;
               
           end
           
           % Reading Date Time Signature of Current Data Row
           
            DateTimeStamp=strread(DataFile{i+1,1},'%s','delimiter','T'); % The Delimiter is chnaged from ' ' to 'T'

            % Current Instant Date Information

            Date=strread(DateTimeStamp{1,1},'%f','delimiter','-'); % The Delimiter is chnaged from '/' to '-'

            Year=Date(1,1);

            Month=Date(2,1);

            Day=Date(3,1);
            
            % Current Instant Time Information
            
            Time=strread(DateTimeStamp{2,1},'%f','delimiter',':');

            Hour=Time(1,1);

            Min=Time(2,1);

            Sec=Time(3,1);

%             DayAmPm=strread(DateTimeStamp{3,1},'%s');

            [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

            % Omitting AM-PM Code as the GMC Data is in 24-Hour Clock without any mention of Am/PM String
            
%             AmPm=strcmp(DayAmPm,'AM');
% 
%             if AmPm==1
% 
%                 [ TimeDeci ] = HMToDeci( Hour,Min,Sec );
% 
%             elseif AmPm==0
%                 
%                 if (TimeDeci>=12)&&(TimeDeci<=13)
%                  
%                    [ TimeDeci ] = HMToDeci( Hour,Min,Sec );
%                    
%                 else
% 
%                    [ TimeDeci ] = HMToDeci( Hour,Min,Sec )+12;
%                    
%                 end
% 
%             end 
            
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
            
            % Omitting the part for converting Local Time to Solar time for Local Time Preservation
                    
%             % Finding the Julian Day for Current Date using Pre-defined Function
%             [n]=JulianDay(Day,Month,Year);
%             
%             % Converting TimeDeci to Solar Time (As all calculations take place in Solar Time)
%             [ TimeDeci] = ClockToSolarTime( n,hem,Ltm,L,TimeDeci); 
            
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
           
            DateTimeStamp=strread(DataFile{i,1},'%s','delimiter','T'); % The Delimiter is chnaged from ' ' to 'T'

            % Current Instant Date Information

            Date=strread(DateTimeStamp{1,1},'%f','delimiter','-'); % The Delimiter is chnaged from '/' to '-'

            Year=StartDate(1,1);

            Month=StartDate(2,1);

            Day=StartDate(3,1);
            
            % Current Instant Time Information
            
            Time=strread(DateTimeStamp{2,1},'%f','delimiter',':');

            Hour=Time(1,1);

            Min=Time(2,1);

            Sec=Time(3,1);

%             DayAmPm=strread(DateTimeStamp{3,1},'%s');

            [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

            % Omitting AM-PM Code as the GMC Data is in 24-Hour Clock without any mention of Am/PM String
            
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
            
            % Omitting the part for converting Local Time to Solar time for Local Time Preservation
            
%             % Finding the Julian Day for Current Date using Pre-defined Function
%             [n]=JulianDay(Day,Month,Year);
%             
%             % Converting TimeDeci to Solar Time (As all calculations take place in Solar Time)
%             [ TimeDeci] = ClockToSolarTime( n,hem,Ltm,L,TimeDeci); 
%             
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



%% N Point Average Method for Filling missing Data in TEMPERATURE, WIND, RELATIVE HUMIDITY

RaN=zeros(N,DataCols); % Initializing the Running Value Storage used in NaN Value Filling 

NPointAverageN=sum(RaN)/N; % Calculating the Running Average

Second=0; % Debugger

% FOR LOOP for Point-Wise Filling of NaN and Zero Values (Top to Bottom)

for i=1:Rows
    
    Second=Second+1 % Debugger
    
    RaCounter=rem(i,N); % For using Running Value Storage Vector to cyclically update its N Values with the next value
    
    if RaCounter==0
        
        RaCounter=N;
        
    end
    
    % FOR LOOP for Each Data Column
    
    for k=1:DataCols
        
        if (isnan(ProcessedData(i,k+4)))||(ProcessedData(i,k+4)==0)
            
            NPointAverageN=sum(RaN(:,k))/N; % Calculating the Running Average
            
            ProcessedData(i,k+4)=NPointAverageN; % Updating NaN Value with Running Average Value
        
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        else
            
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        end
        
           

        
        
    end
    
    
    
end

% FOR LOOP for Point-Wise Filling of NaN and Zero Values (Bottom to Top)

Third=0; % Debugger

for i=Rows:-1:1
    
    Third=Third+1 % Debugger
    
    RaCounter=rem(i,N); % For using Running Value Storage Vector to cyclically update its N Values with the next value
    
    if RaCounter==0
        
        RaCounter=N;
        
    end
    
    % FOR LOOP for Each Data Column
    
    for k=1:DataCols
        
        if (isnan(ProcessedData(i,k+4)))
            
            NPointAverageN=sum(RaN(:,k))/N; % Calculating the Running Average
            
            ProcessedData(i,k+4)=NPointAverageN; % Updating NaN Value with Running Average Value
        
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        else
            
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        end
        
           

        
        
    end
    
    
    
end

%% Writing the ProcessedData Matrix to an Excel File

% Creating a Proper File Name

Filename1 = strread(Filename,'%s','delimiter','.'); % Using '.' as Delimiter for removing File Extensions

Filename = Filename1{1,1};

ResStr = num2str(Res);
NStr = num2str(N);

filename = [Filename,'_Res-',ResStr,'_NAvg-',NStr,'_Processed_Weather_Data_File.xlsx'];

% filename = [Filename,'_Res',ResStr,'_Processed_Weather_Data_File.xlsx'];

% Wrting the Header

if (Headers==1)
    
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

xlswrite(filename,ProcessedData,sheet,xlRange);


end



