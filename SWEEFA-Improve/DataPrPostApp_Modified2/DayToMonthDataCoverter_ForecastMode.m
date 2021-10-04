function [ ProcessedData1 ] = DayToMonthDataCoverter_ForecastMode( DataCols,AvgOrAdd,Headers )
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

        Header1 = DataFile(1,4:(DataCols+3));    

        % Clearing the not needed DataFile Variable

        clearvars DataFile

        Header = {'Month', 'Year'};

        % Concatenating Headers derived frome the Original File

        Header = [Header, Header1];    

    elseif (Headers==0)

        Header = {'Month', 'Year'};
        
        for j=1:DataCols
            
            Header1(1,(j+2))={''};
            
        end
        
        % Concatenating Headers derived frome the Original File

        Header = [Header, Header1];            

    end

    %% Computing Size of ProcessedData Matrix

    % [Row1,Col1]=size(ProcessedData);
    % 
    % ProcessedData(Row1+1,:)=ProcessedData(Row1,:); % For avoiding the problem with starting with 0 time field
    % 
    % ProcessedData(Row1+1,4)=0; % For avoiding the problem with starting with 0 time field

    [Row,Col]=size(ProcessedData);

    % ProcessedData=ProcessedData(1:(Row-1),:); % Removing Last Row as it Contains Value for Next Day
    % 
    % [Row,Col]=size(ProcessedData); % Size of the Newly Reduced ProcessedData Matrix

    % Computing the DayDataPoints

    % DayDataPoints=24*(60/Res);
    % 
    % RowNew=Row/DayDataPoints; % Computing Number of Rows for the PRocessedData1 Matrix

    RowNew=ceil(Row/30)+1;

    % Initializing The New ProcessedData Matrix

    ProcessedData1=zeros(RowNew,(2+DataCols));

    % % Computing Number off ROWS to be AVERAGED or ADDED
    % 
    % NumRows=DayDataPoints;

    % Initializing Index for ProcessedData1 Matrix

    Index1=0;

    %Initializing Month Memory

    MonthMemo=zeros(1,2);

    % Copying First Row Month Value to MonthMemo(1,1)

    MonthMemo(1,1)=ProcessedData(1,2);

    % Initializing Add and Avg Matrices

    Add=zeros(1,DataCols);

    Avg=zeros(1,1,DataCols);

    index=1; % Initializing Column Index for Avg

    % Initializing Row Index for Add and Average

    %% FOR LOOP for Averging and Adding to get Desired ResNew according to AvgOrAdd

    % FOR LOOP for each ROW of ProcessedData

    for i=1:(Row+1)

        % Copying i^(th) Row Month to MonthMemo(1,2)

        if i<=Row

            MonthMemo(1,2)=ProcessedData(i,2); 

        end

        % Using MonthMemo to Distinguish Between Months

        if (MonthMemo(1,1)~=MonthMemo(1,2))||(i==Row+1) % i^(th) Row is of the DIFFERENT MONTH        

            Index1=Index1+1; % Incrementing Row Index for ProcessesdData1 Matrix

            ProcessedData1(Index1,1)=MonthMemo(1,1); % Copying Correct Month to ProcessedData1

            ProcessedData1(Index1,2)=ProcessedData(i-1,3); % Copying Correct Year to ProcessedData1

            % For Copying Added and Averaged Data into Correct Rows of the ProcessedData1 Matrix        

                for k=1:DataCols

                    Indicator=AvgOrAdd(1,k); % For indication Values Should be Averaged or Added                                   

                     if Indicator==1 % ADDITION

                          ProcessedData1(Index1,(k+3))=Add(1,k);

                     elseif Indicator==0 % AVERAGE

                          ProcessedData1(Index1,(k+3))=sum(Avg(1,:,k))/(index-1);

                     end

               end         


            MonthMemo(1,1)=MonthMemo(1,2); % Copying New Month Value to MonthMemo(1,1)

            % Re-Initializing Add and Avg Matrices

            Add=zeros(1,DataCols);

            Avg=zeros(1,1,DataCols);

            index=0; % Re-Initializing Column Index for Avg

        elseif MonthMemo(1,1)==MonthMemo(1,2) % i^(th) Row is of the SAME MONTH

               for k=1:DataCols

                    Indicator=AvgOrAdd(1,k); % For indication Values Should be Averaged or Added                                   

                     if Indicator==1 % ADDITION

                          Add(1,k)=Add(1,k)+ProcessedData(i,(k+3));

                     elseif Indicator==0 % AVERAGE

                          Avg(1,index,k)=ProcessedData(i,(k+3));

                     end

               end   

        end

         % Incrementing Column Index for Avg

         index=index+1;   

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

filename = [Filename,'_Converted_File_MonthlyResolution_',num2str(Res),'-Days_To_Months','.xlsx'];

for i=1:DataFile_Cell_Len % For Each Sheet in the File

    % Getting the Processed Sheet from ProcessedData1_CellVector
    
    ProcessedData1_Cell=ProcessedData1_CellVector{1,i};
    
    % Wrting the Cleaned Data

    sheet = i;

    xlRange = 'A1';

    xlswrite(filename,ProcessedData1_Cell,sheet,xlRange);
    
end


end


