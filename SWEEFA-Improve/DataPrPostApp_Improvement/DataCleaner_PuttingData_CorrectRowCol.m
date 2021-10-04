function [ ProcessedData ] = DataCleaner_PuttingData_CorrectRowCol( ProcessedData, StartDay, Headers, TotDays, Res, DataCols,DateTimeString_Processor1_OutputCell,NegativeCol,hem,Ltm,L,DataCapture )

%% Function Details :


%%

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

end

