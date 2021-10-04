function [WRFNetcdf_SingleVariable]=WRFNetcdf_SingleVariable_Extractor(Fullpathname,Var_Name,Var_Size,Var_Dimensions,Var_Coordinates,Row_Index, Col_Index, Z_Index,TimeLen)

%% Function Details

% Fullpathname = Full path of the WRF-NETCDF File [String]
% Var_Name = Name of the WRF-NETCDF Variable to be extracted [String]
% Var_Size = Vector of the WRF-NETCDF Variable Size Dimensions [Double-Vector]
% Var_Dimensions = Cell of the WRF-NETCDF Variable Dimensions [Cell-String]
% Var_Coordinates = Cell of the WRF-NETCDF Variable Coordinates [Cell-String]
% Row_Index = Scalar of the Grid Location Row
% Col_Index = Scalar of the Grid Location Column
% Z_Index = Scalar of the Grid Location Vertical Cell
% TimeLen = Scalar of the Time Dimension of WRF-NETCDF Variable

%% Extracting Single WRF-NETCDF Variable

% Extracting the Complete Single Variable

VarData = ncread(Fullpathname,Var_Name);

% Extracting Single Variable based on the length of its Var_Size

Len_Var_Size=length(Var_Size);

if (Len_Var_Size==2) % Single Variable is 2-D
    
    % Computing Length of Var_Dimensions
    
    Len_Var_Dimensions=length(Var_Dimensions);
    
    % Extracting Single Variable based on the length of its Var_Dimensions
    if (Len_Var_Dimensions==1) %
        
        for i=1:TimeLen
            
            WRFNetcdf_SingleVariable(i,1)=VarData(i,1);
            
        end
        
    elseif (Len_Var_Dimensions==2) %
        
        % Getting the 1st Var_Dimensions Name
        
        Var_Dimensions_Name1=Var_Dimensions{1,1};
        
        % Extracting Single Variable based on the first Name of its Var_Dimensions
        if (strcmp(Var_Dimensions_Name1,'bottom_top')) % Use Z_Index
            
            for i=1:TimeLen

                WRFNetcdf_SingleVariable(i,1)=VarData(Z_Index,i);

            end            
            
        elseif (strcmp(Var_Dimensions_Name1,'bottom_top_stag')) % Use Z_Index and Staggering
            
            for i=1:TimeLen

                WRFNetcdf_SingleVariable1(i,1)=VarData(Z_Index,i);

            end     
            
            for i=1:TimeLen

                WRFNetcdf_SingleVariable2(i,1)=VarData(Z_Index+1,i);

            end  
            
            % Correcting for Bottom-Top-Stagger
            
            WRFNetcdf_SingleVariable=(WRFNetcdf_SingleVariable1+WRFNetcdf_SingleVariable2)/2;
            
        else % Get only the 1st layer in all time
            
            for i=1:TimeLen

                WRFNetcdf_SingleVariable(i,1)=VarData(1,i);

            end                
            
        end
    end
    
elseif (Len_Var_Size==3) % Single Variable is 3-D
    
    if (strcmp(Var_Dimensions{1,1},'west_east_stag')) % Variable Staggered in West-East Direction [U-Grid]
        
        for i=1:TimeLen

            WRFNetcdf_SingleVariable1(i,1)=VarData(Row_Index,Col_Index,i);

        end  
        
        for i=1:TimeLen

            WRFNetcdf_SingleVariable2(i,1)=VarData(Row_Index+1,Col_Index,i);

        end   
        
        % Correcting for West-East-Stagger

        WRFNetcdf_SingleVariable=(WRFNetcdf_SingleVariable1+WRFNetcdf_SingleVariable2)/2;        
        
    elseif (strcmp(Var_Dimensions{1,2},'south_north_stag')) % Variable Staggered in South-North Direction [V-Grid]
        
        for i=1:TimeLen

            WRFNetcdf_SingleVariable1(i,1)=VarData(Row_Index,Col_Index,i);

        end  
        
        for i=1:TimeLen

            WRFNetcdf_SingleVariable2(i,1)=VarData(Row_Index,Col_Index+1,i);

        end   
        
        % Correcting for South-North-Stagger

        WRFNetcdf_SingleVariable=(WRFNetcdf_SingleVariable1+WRFNetcdf_SingleVariable2)/2;        
        
    else % Variable not Staggered in any Direction [M-Grid]
        
        for i=1:TimeLen

            WRFNetcdf_SingleVariable(i,1)=VarData(Row_Index,Col_Index,i);

        end          
        
    end
    
elseif (Len_Var_Size==4) % Single Variable is 4-D
    
    if (length(strfind(Var_Dimensions{1,3},'bottom_top'))>=1) % 3rd Dimension is Vertical Grid
        
        if (strcmp(Var_Dimensions{1,1},'west_east_stag')) % Variable Staggered in West-East Direction [U-Grid]

            for i=1:TimeLen

                WRFNetcdf_SingleVariable1(i,1)=VarData(Row_Index,Col_Index,Z_Index,i);

            end  

            for i=1:TimeLen

                WRFNetcdf_SingleVariable2(i,1)=VarData(Row_Index+1,Col_Index,Z_Index,i);

            end   

            % Correcting for West-East-Stagger

            WRFNetcdf_SingleVariable=(WRFNetcdf_SingleVariable1+WRFNetcdf_SingleVariable2)/2; 

        elseif (strcmp(Var_Dimensions{1,2},'south_north_stag')) % Variable Staggered in South-North Direction [V-Grid]

            for i=1:TimeLen

                WRFNetcdf_SingleVariable1(i,1)=VarData(Row_Index,Col_Index,Z_Index,i);

            end  

            for i=1:TimeLen

                WRFNetcdf_SingleVariable2(i,1)=VarData(Row_Index,Col_Index+1,Z_Index,i);

            end   

            % Correcting for South-North-Stagger

            WRFNetcdf_SingleVariable=(WRFNetcdf_SingleVariable1+WRFNetcdf_SingleVariable2)/2;
            
        elseif (strcmp(Var_Dimensions{1,3},'bottom_top_stag')) % Variable Staggered in Bootom-Top Direction [Z-Grid] 
            
            for i=1:TimeLen

                WRFNetcdf_SingleVariable1(i,1)=VarData(Row_Index,Col_Index,Z_Index,i);

            end  

            for i=1:TimeLen

                WRFNetcdf_SingleVariable2(i,1)=VarData(Row_Index,Col_Index,Z_Index+1,i);

            end   

            % Correcting for Bottom-Top-Stagger

            WRFNetcdf_SingleVariable=(WRFNetcdf_SingleVariable1+WRFNetcdf_SingleVariable2)/2;            

        else % Variable not Staggered in any Direction [M-Grid]

            for i=1:TimeLen

                WRFNetcdf_SingleVariable(i,1)=VarData(Row_Index,Col_Index,Z_Index,i);

            end 

        end                
        
    else % 3rd Dimension is Layer Grid
        
        if (strcmp(Var_Dimensions{1,1},'west_east_stag')) % Variable Staggered in West-East Direction [U-Grid]

            for i=1:TimeLen

                WRFNetcdf_SingleVariable1(i,1)=VarData(Row_Index,Col_Index,1,i);

            end  

            for i=1:TimeLen

                WRFNetcdf_SingleVariable2(i,1)=VarData(Row_Index+1,Col_Index,1,i);

            end   

            % Correcting for West-East-Stagger

            WRFNetcdf_SingleVariable=(WRFNetcdf_SingleVariable1+WRFNetcdf_SingleVariable2)/2;

        elseif (strcmp(Var_Dimensions{1,2},'south_north_stag')) % Variable Staggered in South-North Direction [V-Grid]

            for i=1:TimeLen

                WRFNetcdf_SingleVariable1(i,1)=VarData(Row_Index,Col_Index,1,i);

            end  

            for i=1:TimeLen

                WRFNetcdf_SingleVariable2(i,1)=VarData(Row_Index,Col_Index+1,1,i);

            end   

            % Correcting for South-North-Stagger

            WRFNetcdf_SingleVariable=(WRFNetcdf_SingleVariable1+WRFNetcdf_SingleVariable2)/2;

        else % Variable not Staggered in any Direction [M-Grid]

            for i=1:TimeLen

                WRFNetcdf_SingleVariable(i,1)=VarData(Row_Index,Col_Index,1,i);

            end 

        end        
        
    end
    
end

end

