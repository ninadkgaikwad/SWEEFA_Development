function [WeatherFile_Indices_Cell,SubType_Indices_Corrected_Cell]=WTG_CorrectIndex_CompOpt34_Generator(WG_TurbineType,sub_T,subnum_T)

%% Function Details

% WG_TurbineType = Vector containing Information regarding presences of WTG Type
% sub_T = Vector containing number of subtypes per WTG Type
% subnum_T = Cell containing one Vector per WTG Type having Total number of Turbines per subtype 
% ComputationOptionsMenu = Scalar containing Computation Option ; If 3 , Then Real Averaged Power Curve per Turbine is used ; If 2 , Then Standard Power Curve per Subtype is used

%% Computation of Correct Indices for Computation

% Getting Length of WG_TurbineType

Len_WG_TurbineType = length(WG_TurbineType);

% Computing Correct Indices

%WG_Counter=0; % Initializing WG_Counter

WG_Previous_Len=0; % Initializing WG_Previous_Len

% Computing the Vectors for the WeatherFile Indices

for i=1:Len_WG_TurbineType % For Each Turbine Type
    
    % Computing Total Number of Turbines in a given WG_Type
    
    subnum_T_Vect=subnum_T{1,i};
    
    subnum_T_Total=sum(subnum_T_Vect);
    
    if (WG_TurbineType(1,i)==1) % This Turbine-Type is present        
            
        % Computing the Correct Indices for the Weather File

        WeatherFile_Indices=(WG_Previous_Len+1):(subnum_T_Total+WG_Previous_Len);

        % Storing Weather_Indices in a Cell

        WeatherFile_Indices_Cell(1,i)={WeatherFile_Indices};

        % Updating WG_Previous_Len

        WG_Previous_Len=WeatherFile_Indices(1,end);          
        
    elseif (WG_TurbineType(1,i)==0) % This Turbine-Type is not present
        
        % Storing Weather_Indices in a Cell

        WeatherFile_Indices_Cell(1,i)={0};
        
    end
    
end


% Computing the Vectors for the Sub Types

for i=1:Len_WG_TurbineType % For Each Turbine Type   
    
    % Getting Relevant subnum_T
    
    SubNum_T=subnum_T{1,i};
    
    if (WG_TurbineType(1,i)==1) % This Turbine-Type is present
        
        SubType_Previous_Len=0; % Initializing SubType_Previous_Len
        
        for j=1:sub_T(1,i) % For Ech Sub-Type of the Main Turbine Type
            
            % Computing Sub-Type Indices
            
            SubType_Indices1=[(SubType_Previous_Len+1):(SubNum_T(1,j)+SubType_Previous_Len)];
            
            % Correcting Sub-Type Indices with Addition_Index
            
            SubType_Indices1=SubType_Indices1;
            
            % Storing SubType_Indices in a Cell

            SubType_Indices_Cell1(1,j)={SubType_Indices1};

            % Updating Previous_Len

            SubType_Previous_Len=SubType_Indices1(1,end);            
            
        end
        
        % Storing SubType_Indices_Cell1 in SubType_Indices_Cell
    
        SubType_Indices_Cell(1,i) = {SubType_Indices_Cell1};            
        
    elseif (WG_TurbineType(1,i)==0) % This Turbine-Type is not present
        
         % Storing SubType_Indices in a Cell
        
        SubType_Indices_Cell1={0};
        
        % Storing SubType_Indices_Cell1 in SubType_Indices_Cell
    
        SubType_Indices_Cell(1,i) = {SubType_Indices_Cell1};        
        
    end 
  
end

% Computing the Corrected Vectors for the Sub Types

for i=1:Len_WG_TurbineType % For Each Turbine Type
    
    % Getting Relevant Weather Indices
    
    WeatherFile_Indices=WeatherFile_Indices_Cell{1,i};
    
    WeatherFile_StartIndex=WeatherFile_Indices(1,1);
           
    if (WeatherFile_StartIndex==1)
        
        Addition_Index=0;
        
    elseif (WeatherFile_StartIndex~=1)
        
        Addition_Index=(WeatherFile_StartIndex-1);
        
    end
    
    % Getting Relevant SubType_Indices_Cell
    
    SubType_Indices=SubType_Indices_Cell{1,i};
    
    % Getting Relevant subnum_T
    
    SubNum_T=subnum_T{1,i};
    
    if (WG_TurbineType(1,i)==1) % This Turbine-Type is present
                
        for j=1:sub_T(1,i) % For Ech Sub-Type of the Main Turbine Type
            
            SubType_Indices1=SubType_Indices{1,j};
            
            SubType_Indices1_Corrected=SubType_Indices1+Addition_Index;
            
            SubType_Indices1_Corrected_Cell(1,j)={SubType_Indices1_Corrected};
            
        end                 
        
        SubType_Indices_Corrected_Cell(1,i)={SubType_Indices1_Corrected_Cell};
        
    elseif (WG_TurbineType(1,i)==0) % This Turbine-Type is not present
        
     SubType_Indices1_Corrected_Cell={0};
     
     SubType_Indices_Corrected_Cell(1,i)={SubType_Indices1_Corrected_Cell};
        
    end   
   
end

end

