function [ ProcessedData ] = DMYfile_To_AnnInputFile( DataFile,Headers,SingleYear,MultiYear)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% Headers = If Data File Contains Headers, then 1, otherwise 0

%% Getting the Raw Data File in the MATLAB WorkSpace


% Computing Size of the File

[row,col]=size(DataFile);

% DataCols=col-4;




%% Converting DateTime String to Numbers and Putting Data in ProcessedData

if (SingleYear==1)
    
    % Creating New File for Processed Data

    ProcessedData=zeros(row,2);

    if (Headers==1)

        for i=1:row

            if (i==row)

                break;

            end



            Year=DataFile(i+1,3);

            Month=DataFile(i+1,2);

            Day=DataFile(i+1,1);

            Time=DataFile(i+1,4);

            % Finding the Julian Day for Current Date using Pre-defined Function
            [n]=JulianDay(Day,Month,Year);

            % Putting Values in ProcessedData

            ProcessedData(i,1)= n ;

            ProcessedData(i,2)= Time ;

        end

    elseif (Headers==0)

        for i=1:row

            Year=DataFile(i,3);

            Month=DataFile(i,2);

            Day=DataFile(i,1);

            Time=DataFile(i,4);

            % Finding the Julian Day for Current Date using Pre-defined Function
            [n]=JulianDay(Day,Month,Year);

            % Putting Values in ProcessedData

            ProcessedData(i,1)= n ;

            ProcessedData(i,2)= Time ;


        end

    end
    
elseif(MultiYear==1)
    
    % Creating New File for Processed Data

    ProcessedData=zeros(row,3);   
    
    
    if (Headers==1)

        for i=1:row

            if (i==row)

                break;

            end



            Year=DataFile(i+1,3);

            Month=DataFile(i+1,2);

            Day=DataFile(i+1,1);

            Time=DataFile(i+1,4);

            % Finding the Julian Day for Current Date using Pre-defined Function
            [n]=JulianDay(Day,Month,Year);

            % Putting Values in ProcessedData

            ProcessedData(i,1)= n ;
            
            ProcessedData(i,2)= Year ;

            ProcessedData(i,3)= Time ;

        end

    elseif (Headers==0)

        for i=1:row

            Year=DataFile(i,3);

            Month=DataFile(i,2);

            Day=DataFile(i,1);

            Time=DataFile(i,4);

            % Finding the Julian Day for Current Date using Pre-defined Function
            [n]=JulianDay(Day,Month,Year);

            % Putting Values in ProcessedData

            ProcessedData(i,1)= n ;
            
            ProcessedData(i,2)= Year ;

            ProcessedData(i,3)= Time ;

        end

    end 
    
end





















