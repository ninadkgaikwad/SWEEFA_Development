function [SubType_Index]=WTG_SubType_Index_Generator(SubType_Indices_Corrected_SingleCell,WeatherFile_Index)

%% Function Details

% SubType_Indices_Corrected_SingleCell = Cell consisting of Vectors of correct index numbers within the Weather File Indices Vector associated with each SubType
% WeatherFile_Index = Corrected Index for accessing relevant Weather File

%% Computing Sub-Type Index

for i=1:length(SubType_Indices_Corrected_SingleCell) % For each Vector within the Cell
    
    % Getting Relevant Vector from SubType_Indices_Corrected_SingleCell
    
    SubType_Indices_Corrected_Vector=SubType_Indices_Corrected_SingleCell{1,i};
    
    % Getting Index of the Vector if it contains WeatherFile_Index
    
    Index=find(SubType_Indices_Corrected_Vector==WeatherFile_Index);
    
    if(isempty(Index)) % The Vector doest not contain WeatherFile_Index
        
        SubType_Index_Vector(1,i)=0;
        
    else % The Vector doest contains WeatherFile_Index
        
        SubType_Index_Vector(1,i)=Index;
        
    end
    
end

% Finding SubType_Index from SubType_Index_Vector

SubType_Index=find(SubType_Index_Vector~=0);

end

