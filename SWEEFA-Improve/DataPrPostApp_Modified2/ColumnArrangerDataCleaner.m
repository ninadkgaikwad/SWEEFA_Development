function [PlantCorrectlyArrangedDataSheet]=ColumnArrangerDataCleaner(PlantRawDataSheet_Cell,RelevantColumnPositions,ExtraColumnPositions,PlantType)

%% Function Details:

% PlantRawDataSheet_Cell = A Cell structure containing the Original File Data
% RelevantColumnPositions = A Scalar containing the Column Numbers of the original file selected and ordered as per application requirement 
% ExtraColumnPositions = A Scalr containing the extra Column Numbers of the original file selected and ordered as per user requirement 
% PlantType = A Scalar containing Plant Type Information ; If 1 , then Wind Plant ; If 2 , then Solar Plant

%% Arranging the Columns from the Original File

% Arranging according to Plant Type

if (PlantType==1) % Wind Plant
    
    % Getting the Column Numbers of the Required Variables
    
    WindSpeedCol=RelevantColumnPositions(1,1);

    TempCol=RelevantColumnPositions(1,2);

    WindDirectionCol=RelevantColumnPositions(1,3);

    TurbineStatusCol=RelevantColumnPositions(1,4);

    GenerationCol=RelevantColumnPositions(1,5);    
    
    % Putting Date-Time Column in the Correct Position inside PlantCorrectlyArrangedDataSheet
    
    PlantCorrectlyArrangedDataSheet(:,1)=PlantRawDataSheet_Cell(:,1);    
    
    % Putting Wind-Speed Column in the Correct Position inside PlantCorrectlyArrangedDataSheet

    if (WindSpeedCol>0)

        PlantCorrectlyArrangedDataSheet(:,2)=PlantRawDataSheet_Cell(:,(WindSpeedCol+1));

    end
    % Putting Temperature Column in the Correct Position inside PlantCorrectlyArrangedDataSheet

    if (TempCol>0)

    PlantCorrectlyArrangedDataSheet(:,3)=PlantRawDataSheet_Cell(:,(TempCol+1));

    end

    % Putting Wind-Direction Column in the Correct Position inside PlantCorrectlyArrangedDataSheet

    if (WindDirectionCol>0)

    PlantCorrectlyArrangedDataSheet(:,4)=PlantRawDataSheet_Cell(:,(WindDirectionCol+1));

    end
    
    % Putting Turbine Status Column in the Correct Position inside PlantCorrectlyArrangedDataSheet
    
    if (TurbineStatusCol>0)

    PlantCorrectlyArrangedDataSheet(:,5)=PlantRawDataSheet_Cell(:,(TurbineStatusCol+1));

    end        

    % Putting Generation Column in the Correct Position inside PlantCorrectlyArrangedDataSheet

    if (GenerationCol>0)

    PlantCorrectlyArrangedDataSheet(:,6)=PlantRawDataSheet_Cell(:,(GenerationCol+1));

    end   

    
elseif (PlantType==2) % Solar Plant
    
    % Getting the Column Numbers of the Required Variables
    
    WindSpeedCol=RelevantColumnPositions(1,1);

    TempCol=RelevantColumnPositions(1,2);

    IrradianceCol=RelevantColumnPositions(1,3);

    PlantStatusCol=RelevantColumnPositions(1,4);

    GenerationCol=RelevantColumnPositions(1,5); 
    
    % Putting Date-Time Column in the Correct Position inside PlantCorrectlyArrangedDataSheet
    
    PlantCorrectlyArrangedDataSheet(:,1)=PlantRawDataSheet_Cell(:,1);
    
    % Putting Wind-Speed Column in the Correct Position inside PlantCorrectlyArrangedDataSheet

    if (WindSpeedCol>0)

        PlantCorrectlyArrangedDataSheet(:,2)=PlantRawDataSheet_Cell(:,(WindSpeedCol+1));

    end
    % Putting Temperature Column in the Correct Position inside PlantCorrectlyArrangedDataSheet

    if (TempCol>0)

    PlantCorrectlyArrangedDataSheet(:,3)=PlantRawDataSheet_Cell(:,(TempCol+1));

    end

    % Putting Irradiance Column in the Correct Position inside PlantCorrectlyArrangedDataSheet

    if (IrradianceCol>0)

    PlantCorrectlyArrangedDataSheet(:,4)=PlantRawDataSheet_Cell(:,(IrradianceCol+1));

    end
    
    % Putting Plant Status Column in the Correct Position inside PlantCorrectlyArrangedDataSheet
    
    if (PlantStatusCol>0)

    PlantCorrectlyArrangedDataSheet(:,5)=PlantRawDataSheet_Cell(:,(PlantStatusCol+1));

    end        

    % Putting Generation Column in the Correct Position inside PlantCorrectlyArrangedDataSheet

    if (GenerationCol>0)

    PlantCorrectlyArrangedDataSheet(:,6)=PlantRawDataSheet_Cell(:,(GenerationCol+1));

    end    
    
end

% Arranging Extra Columns

ExtraColumnPositions_Len=length(ExtraColumnPositions); % Getting the length

if (ExtraColumnPositions_Len==0) % No Extra Columns
    
    % Do Nothing
    
elseif (ExtraColumnPositions_Len>0) % Extra Columns are required
    
    % Concatenating Required Extra Columns to PlantCorrectlyArrangedDataSheet
    
    for i=1:ExtraColumnPositions_Len
        
        PlantCorrectlyArrangedDataSheet(:,(6+i))=PlantRawDataSheet_Cell(:,(ExtraColumnPositions(1,i)+1));
        
    end
    
end

end

