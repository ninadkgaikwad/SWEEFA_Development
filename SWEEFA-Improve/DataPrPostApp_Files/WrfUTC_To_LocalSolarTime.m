function [ ProcessedData ] = WrfUTC_To_LocalSolarTime( Headers,hem,Ltm,L,Lat,RelativeHours)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% Headers = If Data File Contains Headers, then 1, otherwise 0
% Hem = 1 if Eastern Hemisphere; -1 if Western Hemisphere
% Ltm = Longitude for Regional Time Zone
% L = Logitude at Location
% Lat = Latitude at Location
% RelativeHours = Relative difference between times of the UTC and desired location in hours in decimal

%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[~ ,~,DataFile]=xlsread(Fullpathname,1);

% Computing Size of the File

[row,col]=size(DataFile);

DataCols=col-1;

% Creating New File for Processed Data

ProcessedData=ones(row,(col+3));

%% Converting UTC DateTime to Regional Time
if (Headers==1)

    for i=1:row

        if (i==row)

            break;

        end

        RegionalDateNum=datenum(DataFile{i+1,1},'yyyy-mm-dd_HH:MM:SS')+(RelativeHours/24);

        RegionalDate=datestr(RegionalDateNum,'yyyy-mm-dd_HH:MM:SS');

        DataFile(i+1,1)={RegionalDate};

    end

elseif (Headers==0)

    for i=1:row

        RegionalDateNum=datenum(DataFile{i,1},'yyyy-mm-dd_HH:MM:SS')+(RelativeHours/24);

        RegionalDate=datestr(RegionalDateNum,'yyyy-mm-dd_HH:MM:SS');

        DataFile(i,1)={RegionalDate};

    end

end

%% Converting DateTime String to Numbers and Putting Data in ProcessedData

if (Headers==1)

    for i=1:row

        if (i==row)

            break;

        end

        DateTimeStamp=strread(DataFile{i+1,1},'%s','delimiter','_');

        % Date Information

        Date=strread(DateTimeStamp{1,1},'%f','delimiter','-');

        Year=Date(1,1);

        Month=Date(2,1);

        Day=Date(3,1);

        % Time Information

        Time=strread(DateTimeStamp{2,1},'%f','delimiter',':');

        Hour=Time(1,1);

        Min=Time(2,1);

        Sec=Time(3,1); 

       % Converting Time to Decimal Time

       [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

        % Finding the Julian Day for Current Date using Pre-defined Function
        [n]=JulianDay(Day,Month,Year);

        % Converting TimeDeci to Solar Time (As all calculations take place in Solar Time)
        [ TimeDeci] = ClockToSolarTime( n,hem,Ltm,L,TimeDeci); 

        % Putting Values in ProcessedData

        ProcessedData(i,1)= Day ;

        ProcessedData(i,2)= Month ;

        ProcessedData(i,3)= Year ;

        ProcessedData(i,4)= TimeDeci ;

        for j=5:(DataCols+4)

            ProcessedData(i,j)= DataFile{i+1,j-3} ;

        end

    end

elseif (Headers==0)

    for i=1:row

        DateTimeStamp=strread(DataFile{i,1},'%s','delimiter','_');

        % Date Information

        Date=strread(DateTimeStamp{1,1},'%f','delimiter','-');

        Year=Date(1,1);

        Month=Date(2,1);

        Day=Date(3,1);

        % Time Information

        Time=strread(DateTimeStamp{2,1},'%f','delimiter',':');

        Hour=Time(1,1);

        Min=Time(2,1);

        Sec=Time(3,1);

        % Converting Time to Decimal Time

        [ TimeDeci ] = HMToDeci( Hour,Min,Sec );

        % Finding the Julian Day for Current Date using Pre-defined Function
        [n]=JulianDay(Day,Month,Year);

        % Converting TimeDeci to Solar Time (As all calculations take place in Solar Time)
        [ TimeDeci] = ClockToSolarTime( n,hem,Ltm,L,TimeDeci); 

        % Putting Values in ProcessedData

        ProcessedData(i,1)= Day ;

        ProcessedData(i,2)= Month ;

        ProcessedData(i,3)= Year ;

        ProcessedData(i,4)= TimeDeci ;

        for j=5:(DataCols+4)       

            ProcessedData(i,j)= DataFile{i,j-3} ;

        end


    end

end

%% Writing the ProcessedData Matrix to an Excel File

filename = [Filename,'_UtcToLocalTime_File.xlsx'];

sheet = 1;

xlRange = 'A2';

xlswrite(filename,ProcessedData,sheet,xlRange);




















