function [ ProcessedData1 ] = MINToDayDataCoverter_ForecastMode( DataCols,Res,AvgOrAdd,Headers )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Note: ResOriginal Should Always Be Smaller Than ResNew; And 60mins Should be integral multiples of both

% Note: Same Function can be used to convert files to Half-Hourly or Hourly Files

%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[~,sheets] = xlsfinfo(Fullpathname);

DataFile_Cell_Len=sheets;

for i=1:DataFile_Cell_Len % For Each Sheet in the File

   [~ ,~,DataFile1]=xlsread(Fullpathname,i); 

   DataFile_Cell(1,i)={DataFile1};

end

%% Processing the Data

for k=1:DataFile_Cell_Len % For Each Sheet in the File

    % Getting the DataFile
    
    DataFile=DataFile_Cell{1,k};
    
    % Getting ProcessedData
    
    if (Headers==1) % Headers Present
        
        ProcessedData=cell2mat(DataFile(2:end,:));
        
    elseif (Headers==0) % Headers Not Present
        
        ProcessedData=cell2mat(DataFile(:,:));
        
    end    
    
    % Getting Header Text

    if (Headers==1)

        % Getting the Header Text

        Header1 = DataFile(1,5:(DataCols+4));    

        % Clearing the not needed DataFile Variable

        clearvars DataFile

        Header = {'Day', 'Month', 'Year'};

        % Concatenating Headers derived frome the Original File

        Header = [Header, Header1];    

    elseif (Headers==0)

        Header = {'Day', 'Month', 'Year'};
        
        for j=1:DataCols
            
            Header1(1,(j+3))={''};
            
        end
        
        % Concatenating Headers derived frome the Original File

        Header = [Header, Header1];          

    end

    %% Computing Size of ProcessedData Matrix

    % [Row1,Col1]=size(ProcessedData);
    % % 
    % ProcessedData(Row1+1,:)=0; % For avoiding the problem with starting with 0 time field
    % 
    % ProcessedData(Row1+1,4)=0; % For avoiding the problem with starting with 0 time field

    [Row,Col]=size(ProcessedData);

    ProcessedData=ProcessedData(1:(Row-1),:); % Removing Last Row as it Contains Value for Next Day

    [Row,Col]=size(ProcessedData); % Size of the Newly Reduced ProcessedData Matrix

    % Computing the DayDataPoints

    DayDataPoints=24*(60/Res);

    RowNew=ceil(Row/DayDataPoints); % Computing Number of Rows for the PRocessedData1 Matrix

    % Initializing The New ProcessedData Matrix

    ProcessedData1=zeros(RowNew,(3+DataCols));

    % Computing Number off ROWS to be AVERAGED or ADDED

    NumRows=DayDataPoints;

    % Initializing Index for ProcessedData1 Matrix

    Index1=0;

    %% FOR LOOP for Averging and Adding to get Desired ResNew according to AvgOrAdd

    % FOR LOOP for each ROW of ProcessedData

    for i=1:NumRows:Row

        % Incrementing Index1 for placing Data in Correct Rows of ProcessedData1 Matrix

        Index1=Index1+1;

        % FOR LOOP for each DataCol

        for k=1:DataCols

            Indicator=AvgOrAdd(1,k); % For indication Values Should be Averaged or Added

            Add=0; % Initializing Add Variable to Zero

            Avg=zeros(1,NumRows); % Initializing Avg Vector to Zeros

            % FOR LOOP for Averaging & Adding as Per RES Values

            for j=1:NumRows

                RowIndex=(i-1)+j; % Computing RowIndex

                if Indicator==1 % ADDITION

                    Add=Add+ProcessedData(RowIndex,(k+4));

                elseif Indicator==0 % AVERAGE

                    Avg(1,j)=ProcessedData(RowIndex,(k+4));

                end

            end        

            ProcessedData1(Index1,1:3)=ProcessedData(RowIndex,1:3); % Copying Correct DateTime Stamp

            if Indicator==1 % ADDITION

                 ProcessedData1(Index1,(k+3))=Add; % Copying Correct Data Value

            elseif Indicator==0 % AVERAGE

                 ProcessedData1(Index1,(k+3))=sum(Avg)/NumRows; % Copying Correct Data Value

            end

        end


    end
    
    % Creating ProcessedData1_Cell
    
    ProcessedData1_Cell=vertcat(Header,mat2cell(ProcessedData1));
    
    % Creating ProcessedData1_CellVector
    
    ProcessedData1_CellVector(1,k)={ProcessedData1_Cell};    
    
end

%% Writing the ProcessedData Matrix to an Excel File

% Creating a Proper File Name

Filename1 = strread(Filename,'%s','delimiter','_'); % Using '_' as Delimiter for removing File Extensions

Filename = Filename1{1,1};

filename = [Filename,'_Converted_File_DailyResolution_',num2str(Res),'-Mins_To_Days','.xlsx'];

for i=1:DataFile_Cell_Len % For Each Sheet in the File

    % Getting the Processed Sheet from ProcessedData1_CellVector
    
    ProcessedData1_Cell=ProcessedData1_CellVector{1,i};
    
    % Wrting the Cleaned Data

    sheet = i;

    xlRange = 'A1';

    xlswrite(filename,ProcessedData1_Cell,sheet,xlRange);
    
end


end

