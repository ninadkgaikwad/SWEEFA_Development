function [ DTWeather_Cleaned_TstatCorrected_Cell ] = WTG_TstatCorrector_DataCleaner( DTWeather_Cell,WTGGenCleanAlgorithm,TurbineStatusVal,TurbineStatusVal_ErrorPercentBand,TurbineStatusCol_Conversion )

%% Function Details:

% DTWeather_Cell = A Cell Structure containing Weather Columns with Date-Time Columns and Headers [D M Y Ws T Wd Ts]
% WTGGenCleanAlgorithm = A Scalar containing the Type Method used for Cleaning Generation : 1 - N-Point Average Method ; 2 - Standard Power Curves ; 3 - Average Power Curve per Turbine ; 3 - Average Plant Power Curve
% TurbineStatusVal = A Vector containing Turbine Status values for which Turbine produces Power
% TurbineStatusVal_ErrorPercentBand = A Scalar containing the Percentage value, to form a lower and upper bound on the TurbineStatusVal
% TurbineStatusCol_Conversion = A Scalar : If 1 , then Correct Turbine Status Column ; If 0 , then do not Correct Turbine Status Column

%% Correcting the Turbine Status

% Correcting the Turbine Status according to TurbineStatusCol_Conversion

if (TurbineStatusCol_Conversion==1) % Correct Turbine Status Column
    
      % Correcting Turbine Status according to WTGGenCleanAlgorithm
      
      if ((WTGGenCleanAlgorithm==1)||(WTGGenCleanAlgorithm==2)||(WTGGenCleanAlgorithm==3)) % Use External Function
          
          % Getting the TurbineStatus_Vector from DTWeather_Cell
          
          TurbineStatus_Vector=cell2mat(DTWeather_Cell(2:end,end));
          
          % Turbine Status Correction using External Function
          
          [ TurbineStatus_Vector_Converted ] = WTG_TurbineStatusConverter( TurbineStatus_Vector,TurbineStatusVal,TurbineStatusVal_ErrorPercentBand );
          
          % Putting TurbineStatus_Vector_Converted  in DTWeather_Cleaned_TstatCorrected_Cell
          
          DTWeather_Cleaned_TstatCorrected_Cell=DTWeather_Cell;
          
          DTWeather_Cleaned_TstatCorrected_Cell(2:end,end)=mat2cell(TurbineStatus_Vector_Converted);
          
      elseif (WTGGenCleanAlgorithm==4) % Use round()
          
          % Putting DTWeather_Cell  in DTWeather_Cleaned_TstatCorrected_Cell
          
          DTWeather_Cleaned_TstatCorrected_Cell=DTWeather_Cell;   
          
          % Getting Length of DTWeather_Cleaned_TstatCorrected_Cell
          
          [Row, Col]=size(DTWeather_Cleaned_TstatCorrected_Cell);
          
          % Correcting Turbine Status Value
          
          for i=2:Row % For Each Turbine Status Value except the Header
              
              DTWeather_Cleaned_TstatCorrected_Cell(i,end)={round(DTWeather_Cleaned_TstatCorrected_Cell{i,end})};
              
          end
          
      end
    
elseif (TurbineStatusCol_Conversion==0) % Do not Correct Turbine Status Column
    
    % Do Nothing
    
    DTWeather_Cleaned_TstatCorrected_Cell=DTWeather_Cell;
        
end

[ TurbineStatus_Vector_Converted ] = WTG_TurbineStatusConverter( TurbineStatus_Vector,TurbineStatusVal,TurbineStatusVal_ErrorPercentBand );

end

