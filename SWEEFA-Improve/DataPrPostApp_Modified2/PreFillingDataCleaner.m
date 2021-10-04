function [PlantPreFillingCorrectedDataSheet]=PreFillingDataCleaner(DataFile,Headers,Res,hem,Ltm,L,Lat,DateTimeString_Processor1_OutputCell,NegativeCols,SolarRegionalTime,PlantType)

%% Function Details:

% PlantRawDataSheet_Cell = Cell Structure containing Raw Plant Data Sheet
% Headers = If Data File Contains Headers, then 1, otherwise 0
% Res = Time Step of the Data File in Minutes
% Hem = 1 if Eastern Hemisphere; -1 if Western Hemisphere
% Ltm = Longitude for Regional Time Zone
% L = Logitude at Location
% Lat = Latitude at Location
% DateTimeString_Processor1_OutputCell = Contains the Computed Date-Time String Format
% NegativeCol = A Vector containing column numbers of Data Columns which can have negative values
% SolarRegionalTime = A Scalar to indicate need for conversion of Date-Time Stamp ; If 1 , Then Date-Time in Regional and convert to Solar/Local ; If 2 , Then Date-Time in Solar/Local and convert to Regional ; If 0 , Then Do Not Convert
% PlantType = A Scalar containing Plant Type Information ; If 1 , then Wind Plant ; If 2 , then Solar Plant

%% Cleaning the Raw Data Sheet

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
    
    if (PlantType==1) % Wind Plant
        
        Header = {'Day', 'Month', 'Year', 'Time','WindSpeed','Temperature','WindDirection','TurbineStatus','Generation'};
        
        % Adding Blank Column Names for Extra Columns
        
        for i=1:(DataCols-5)
            
            Header(1,(9+i))={''};
            
        end
        
    elseif (PlantType==2) % Solar Plant
        
        Header = {'Day', 'Month', 'Year', 'Time','WindSpeed','Temperature','Irradiance','PlantStatus','Generation'};

        % Adding Blank Column Names for Extra Columns
        
        for i=1:(DataCols-5)
            
            Header(1,(9+i))={''};
            
        end 
        
    elseif (PlantType==3) % Wind Plant Generation/Power in Normal Mode
        
        Header = {'Day', 'Month', 'Year', 'Time','Generation'};
        
    end    
        
end


%% Putting Data into CORRECT ROWS & COLUMNS from Raw Data File to the Pre-Initialized Processed Data file

% Creating Date Time (Decimal Solar Time) Matrix for the given number of Days using Pre-Defined Function

[ DateTimeMatrix,TimeT ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,DataCols );

TimeT=TimeT'; % Converting Column Vector to Row Vector
len=length(TimeT); 

% Copying the DateTimeMatrix to the ProcessedData Matrix

ProcessedData(:,1:4)=DateTimeMatrix(:,1:4); % Modification: Parsing DateTimeMatrix exactly to maintain NaN in ProcessedData
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

%% Creating PlantPreFillingCorrectedDataSheet

PlantPreFillingCorrectedDataSheet=vertcat(Header,mat2cell(ProcessedData));


end

