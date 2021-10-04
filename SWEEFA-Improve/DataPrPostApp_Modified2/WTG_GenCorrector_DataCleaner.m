function [ DTGeneration_Cleaned_GenCorrected_Cell ] = WTG_GenCorrector_DataCleaner(DTGeneration_Cleaned_Cell,DTWeather_Cleaned_TstatCorrected_Cell,TurbineStatusBased_GenerationCorrection )

%% Function Details:

% DTGeneration_Cleaned_Cell = A Cell Structure containing Generation Column with Date-Time Columns and Headers [D M Y G]
% DTWeather_Cleaned_TstatCorrected_Cell = A Cell Structure containing Weather Columns with Date-Time Columns and Headers [D M Y Ws T Wd Ts]
% TurbineStatusBased_GenerationCorrection = A Scalar : If 1 , then Correct Generation Column ; If 0 , then do not Correct Generation Column

%% Correcting Generation Column

% Correcting Generation Column according to TurbineStatusBased_GenerationCorrection

if (TurbineStatusBased_GenerationCorrection==1) % Correct Generation Column
    
    % Getting Length of Generation Column
    
    [Row, Col]=size(DTGeneration_Cleaned_Cell);    
       
    % Correcting Generation Column
    
    for i=2:Row % For Each Generation Value other than Header
        
        if (DTWeather_Cleaned_TstatCorrected_Cell{i,end}==0)
            
            DTGeneration_Cleaned_Cell(i,end)={0};
            
        end
        
    end
    
    DTGeneration_Cleaned_GenCorrected_Cell=DTGeneration_Cleaned_Cell;
    
elseif (TurbineStatusBased_GenerationCorrection==0) % Do not Correct Generation Column
    
    % Do Nothing
    
    DTGeneration_Cleaned_GenCorrected_Cell=DTGeneration_Cleaned_Cell;
    
end

end

