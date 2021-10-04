function [ Height_Index ] = WRFNetcdf_VerticalGrid_CellFinder( PH_Data, PHB_Data, Row_Index, Column_Index, Altitude )

%% Function Details

% PH_Data = PH Complete Variable
% PHB_Data = PHB Complete Variable
% Row_Index = The Row Index on the horizontal Grid where the Users location of interest lies
% Column_Index = The Column Index on the horizontal Grid where the Users location of interest lies
% Altitude = The Location Altitude required by the user

%% Finding Height Index for the Given Altitude and Row Column Indices on the Horizontal Grid

% Extracting Complete Variable PH
%PH_Data = ncread(Fullpathname,'PH');

% Extracting Complete Variable PHB
%PHB_Data = ncread(Fullpathname,'PHB');

% Getting the PH and PHB at Row_Index and Column_Index

PH_AtLocation=PH_Data(Row_Index, Column_Index,:,1);

PHB_AtLocation=PHB_Data(Row_Index, Column_Index,:,1);

% Computing Sizes of PH_AtLocation and PHB_AtLocation

[~,~,Z1,~]=size(PH_AtLocation);
[~,~,Z2,~]=size(PHB_AtLocation);

% Reshaping PH_AtLocation and PHB_AtLocation to Column Vectors

PH_AtLocation=reshape(PH_AtLocation,[Z1,1]);

PHB_AtLocation=reshape(PHB_AtLocation,[Z2,1]);

% Computing Heights : z = (PH + PHB)/9.81 

Heights = (PH_AtLocation + PHB_AtLocation)/(9.81); 

% Getting the Height Index

Error=abs(Heights-Altitude);

[MinError, MinIndex]=min(Error);

Height_At_MinIndex=Heights(MinIndex);

HeightDiff=Height_At_MinIndex-Altitude;

if (HeightDiff>=0)
    
    Height_Index=MinIndex-1;
    
elseif (HeightDiff<0)
    
    Height_Index=MinIndex;
    
end

% Some Additional Checks

if (Height_Index<=0)
    
    Height_Index=1; % First Layer in Unstaggered in Height Direction
    
elseif (Height_Index>=length(Heights))
    
    Height_Index=length(Heights)-1; % Final Unstaggered Layer in Height Direction
    
end

end

