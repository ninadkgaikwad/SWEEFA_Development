function [ ProcessedData ] = WTG_ForecastFile_TStatCorrector( Headers, FileType, TurbineStatusCol, TStat_Differentiating_Val )

%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[ProcessedData]=xlsread(Fullpathname,1);

%% Correcting Turbine Status Values based on the Differentiating Value

% Getting the size of the ProcessedData Matrix

[Row, Col] = size(ProcessedData);

% Creating a TurbineStateVector

TurbineStateVector = zeros(Row,1);

% Computing the Corrected Column Number for the Turbine Status variable based on the File Type

if (FileType==1)
    
    % Computing IndexCorrector
    
    IndexCorrector=4;
    
    % Computing DataCols
    
    DataCols = Col-4;
    
elseif (FileType==2)
    
    % Computing IndexCorrector
    
    IndexCorrector=3;
    
    % Computing DataCols
    
    DataCols = Col-3;
    
elseif (FileType==3)
    
    % Computing IndexCorrector
    
    IndexCorrector=2;
    
    % Computing DataCols
    
    DataCols = Col-2;
    
end

% Filling the TurbineStateVector based on TStat_Differentiating_Val

for i = 1:Row
    
   if (ProcessedData(i,(TurbineStatusCol+IndexCorrector)) >= TStat_Differentiating_Val)
       
       TurbineStateVector(i,1)=1;    
             
   end
    
end

% Replacing the TurbineState Vector from the ProcessedData Matrix with new TurbineState Vector

ProcessedData(:,(TurbineStatusCol+IndexCorrector)) = TurbineStateVector(:,1);

%% Writing the ProcessedData Matrix to an Excel File

% Creating a Proper File Name

Filename1 = strread(Filename,'%s','delimiter','.'); % Using '.' as Delimiter for removing File Extensions

Filename = Filename1{1,1};
    
filename = [Filename,'_TStat-Corrected.xlsx'];     

% Writing the Header

if (Headers==1) % Headers are Present

    if (FileType==1) % Intra-Day File
        
        % Getting Headers

        [~ ,~,DataFile]=xlsread(Fullpathname,1);

        % Getting the Header Text

        Header1 = DataFile(1,5:(DataCols+4));    

        % Clearing the not needed DataFile Variable

        clearvars DataFile

        Header = {'Day', 'Month', 'Year','Time'};

        % Concatenating Headers derived frome the Original File

        Header = [Header, Header1];  

         

    elseif (FileType==2) % Daily File

        % Getting Headers

        [~ ,~,DataFile]=xlsread(Fullpathname,1);

        % Getting the Header Text

        Header1 = DataFile(1,5:(DataCols+4));    

        % Clearing the not needed DataFile Variable

        clearvars DataFile

        Header = {'Day', 'Month', 'Year'};

        % Concatenating Headers derived frome the Original File

        Header = [Header, Header1]; 

    elseif (FileType==3) % Monthly File

        % Getting Headers

        [~ ,~,DataFile]=xlsread(Fullpathname,1);

        % Getting the Header Text

        Header1 = DataFile(1,5:(DataCols+4));    

        % Clearing the not needed DataFile Variable

        clearvars DataFile

        Header = {'Month', 'Year'};

        % Concatenating Headers derived frome the Original File

        Header = [Header, Header1]; 

    end  
    
elseif (Headers==0) % Headers Not Present
    
    if (FileType==1) % Intra-Day File

        Header = {'Day', 'Month', 'Year', 'Time', 'Wind-Speed', 'Temperature', 'Wind-Direction', 'Plant Status', 'Generation'};    

    elseif (FileType==2) % Daily File

        Header = {'Day', 'Month', 'Year', 'Wind-Speed', 'Temperature', 'Wind-Direction', 'Plant Status', 'Generation'};

    elseif (FileType==3) % Monthly File

        Header = {'Month', 'Year', 'Wind-Speed', 'Temperature', 'Wind-Direction', 'Plant Status', 'Generation'};

    end       
    
end
 
sheet = 1;

xlRange = 'A1';

xlswrite(filename,Header,sheet,xlRange);

% Wrting the Cleaned Data

sheet = 1;

xlRange = 'A2';

xlswrite(filename,ProcessedData,sheet,xlRange);

end

