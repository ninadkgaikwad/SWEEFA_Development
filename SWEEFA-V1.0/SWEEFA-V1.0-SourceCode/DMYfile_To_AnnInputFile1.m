function [ Input_Ann_Train, TempInput ] = DMYfile_To_AnnInputFile1( DataFile,Headers,SingleYear,MultiYear,Mode2,Mode3)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% Headers = If Data File Contains Headers, then 1, otherwise 0

%% Getting the Raw Data File in the MATLAB WorkSpace


% Computing Size of the File

[row,col]=size(DataFile);

DataCols=col-4;

TempTarget=DataFile(:,5:col);

TempInput=DataFile(:,1:4);



%% Creating DMY File based on Single/Multi Year Parameters 

if (SingleYear==1)
    
    % Creating New File for Processed Data

    DMYFile=zeros(row,2);

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

            DMYFile(i,1)= n ;

            DMYFile(i,2)= Time ;

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

            DMYFile(i,1)= n ;

            DMYFile(i,2)= Time ;


        end

    end
    
elseif(MultiYear==1)
    
    % Creating New File for Processed Data

    DMYFile=zeros(row,3);   
    
    
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

            DMYFile(i,1)= n ;
            
            DMYFile(i,2)= Year ;

            DMYFile(i,3)= Time ;

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

            DMYFile(i,1)= n ;
            
            DMYFile(i,2)= Year ;

            DMYFile(i,3)= Time ;

        end

    end 
    
end

%% Creating Additional Input Varibles from the Target Section as per Mode2/Mode3 Parameters

if (Mode2==1)
    
    % Correcting DYMFile depending on Mode2/Mode3
    
    DMYFile1=DMYFile(2:row,:);
    
    %[r,c]=size(DMYFile1);    
    
    % Getting Previous Values
    
    NewInputVariables1=TempTarget(1:(row-1),:);
        
    Input_Ann_Train=[DMYFile1 , NewInputVariables1 ];
    
    TempInput=DataFile(2:row,1:4);
    
    
elseif (Mode3==1)
    
    % Correcting DYMFile depending on Mode2/Mode3
    
    DMYFile1=DMYFile(3:row,:);
    
    % r,c]=size(DMYFile1);
    
    % Getting Previous Values
    
    NewInputVariables1=TempTarget(2:(row-1),:);
    
    % Getting Rate of change of Previous values
    
    for i=3:row
        
       for j=1:DataCols 
           
         % NewInputVariables2(i-2,j)= (TempTarget(i-1,j)-TempTarget(i-2,j))/Res;
           
         NewInputVariables2(i-2,j)= TempTarget(i-1,j)-TempTarget(i-2,j);
         
       end
        
    end
    
    Input_Ann_Train=[DMYFile1 , NewInputVariables1 , NewInputVariables2  ];
    
    TempInput=DataFile(3:row,1:4);
    
 end























