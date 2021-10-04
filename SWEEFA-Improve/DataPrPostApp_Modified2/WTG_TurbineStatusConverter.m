function [ TurbineStatus_Vector_Converted ] = WTG_TurbineStatusConverter( TurbineStatus_Vector,TurbineStatusVal,TurbineStatusVal_ErrorPercentBand )


%% Computing Upper and Lower bounds for Power Producing Turbine Status Values

% Getting the Length of TurbineStatusValue Vector

Len1 = length(TurbineStatusVal);

% Creating a Matrix to hold Upper and Lower Bounds for Power Producing Turbine Status Values

UpperLowerBounds = zeros(Len1,2);

% Computing Upper and Lower Bounds using the TurbineStatusVal_ErrorPercentBand

for i = 1:Len1
    
    % Computing the Upper Bound
    
    UpperLowerBounds(i,1) = TurbineStatusVal(1,i)*(1+(TurbineStatusVal_ErrorPercentBand(1,i)/100));
    
    % Computing the Lowerer Bound
    
    UpperLowerBounds(i,2) = TurbineStatusVal(1,i)*(1-(TurbineStatusVal_ErrorPercentBand(1,i)/100));    
    
end

%% Computing the Converted Turbine Status Vector

% Geting the length of the TurbineStatus_Vector

Len2 = length(TurbineStatus_Vector);

% Creating Container for the TurbineStatus_Vector_Converted

TurbineStatus_Vector_Converted = zeros(Len2,1);

for i = 1:Len2 % For loop for each Turbine Status Value in the Original Turbine Status Vector
    
    for j = 1:Len1 % For loop for each Turbine Status Value
        
        if ((TurbineStatus_Vector(i,1)<=UpperLowerBounds(j,1)) && (TurbineStatus_Vector(i,1)>=UpperLowerBounds(j,2))) % Turbine Status is Power Producing Status
            
            TurbineStatus_Vector_Converted(i,1)=1;
            
            continue;
            
        else % Turbine Status is other than Power Producing Status
            
            TurbineStatus_Vector_Converted(i,1)=0;
            
        end
        
    end
    
end

end

