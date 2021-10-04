function [PlantLevel_PowerCurve_Cell]=WTG_PlantLevel_PowerCurve_Generator(WindSpeed_PlantLevel_Column,Power_PlantLevel_Column)

%% Function Details:

% WindSpeed_PlantLevel_Column = A Column Vector containing WindSpeed Values
% Power_PlantLevel_Column = A Column Vector containing Power Values

%% Creating Plant-Level Wind Turbine Power Curve

% Finding Max and Min WindSpeeds

Ws_Max=max(WindSpeed_PlantLevel_Column);

Ws_Min=min(WindSpeed_PlantLevel_Column);

% Creating Ordered WindSpeed Vector

Ws_FirstDiv=0.5; % First Division Step for WindSpeed

WindSpeed_Ordered_Vector=0:Ws_FirstDiv:Ws_Max;

WindSpeed_Ordered_Vector=WindSpeed_Ordered_Vector'; % Creating a Transpose

% Getting Length of WindSpeed_Ordered_Vector

WindSpeed_Ordered_Vector_Len=length(WindSpeed_Ordered_Vector);

% Creating Wind Power Curve

WTG_PowerCurve=[0,0]; % Initialization

for i=1:(WindSpeed_Ordered_Vector_Len-1) % For Each Division in the WindSpeed_Ordered_Vector

    % Getting the First and Second WindSpeed Values in the Current Division
    
    Ws_FirstVal=WindSpeed_Ordered_Vector(i,1);
    
    Ws_SecondVal=WindSpeed_Ordered_Vector((i+1),1);
    
    % Getting the Appropriate Index for Slicing WindSpeed and Power Columns
    
    Ws_Index1=find(WindSpeed_PlantLevel_Column>=Ws_FirstVal);
    
    Ws_Index2=find(WindSpeed_PlantLevel_Column<=Ws_FirstVal);
    
    Ws_Index=intersect(Ws_Index1,Ws_Index2);
    
    % Getting Values from WindSpeed and Power Columns Between First and Second WindSpeed Values
    
    Ws_Vector=WindSpeed_PlantLevel_Column(Ws_Index);
    
    Power_Vector=Power_PlantLevel_Column(Ws_Index);
    
    % Computing the WindSpeed and Power Values for the Current Division
    
    Ws_Mean=mean(Ws_Vector);
    
    Power_Mean1=(sum(Power_Vector))/(length(Ws_Vector)); % Algorithm 1 => Average
    
    Power_Mean2=(sum(Power_Vector.*(Ws_Vector.^3)))/(sum(Ws_Vector.^3)); % Algorithm 2 => Weighted Average (Cubic)
    
    Power_Mean3=(sum(Power_Vector.*Ws_Vector))/(sum(Ws_Vector)); % Algorithm 3 => Weighted Average (Linear)
    
    % Filling the WTG_PowerCurve
    
    WTG_PowerCurve(i,1)=(Power_Mean1+Power_Mean2+Power_Mean3)/3; % Algorithm 4 => Average of the Previous 3 Algorithms
    
    WTG_PowerCurve(i,2)=Ws_Mean;
    
end

% Getting Size of WTG_PowerCurve

[R,C]=size(WTG_PowerCurve);

% Converting the WTG_PowerCurve to PlantLevel_PowerCurve_Cell

Headers={'WindSpeed','Power'};

WTG_PowerCurve_Cell=mat2cell(WTG_PowerCurve,[R],[C]);

PlantLevel_PowerCurve_Cell=vertcat(Headers,WTG_PowerCurve_Cell);

end

