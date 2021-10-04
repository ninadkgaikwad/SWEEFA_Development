function [ ProcessedData1 ] = WTG_SingleInputFileConverter( RequiredColNumbers, TurbineStatusCol_Conversion, TurbineStatusVal, TurbineStatusVal_ErrorPercentBand,TurbineStatusBased_GenerationCorrection,FileType)

%% Detailed Explanation goes here

% RequiredColNumbers = A Vector of the Required Column Numbers [Wind-Speed, Temperature, Wind-Direction, Plant Status, Generation], If required Column not present in the Input File put zero
% TurbineStatusCol_Conversion = If Plant-Status is to be converted, then 1 ; else 0
% TurbineStatusVal = A Vector of all the different Plant Status values for which the Turbine PRODUCES POWER as provided by the OEM provider
% TurbineStatusVal_ErrorPercentBand = A Vector of percentage values for the calculation of Error Band around the Power Producing Turbine State Value corresponding to above vector (Needed due to averaging effect of high resolution files)
% TurbineStatusBased_GenerationCorrection = If Correction required, then 1 ;  else 0


%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[ProcessedData]=xlsread(Fullpathname,1);

% Getting the Size of the ProcessedData Matrix

[Row, Col] = size(ProcessedData);

%% Getting the Column Numbers of the Required Variables

WindSpeedCol=RequiredColNumbers(1,1);

TempCol=RequiredColNumbers(1,2);

WindDirectionCol=RequiredColNumbers(1,3);

TurbineStatusCol=RequiredColNumbers(1,4);

GenerationCol=RequiredColNumbers(1,5);

%% Creating the desired Format File as per Application Specification


if (FileType==1) % Intra-Day File
    
    % Creating Container for the Processed Data

    ProcessedData1=zeros(Row,9); % 4==DataTime Stamp ; 5==Five Data Variables 

    % Note: The Required Structure of the DataFile [Day, Month, Year, Time, Wind-Speed, Temperature, Wind-Direction, Plant Status, Generation]

    % Putting Date-Time Stamp in the ProcessedData1 Matrix

    ProcessedData1(:,1:4)=ProcessedData(:,1:4);

    % Putting Wind-Speed Column in the Correct Position inside ProcessedData1 Matrix

    if (WindSpeedCol>0)

        ProcessedData1(:,5)=ProcessedData(:,(WindSpeedCol+4));

    end
    % Putting Temperature Column in the Correct Position inside ProcessedData1 Matrix

    if (TempCol>0)

    ProcessedData1(:,6)=ProcessedData(:,(TempCol+4));

    end

    % Putting Wind-Direction Column in the Correct Position inside ProcessedData1 Matrix

    if (WindDirectionCol>0)

    ProcessedData1(:,7)=ProcessedData(:,(WindDirectionCol+4));

    end

    % Putting Generation Column in the Correct Position inside ProcessedData1 Matrix

    if (GenerationCol>0)

    ProcessedData1(:,9)=ProcessedData(:,(GenerationCol+4));

    end

    % Putting Plant-Status Column in the Correct Position inside ProcessedData1 Matrix

    if (TurbineStatusCol_Conversion==1)

        ProcessedData1(:,8) = WTG_TurbineStatusConverter(ProcessedData(:,(TurbineStatusCol+4)),TurbineStatusVal,TurbineStatusVal_ErrorPercentBand);

        % Turbine Status Based Generation Correction

        if (TurbineStatusBased_GenerationCorrection==1) % Correction Required

            for k = 1:Row % For loop for each value in the Generation Column

                if (ProcessedData1(k,8)==0) % Turbine not in Power Producing Status

                    ProcessedData1(k,9) = 0; % Putting zeros in Generation where Turbine Status is anything other than Power Producing Status

                else % Turbine in Power Producing Status

                    % Do Nothing

                end

            end

        elseif (TurbineStatusBased_GenerationCorrection==0) % Correction not Required

            % Do nothing

        end

    elseif (TurbineStatusCol_Conversion==0) % Do not convert the Plant-Status Values

        if (TurbineStatusCol>0)

        ProcessedData1(:,8)=ProcessedData(:,(TurbineStatusCol+4));

        end    

    end
    
    
elseif (FileType==2) % Daily File
    
    % Creating Container for the Processed Data

    ProcessedData1=zeros(Row,8); % 3==DataTime Stamp ; 5==Five Data Variables 

    % Note: The Required Structure of the DataFile [Day, Month, Year, Time, Wind-Speed, Temperature, Wind-Direction, Plant Status, Generation]

    % Putting Date-Time Stamp in the ProcessedData1 Matrix

    ProcessedData1(:,1:3)=ProcessedData(:,1:3);

    % Putting Wind-Speed Column in the Correct Position inside ProcessedData1 Matrix

    if (WindSpeedCol>0)

        ProcessedData1(:,4)=ProcessedData(:,(WindSpeedCol+3));

    end
    % Putting Temperature Column in the Correct Position inside ProcessedData1 Matrix

    if (TempCol>0)

    ProcessedData1(:,5)=ProcessedData(:,(TempCol+3));

    end

    % Putting Wind-Direction Column in the Correct Position inside ProcessedData1 Matrix

    if (WindDirectionCol>0)

    ProcessedData1(:,6)=ProcessedData(:,(WindDirectionCol+3));

    end

    % Putting Generation Column in the Correct Position inside ProcessedData1 Matrix

    if (GenerationCol>0)

    ProcessedData1(:,8)=ProcessedData(:,(GenerationCol+3));

    end

    % Putting Plant-Status Column in the Correct Position inside ProcessedData1 Matrix

    if (TurbineStatusCol_Conversion==1)

        ProcessedData1(:,7) = WTG_TurbineStatusConverter(ProcessedData(:,(TurbineStatusCol+3)),TurbineStatusVal,TurbineStatusVal_ErrorPercentBand);

        % Turbine Status Based Generation Correction

        if (TurbineStatusBased_GenerationCorrection==1) % Correction Required

            for k = 1:Row % For loop for each value in the Generation Column

                if (ProcessedData1(k,7)==0) % Turbine not in Power Producing Status

                    ProcessedData1(k,8) = 0; % Putting zeros in Generation where Turbine Status is anything other than Power Producing Status

                else % Turbine in Power Producing Status

                    % Do Nothing

                end

            end

        elseif (TurbineStatusBased_GenerationCorrection==0) % Correction not Required

            % Do nothing

        end

    elseif (TurbineStatusCol_Conversion==0) % Do not convert the Plant-Status Values

        if (TurbineStatusCol>0)

        ProcessedData1(:,7)=ProcessedData(:,(TurbineStatusCol+3));

        end    

    end
    
    
elseif (FileType==3) % Monthly File
    
    % Creating Container for the Processed Data

    ProcessedData1=zeros(Row,7); % 2==DataTime Stamp ; 5==Five Data Variables 

    % Note: The Required Structure of the DataFile [Day, Month, Year, Time, Wind-Speed, Temperature, Wind-Direction, Plant Status, Generation]

    % Putting Date-Time Stamp in the ProcessedData1 Matrix

    ProcessedData1(:,1:2)=ProcessedData(:,1:2);

    % Putting Wind-Speed Column in the Correct Position inside ProcessedData1 Matrix

    if (WindSpeedCol>0)

        ProcessedData1(:,3)=ProcessedData(:,(WindSpeedCol+2));

    end
    % Putting Temperature Column in the Correct Position inside ProcessedData1 Matrix

    if (TempCol>0)

    ProcessedData1(:,4)=ProcessedData(:,(TempCol+2));

    end

    % Putting Wind-Direction Column in the Correct Position inside ProcessedData1 Matrix

    if (WindDirectionCol>0)

    ProcessedData1(:,5)=ProcessedData(:,(WindDirectionCol+2));

    end

    % Putting Generation Column in the Correct Position inside ProcessedData1 Matrix

    if (GenerationCol>0)

    ProcessedData1(:,7)=ProcessedData(:,(GenerationCol+2));

    end

    % Putting Plant-Status Column in the Correct Position inside ProcessedData1 Matrix

    if (TurbineStatusCol_Conversion==1)

        ProcessedData1(:,6) = WTG_TurbineStatusConverter(ProcessedData(:,(TurbineStatusCol+2)),TurbineStatusVal,TurbineStatusVal_ErrorPercentBand);

        % Turbine Status Based Generation Correction

        if (TurbineStatusBased_GenerationCorrection==1) % Correction Required

            for k = 1:Row % For loop for each value in the Generation Column

                if (ProcessedData1(k,6)==0) % Turbine not in Power Producing Status

                    ProcessedData1(k,7) = 0; % Putting zeros in Generation where Turbine Status is anything other than Power Producing Status

                else % Turbine in Power Producing Status

                    % Do Nothing

                end

            end

        elseif (TurbineStatusBased_GenerationCorrection==0) % Correction not Required

            % Do nothing

        end

    elseif (TurbineStatusCol_Conversion==0) % Do not convert the Plant-Status Values

        if (TurbineStatusCol>0)

        ProcessedData1(:,6)=ProcessedData(:,(TurbineStatusCol+2));

        end    

    end
    
    
end

%     % Creating Container for the Processed Data
% 
%     ProcessedData1=zeros(Row,9); % 4==DataTime Stamp ; 5==Five Data Variables 
% 
%     % Note: The Required Structure of the DataFile [Day, Month, Year, Time, Wind-Speed, Temperature, Wind-Direction, Plant Status, Generation]
% 
%     % Putting Date-Time Stamp in the ProcessedData1 Matrix
% 
%     ProcessedData1(:,1:4)=ProcessedData(:,1:4);
% 
%     % Putting Wind-Speed Column in the Correct Position inside ProcessedData1 Matrix
% 
%     if (WindSpeedCol>0)
% 
%         ProcessedData1(:,5)=ProcessedData(:,(WindSpeedCol+4));
% 
%     end
%     % Putting Temperature Column in the Correct Position inside ProcessedData1 Matrix
% 
%     if (TempCol>0)
% 
%     ProcessedData1(:,6)=ProcessedData(:,(TempCol+4));
% 
%     end
% 
%     % Putting Wind-Direction Column in the Correct Position inside ProcessedData1 Matrix
% 
%     if (WindDirectionCol>0)
% 
%     ProcessedData1(:,7)=ProcessedData(:,(WindDirectionCol+4));
% 
%     end
% 
%     % Putting Generation Column in the Correct Position inside ProcessedData1 Matrix
% 
%     if (GenerationCol>0)
% 
%     ProcessedData1(:,9)=ProcessedData(:,(GenerationCol+4));
% 
%     end
% 
%     % Putting Plant-Status Column in the Correct Position inside ProcessedData1 Matrix
% 
%     if (TurbineStatusCol_Conversion==1)
% 
%         ProcessedData1(:,8) = WTG_TurbineStatusConverter(ProcessedData(:,(TurbineStatusCol+4)),TurbineStatusVal,TurbineStatusVal_ErrorPercentBand);
% 
%         % Turbine Status Based Generation Correction
% 
%         if (TurbineStatusBased_GenerationCorrection==1) % Correction Required
% 
%             for k = 1:Row % For loop for each value in the Generation Column
% 
%                 if (ProcessedData1(k,8)==0) % Turbine not in Power Producing Status
% 
%                     ProcessedData1(k,9) = 0; % Putting zeros in Generation where Turbine Status is anything other than Power Producing Status
% 
%                 else % Turbine in Power Producing Status
% 
%                     % Do Nothing
% 
%                 end
% 
%             end
% 
%         elseif (TurbineStatusBased_GenerationCorrection==0) % Correction not Required
% 
%             % Do nothing
% 
%         end
% 
%     elseif (TurbineStatusCol_Conversion==0) % Do not convert the Plant-Status Values
% 
%         if (TurbineStatusCol>0)
% 
%         ProcessedData1(:,8)=ProcessedData(:,(TurbineStatusCol+4));
% 
%         end    
% 
%     end



%% Writing the ProcessedData Matrix to an Excel File

% Creating a Proper File Name

Filename1 = strread(Filename,'%s','delimiter','.'); % Using '.' as Delimiter for removing File Extensions

Filename = Filename1{1,1};

if (TurbineStatusCol_Conversion==0)
    
    filename = [Filename,'_TStat-NConverted_Aligned.xlsx'];    
    
elseif (TurbineStatusCol_Conversion==1)
    
    filename = [Filename,'_TStat-Converted_Aligned.xlsx'];     
    
end

% Writing the Header

if (FileType==1) % Intra-Day File
    
    Header = {'Day', 'Month', 'Year', 'Time', 'Wind-Speed', 'Temperature', 'Wind-Direction', 'Plant Status', 'Generation'};    
    
elseif (FileType==2) % Daily File
    
    Header = {'Day', 'Month', 'Year', 'Wind-Speed', 'Temperature', 'Wind-Direction', 'Plant Status', 'Generation'};
    
elseif (FileType==3) % Monthly File
    
    Header = {'Month', 'Year', 'Wind-Speed', 'Temperature', 'Wind-Direction', 'Plant Status', 'Generation'};
    
end    
   
sheet = 1;

xlRange = 'A1';

xlswrite(filename,Header,sheet,xlRange);

% Wrting the Cleaned Data

sheet = 1;

xlRange = 'A2';

xlswrite(filename,ProcessedData1,sheet,xlRange);

end

