function [ ProcessedData ] = SolarPVWeatherDataCleaner( Headers,Res,DataCols,hem,Ltm,L,Lat,N )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% Headers = If Data File Contains Headers, then 1, otherwise 0
% Res = Time Step of the Data File in Minutes
% DataCols = Number of Columns in Data File Which Represents Data, other than date and time Columns
% Hem = 1 if Eastern Hemisphere; -1 if Western Hemisphere
% Ltm = Longitude for Regional Time Zone
% L = Logitude at Location
% Lat = Latitude at Location
% N = It is number elements for N-Point Running Average


%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[~ ,~,DataFile]=xlsread(Fullpathname,1);


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

ProcessedData=zeros(Rows,Cols);

% Initializing Data Captur Matrix to Zeros

DataCapture=zeros(1,DataCols);

%% Putting Data into CORRECT ROWS & COLUMNS from Raw Data File to the Pre-Initialized Processed Data file

% Creating Date Time (Decimal Solar Time) Matrix for the given number of Days using Pre-Defined Function

[ DateTimeMatrix,TimeT ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,DataCols );

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
            
            % Updating Day, Month & Year for TimeDeci<0 and TimeDeci>24
            
            if ((TimeDeci<0)&&(Day==StartDay)&&(Month==StartMonth)&&(Year==StartYear)) % Leave Out the Data Points
                
                Indicator1=1;
                
            elseif ((TimeDeci<0)&&(Day==EndDay)&&(Month==EndMonth)&&(Year==EndYear)) % Leave Out the Data Points                
                
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
            
            % Updating Day, Month & Year for TimeDeci<0 and TimeDeci>24
            
            if ((TimeDeci<0)&&(Day==StartDay)&&(Month==StartMonth)&&(Year==StartYear)) % Leave Out the Data Points
                
                Indicator1=1;
                
            elseif ((TimeDeci<0)&&(Day==EndDay)&&(Month==EndMonth)&&(Year==EndYear)) % Leave Out the Data Points                
                
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



%% N Point Average Method for Filling missing Data in TEMPERATURE, WIND, RELATIVE HUMIDITY

RaN=zeros(N,DataCols); % Initializing the Running Value Storage used in NaN Value Filling 

% NPointAverageN=sum(RaN)/N; % Calculating the Running Average

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
        
        if (isnan(ProcessedData(i,k+4)))||(ProcessedData(i,k+4)==0)
            
            NPointAverageN=sum(RaN(:,k))/N; % Calculating the Running Average
            
            ProcessedData(i,k+4)=NPointAverageN; % Updating NaN Value with Running Average Value
        
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        else
            
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        end
        
           

        
        
    end
    
    
    
end

%% Writing the ProcessedData Matrix to an Excel File

filename = [Filename,'_Processed_Weather_Data_File.xlsx'];

sheet = 1;

xlRange = 'A2';

xlswrite(filename,ProcessedData,sheet,xlRange);


end



