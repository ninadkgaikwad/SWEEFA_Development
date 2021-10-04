function [ ProcessedData ] = DMYfile_To_AnnInputFile( Headers)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% Headers = If Data File Contains Headers, then 1, otherwise 0

%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[~ ,~,DataFile]=xlsread(Fullpathname,1);

% Computing Size of the File

[row,col]=size(DataFile);

DataCols=col-4;

% Creating New File for Processed Data

ProcessedData=ones(row,(col-3));


%% Converting DateTime String to Numbers and Putting Data in ProcessedData

if (Headers==1)

    for i=1:row

        if (i==row)

            break;

        end



        Year=DataFile{i+1,3};

        Month=DataFile{i+1,2};

        Day=DataFile{i+1,1};
     
        Time=DataFile{i+1,4};
       
        % Finding the Julian Day for Current Date using Pre-defined Function
        [n]=JulianDay(Day,Month,Year);

        % Putting Values in ProcessedData

        ProcessedData(i,1)= n ;

        ProcessedData(i,2)= Time ;

        for j=3:(DataCols+2)       

            ProcessedData(i,j)= DataFile{i,j+2} ;

        end

    end

elseif (Headers==0)

    for i=1:row

        Year=DataFile{i,3};

        Month=DataFile{i,2};

        Day=DataFile{i,1};
     
        Time=DataFile{i,4};
       
        % Finding the Julian Day for Current Date using Pre-defined Function
        [n]=JulianDay(Day,Month,Year);

        % Putting Values in ProcessedData

        ProcessedData(i,1)= n ;

        ProcessedData(i,2)= Time ;

        for j=3:(DataCols+2)       

            ProcessedData(i,j)= DataFile{i,j+2} ;

        end


    end

end

%% Writing the ProcessedData Matrix to an Excel File

filename = 'AnnReady_File.xlsx';

sheet = 1;

xlRange = 'A2';

xlswrite(filename,ProcessedData,sheet,xlRange);




















