function [WTG_ExtraFile_Cell]=WTG_ExtraFileCreator_Opt4_ForecastMode(PlantCleanedFile_Cell,FileType,GenIrrad,Res,Filename,AllParameters,WindLossParameters)

%% Function Details:

% PlantCleanedFile_Cell = A Cell Structure containing Multiple/Single Sheets/Sheet of Turbine Data  
% FileType = A Scalar : If 1, Then Plant-Status Column is Real Valued ; If 2, Then Plant-Status Column is Ones and Zeros
% GenIrrad = Vector of numbers describing Data Columns to be either Generation Data (if, GenIrrad=1), or Power Data (if, GenIrrad=2), Irradiance Data (if, GenIrrad=0)
% Res = Time Step of the Data File in Minutes
% Filename = A String containing the File Name of the Original Raw Data File
% AllParmeters = A Cell Structure containiing Wind Plant Static Information
% WindLossParameters = A Cell Structure containing Wind Plant Loss Information

%% Creating Extra Files

% Getting the Headers and the Date-Time Matrix

PlantCleanedSheet_Cell=PlantCleanedFile_Cell{1,1};

Headers=PlantCleanedSheet_Cell(1,:);

DateTime_Cell=PlantCleanedSheet_Cell(2:end,1:4);

% Creating a 3-D Matrix for Data-Variables to make Computation easy

for i=1:length(PlantCleanedFile_Cell) % For Each Sheet
    
    PlantCleanedSheet_Cell=PlantCleanedFile_Cell{1,i};
    
    PlantCleanedSheet_DataMatrix=cell2mat(PlantCleanedSheet_Cell(2:end,5:end));
    
    PlantCleanedFile_DataMatrix(:,:,i)=PlantCleanedSheet_DataMatrix;
    
end

%% Simpe Disintegration of AllParameters
 
    % Disintegrating Cell AllParameters

    WG_TurbineType=AllParameters{1,1} ;
    Parameters_T1=AllParameters{1,2} ;
    Parameters_T2=AllParameters{1,3} ;
    Parameters_T3=AllParameters{1,4} ;
    Parameters_T4=AllParameters{1,5} ;

    % Disintegrating WG_TurbineType

    T1=WG_TurbineType(1,1) ;
    T2=WG_TurbineType(1,2) ;
    T3=WG_TurbineType(1,3) ;
    T4=WG_TurbineType(1,4) ;
    
    WG_TurbineType_Total=T1+T2+T3+T4;
    
    % Disintegrating Parameters_T1

    sub_T1=Parameters_T1{1,1} ;
    subnum_T1=Parameters_T1{1,2} ;

    % Disintegrating Parameters_T2

    sub_T2=Parameters_T2{1,1} ;
    subnum_T2=Parameters_T2{1,2} ;

    % Disintegrating Parameters_T3

    sub_T3=Parameters_T3{1,1} ;
    subnum_T3=Parameters_T3{1,2} ;

    % Disintegrating Parameters_T4

    sub_T4=Parameters_T4{1,1} ;
    subnum_T4=Parameters_T4{1,2} ;
    
% Computing Correct Indices for Computation using External Function

sub_T=[sub_T1,sub_T2,sub_T3,sub_T4];
subnum_T={subnum_T1,subnum_T2,subnum_T3,subnum_T4};
    
[WeatherFile_Indices_Cell,SubType_Indices_Corrected_Cell]=WTG_CorrectIndex_CompOpt34_Generator(WG_TurbineType,sub_T,subnum_T);       

%% Creating Plant Level Files - Weather File and Power-Curve File

[R,C,Z]=size(PlantCleanedFile_DataMatrix); % Getting the Size of PlantCleanedFile_DataMatrix

for i=1:C % For Each Column

    % Getting the single Column
    
    SingleColumn_DataMatrix=PlantCleanedFile_DataMatrix(:,i,:);
    
    % Performing Sum or Mean according to Column Number
    
    if (i==5) % Power or Energy Column - Needs to be Added
        
        Processed_SingleColumn=sum(SingleColumn_DataMatrix,3);
        
    elseif (i==4) % Turbine Status Column
        
        if (FileType==1) % Real Values - Needs to be Averaged
            
            Processed_SingleColumn=mean(SingleColumn_DataMatrix,3);
            
        elseif (FileType==2) % One and Zeros - Need to be Added
            
            Processed_SingleColumn=sum(SingleColumn_DataMatrix,3);
            
        end
        
    else % All other Column - Needs to be Averaged
        
        Processed_SingleColumn=mean(SingleColumn_DataMatrix,3);
        
    end
    
    % Creating Processed_SingleColumn_DataMatrix  
    
    if (i==1) % First Filling
        
        Processed_MultiColumn_DataMatrix=[Processed_SingleColumn];
        
    else % Subsequent Filling
        
        Processed_MultiColumn_DataMatrix=horzcat(Processed_MultiColumn_DataMatrix,Processed_SingleColumn);
        
    end  
    
    
end

% Creating Processed_MultiColumn_DataCell

Processed_MultiColumn_DataCell=mat2cell(Processed_MultiColumn_DataMatrix,[R],[C]);

% Getting WindSpeed and Power/Energy

WindSpeed_PlantLevel_Column=Processed_MultiColumn_DataMatrix(:,1);

if (GenIrrad==1) % It is Energy Column
    
    PowerConverter=Res/60;
    
    Power_PlantLevel_Column=(Processed_MultiColumn_DataMatrix(:,5))/(PowerConverter);
    
elseif (GenIrrad==2) % It is Power Column
    
    Power_PlantLevel_Column=Processed_MultiColumn_DataMatrix(:,5);
    
end

% Constructing New WindSpeed_PlantLevel_Column and Power_PlantLevel_Column_New using External Function

Type=1; % Plant Level Files

WTG_Type=0; % Custom Initialization

[WindSpeed_PlantLevel_Column_New,Power_PlantLevel_Column_New]=WTG_PlantLevel_WindSpeedPowerColumn_Generator_Opt3(WindSpeed_PlantLevel_Column,Power_PlantLevel_Column,AllParmeters,Type,WTG_Type);

% Using External Function to Create Plant Level Power Curve

[PlantLevel_PowerCurve_Cell]=WTG_PlantLevel_PowerCurve_Generator(WindSpeed_PlantLevel_Column_New,Power_PlantLevel_Column_New);

% Creating WTG_ExtraFile_Cell

WTG_ExtraFile_Cell=horzcat(DateTime_Cell,Processed_MultiColumn_DataCell);

WTG_ExtraFile_Cell=vertcat(Headers, WTG_ExtraFile_Cell);

% Creating Excel Files

Filename1 = strread(Filename,'%s','delimiter','_'); % Using '_' as Delimiter for removing File Extensions

Filename = Filename1{1,1};

% For Plant-Level File
    
filename = [Filename,'_WTGPLANTLEVEL_PowerCurve.xlsx']; 

% Creating the Excel File

sheet = 1;

xlRange = 'A1';

xlswrite(filename,PlantLevel_PowerCurve_Cell,sheet,xlRange);

% For Plant-Level File

if (FileType==1) % Turbine Status Real Values
    
    filename = [Filename,'_ProcessedWindPLANTLEVELFile_ARIMA-ANNInput.xlsx'];
    
elseif (FileType==2) % Turbine Status Ones and Zeros
    
    filename = [Filename,'_ProcessedWindPLANTLEVELFile_EnergyEstimation.xlsx'];
    
end

% Creating the Excel File

sheet = 1;

xlRange = 'A1';

xlswrite(filename,WTG_ExtraFile_Cell,sheet,xlRange); 

end

