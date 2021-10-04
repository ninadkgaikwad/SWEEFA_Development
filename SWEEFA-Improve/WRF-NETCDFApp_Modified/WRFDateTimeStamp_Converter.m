function [ ProcessedData ] = WRFDateTimeStamp_Converter( DataFile,RelativeHours)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% TimesCell = If Data File Contains Headers, then 1, otherwise 0
% RelativeHours = Relative difference between times of the UTC and desired location in hours in decimal

% Note: This function does not convert Time Stamps to Local Solar Time,
% hence when using output file from WRF-NETCDF APP in Solar APP cautiously
% select the Regional Time option for correct energy estimation

%% Converting UTC DateTime to Regional Time

% Computing the Size of the DataFile

[row, col]=size(DataFile);

% Creating ProcessedData 

ProcessedData=zeros(row,4); % One Column each for D-M-Y-T

for i=1:row

    RegionalDateNum=datenum(DataFile{i,1},'yyyy-mm-dd_HH:MM:SS')+(RelativeHours/24);

    RegionalDate=datestr(RegionalDateNum,'yyyy-mm-dd_HH:MM:SS');

    DataFile(i,1)={RegionalDate};

end



%% Converting DateTime String to Numbers and Putting Data in ProcessedData

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

    % Putting Values in ProcessedData

    ProcessedData(i,1)= Day ;

    ProcessedData(i,2)= Month ;

    ProcessedData(i,3)= Year ;

    ProcessedData(i,4)= TimeDeci ;

%     for j=5:(DataCols+4)       
% 
%         ProcessedData(i,j)= DataFile{i,j-3} ;
% 
%     end


end

end

