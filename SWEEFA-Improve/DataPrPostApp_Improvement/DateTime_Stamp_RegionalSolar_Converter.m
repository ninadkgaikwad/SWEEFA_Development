function [DateTime_Stamp_Converted ] = DateTime_Stamp_RegionalSolar_Converter(DateTime_Stamp_WeatherFile, Lat, Long, RegionalTimeMeridian, UTCTimeDiff, ConversionType, HHres)

%% Function Details

% DateTime_Stamp_WeatherFile = A martix containing D-M-Y-T
% Lat = Local Latitude of the Plant in [Deg]
% Long = Loacal Longitude of the Palnt [Deg]
% RegionalTimeMeridian = Regional Time Longitude in [Deg]
% UTCTimeDiff = Relative time difference between UTC and Regional Time Longitude in [Decimal Hours]
% ConversionType = If ConversionType = 1, Then convert the DateTime_Stamp_WeatherFile to Solar/Local Date-Time [As original Date-Time is in Regional Date-Time] ; If ConversionType = 2, Then convert the DateTime_Stamp_WeatherFile to Regional Date-Time [As original Date-Time is in Solar/Local Date-Time]
% HHres = The Simulation Resolution in minutes

%% Initializing DateTime_Stamp_Converted

% Computing Size of DateTime_Stamp_WeatherFile

[Row, Col]=size(DateTime_Stamp_WeatherFile);

% Initializing DateTime_Stamp_Converted

DateTime_Stamp_Converted=zeros(Row, Col);

%% Computing the Hemisphere from Local Longitude

if (Long>=0) % Eastern Hemisphere
    
    hem=1;
    
elseif (Long<0) % Western Hemisphere
    
    hem=-1;
    
end

%% Converting the DateTime_Stamp_WeatherFile according to ConversionType

if (ConversionType==1) % Converting the DateTime_Stamp_WeatherFile to Solar/Local Date-Time
    
    for i=1:Row % For each Date-Time Stamp
        
        % Getting the Day, Month, Year and Time from ith Date-Time Stamp
        
        Day=DateTime_Stamp_WeatherFile(i,1);
        Month=DateTime_Stamp_WeatherFile(i,2);
        Year=DateTime_Stamp_WeatherFile(i,3);
        Time=DateTime_Stamp_WeatherFile(i,4);
        
        % Computing HH:MM:SS from Time using External Function
        
        [ HH,MM,SS ] = DeciToHM( Time );
        
        % Creating a DateTime Object using matlab Built-In Function
        
        DateTime_Object1=datetime(Year, Month, Day, HH, MM, SS);
        
        % Computing Julian Day using External Function
        
        [n]=JulianDay(Day,Month,Year);
        
        % Computing Solar/Local Time using External Function
        
        [ Time1] = ClockToSolarTime( n,hem,RegionalTimeMeridian,Long,Time); 
        
        % Correcting for Negative and Greater than 24 values of Time1
        
        if (Time1<0) % Decrease Day by one
            
            % Finding Corrected Time1

            Time2=24-abs(Time1); 
            
            % Creating Time Duration of 1 Day
            
            Day_Duration=days(1);
            
            % Decreasing Day by 1
            
            DateTime_Object2=DateTime_Object1-Day_Duration;
            
            % Updating the DateTime_Stamp_Converted 
            
            DateTime_Stamp_Converted(i,1:4)=[DateTime_Object2.Day,DateTime_Object2.Month,DateTime_Object2.Year,Time2];            
            
        elseif (Time1>24) % Increase Day by one

            % Finding Corrected Time1

            Time2=Time1-24;  
            
            % Creating Time Duration of 1 Day
            
            Day_Duration=days(1);            
            
            % Increasing Day by 1
            
            DateTime_Object2=DateTime_Object1+Day_Duration;
            
            % Updating the DateTime_Stamp_Converted 
            
            DateTime_Stamp_Converted(i,1:4)=[DateTime_Object2.Day,DateTime_Object2.Month,DateTime_Object2.Year,Time2];            
            
        else % Let the Day be the Same
            
            % Finding Corrected Time1
            
            Time2=Time1;
            
            % Updating the DateTime_Stamp_Converted 
            
            DateTime_Stamp_Converted(i,1:4)=[Day,Month,Year,Time2];
            
        end
        
    end
    
elseif (ConversionType==2) % Converting the DateTime_Stamp_WeatherFile to Regional Date-Time
    
    % Create a TimeVector  

    TimeStep=HHres/60;

    TimeVector=0:TimeStep:24;
    
    % Leaving the 24 if present in the TimeVector
    
    if (TimeVector(end)==24) % Leave out 24 (The Last Element)
        
        TimeVector=TimeVector(1:(end-1));
        
    elseif (TimeVector(end)<24) % Don't Leave out the Last Eleement
        
        TimeVector=TimeVector;
        
    end
    
    % Computing length of TimeVector
    
    LenTime=length(TimeVector);
    
    for i=1:Row % For each Date-Time Stamp
        
        % Getting the Day, Month, Year and Time from ith Date-Time Stamp
        
        Day=DateTime_Stamp_WeatherFile(i,1);
        Month=DateTime_Stamp_WeatherFile(i,2);
        Year=DateTime_Stamp_WeatherFile(i,3);
        Time=DateTime_Stamp_WeatherFile(i,4);
        
        % Computing HH:MM:SS from Time using External Function
        
        [ HH,MM,SS ] = DeciToHM( Time );
        
        % Creating a DateTime Object using matlab Built-In Function
        
        DateTime_Object1=datetime(Year, Month, Day, HH, MM, SS);
        
        % Computing Julian Day using External Function
        
        [n]=JulianDay(Day,Month,Year);
        
        % Computing Solar/Local Time using External Function
        
        [ Time1] = SolarToClockTime( n,hem,RegionalTimeMeridian,Long,Time); 
        
       
        % Correcting for Negative and Greater than 24 values of Time1
        
        if (Time1<0) % Decrease Day by one
            
            % Finding Corrected Time1

            Time2=24-abs(Time1); 
            
            % Finding Corrected Time value for Time Deci as per the Time Signature of ProcessedData Matrix
            for j=1:LenTime

                diffrence(1,j)=abs(Time2-TimeVector(1,j));

            end

            [M,I]=min(diffrence);

            Time3=TimeVector(1,I); % Corrected Time Value 
            
            % Creating Time Duration of 1 Day
            
            Day_Duration=days(1);
            
            % Decreasing Day by 1
            
            DateTime_Object2=DateTime_Object1-Day_Duration;
            
            % Updating the DateTime_Stamp_Converted 
            
            DateTime_Stamp_Converted(i,1:4)=[DateTime_Object2.Day,DateTime_Object2.Month,DateTime_Object2.Year,Time3];            
            
        elseif (Time1>24) % Increase Day by one

            % Finding Corrected Time1

            Time2=Time1-24;  
            
            % Finding Corrected Time value for Time Deci as per the Time Signature of ProcessedData Matrix
            for j=1:LenTime

                diffrence(1,j)=abs(Time2-TimeVector(1,j));

            end

            [M,I]=min(diffrence);

            Time3=TimeVector(1,I); % Corrected Time Value             
            
            % Creating Time Duration of 1 Day
            
            Day_Duration=days(1);            
            
            % Increasing Day by 1
            
            DateTime_Object2=DateTime_Object1+Day_Duration;
            
            % Updating the DateTime_Stamp_Converted 
            
            DateTime_Stamp_Converted(i,1:4)=[DateTime_Object2.Day,DateTime_Object2.Month,DateTime_Object2.Year,Time3];            
            
        else % Let the Day be the Same
            
            % Finding Corrected Time1
            
            Time2=Time1;
            
            % Finding Corrected Time value for Time Deci as per the Time Signature of ProcessedData Matrix
            for j=1:LenTime

                diffrence(1,j)=abs(Time2-TimeVector(1,j));

            end

            [M,I]=min(diffrence);

            Time3=TimeVector(1,I); % Corrected Time Value             
            
            % Updating the DateTime_Stamp_Converted 
            
            DateTime_Stamp_Converted(i,1:4)=[Day,Month,Year,Time3];
            
        end        
        
    end
    
end



end

