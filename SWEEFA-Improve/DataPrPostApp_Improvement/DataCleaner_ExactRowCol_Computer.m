function [ ProcessedData,TotDays,DataCapture,DataCols,StartDate ] = DataCleaner_ExactRowCol_Computer( Headers,DataFile,DateTimeString_Processor1_OutputCell )

% Function Details:

%% Computing Exact Rows and Columns

    % Finding Start and End Days of the Data Set
    if Headers==1

        DateTimeStampStartday=DataFile{2,1};

        [ Day, Month, Year ] = DateTimeString_Processor2( DateTimeString_Processor1_OutputCell, DateTimeStampStartday );

        % Start day Information

        StartMonth=Month;

        StartDay=Day;

        StartYear=Year ;
        
        StartDate=[StartYear,StartMonth,StartDay];

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
        
        StartDate=[StartYear,StartMonth,StartDay];        

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


end

