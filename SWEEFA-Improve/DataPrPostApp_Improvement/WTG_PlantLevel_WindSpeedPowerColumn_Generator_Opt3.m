function [WindSpeed_PlantLevel_Column_New,Power_PlantLevel_Column_New]=WTG_PlantLevel_WindSpeedPowerColumn_Generator_Opt3(WindSpeed_PlantLevel_Column,Power_PlantLevel_Column,AllParameters,Type,WTG_Type)

%% Function Details:

% WindSpeed_PlantLevel_Column = A Column Vector containing Plant Level Averaged WindSpeed
% Power_PlantLevel_Column = A Column Vector containing Plant Level Added Power
% AllParmeters = A Cell Structure containiing Wind Plant Static Information 
% Type = A Scalar : If 1 , Then Plant_level : If 2 , The Turbine Type Level
% WTG_Type = A Scalar : If 1 , Then T1 ; If 2 , Then T2  ; If 3 , Then T3 ; If 4 , Then T4

%% Creating New WindSpeed and Power Columns 

% Getting the SubNum and PowerCurves from AllParameters

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
    
    % Initializations
    
    PowerCurve_Sub_T1_Total_Matrix=0;
    PowerCurve_Sub_T2_Total_Matrix=0;
    PowerCurve_Sub_T3_Total_Matrix=0;
    PowerCurve_Sub_T4_Total_Matrix=0;
    
    % Initializing Power Curve based WindSpeed and Power
    
    PowerCurve_WindSpeed=0;
    PowerCurve_Power=0;

if (Type==1) % Plant-Level 
  
    % Filling the PowerCurve_WindSpeed and PowerCurve_Power Appropriately
    
    if (T1==1) % WTG Type1 is Present
        
        % Getting the WTG Type 1 required Variables
        
        %sub_T1=Parameters_T1{1,1} ;  % Modification over Opt2
        %subnum_T1=Parameters_T1{1,2} ;
        PowerCurve_T1=Parameters_T1{1,4};
        
        % Creating Sub Level Power Curves
        
        for i=1:length(PowerCurve_T1)  % Modification over Opt2
            
            PowerCurve=PowerCurve_T1{1,i};
            
            PowerCurve(:,end)=PowerCurve(:,end)*(1); % Modification over Opt2
            
            PowerCurve_Sub_T1(1,i)={PowerCurve};
            
        end
        
        % Getting the Maximum WindSpeed from PowerCurve_Sub_T1
        
        Max_Ws_Vector=0; % Initialization
        
        for i=1:length(PowerCurve_T1)  % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T1{1,i};
            
            Max_Ws_Vector(i,1)=max(PowerCurve(:,1));
           
        end
        
        Max_Ws=max(Max_Ws_Vector);
        
        % Creating WindSpeed_Vector
        
        DivisionStep=0.5; % Custom Initialization
        
        WindSpeed_Vector=0:DivisionStep:Max_Ws;
        
        WindSpeed_Vector=WindSpeed_Vector'; % Taking Transpose
        
        WindSpeed_Vector_Len=length( WindSpeed_Vector);        
        
        % Creating PowerCurve_Sub_T1_Corrected
        
        for i=1:length(PowerCurve_T1)  % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T1{1,i};
            
            PowerCurve_New=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
            
            for j=1:WindSpeed_Vector_Len % For each Row in the PowerCurve
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindSpeed_Vector(j,1), 0, Max_Ws );
               
                PowerCurve_New(j,2)=WTGPowerPoint;
                
            end
           
            PowerCurve_Sub_T1_Corrected(1,i)={PowerCurve_New};
            
        end 
        
        % Creating PowerCurve_Sub_T1_Total_Matrix        
        
        PowerCurve_Sub_T1_Total_Matrix=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
        
        for i=1:length(PowerCurve_T1)  % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T1_Corrected{1,i};
            
            PowerCurve_Sub_T1_Total_Matrix(:,2)=PowerCurve_Sub_T1_Total_Matrix(:,2)+PowerCurve(:,2);
            
        end
        
    end
    
    if (T2==1) % WTG Type2 is Present
        
        % Getting the WTG Type 2 required Variables
        
        %sub_T2=Parameters_T2{1,1} ; % Modification over Opt2
        %subnum_T2=Parameters_T2{1,2} ;
        PowerCurve_T2=Parameters_T2{1,4};
        
        % Creating Sub Level Power Curves
        
        for i=1:length(PowerCurve_T2) % Modification over Opt2
            
            PowerCurve=PowerCurve_T2{1,i};
            
            PowerCurve(:,end)=PowerCurve(:,end)*(1); % Modification over Opt2
            
            PowerCurve_Sub_T2(1,i)={PowerCurve};
            
        end  
        
        % Getting the Maximum WindSpeed from PowerCurve_Sub_T2
        
        Max_Ws_Vector=0; % Initialization
        
        for i=1:length(PowerCurve_T2) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T2{1,i};
            
            Max_Ws_Vector(i,1)=max(PowerCurve(:,1));
           
        end
        
        Max_Ws=max(Max_Ws_Vector);
        
        % Creating WindSpeed_Vector
        
        DivisionStep=0.5; % Custom Initialization
        
        WindSpeed_Vector=0:DivisionStep:Max_Ws;
        
        WindSpeed_Vector=WindSpeed_Vector'; % Taking Transpose
        
        WindSpeed_Vector_Len=length( WindSpeed_Vector);        
        
        % Creating PowerCurve_Sub_T2_Corrected
        
        for i=1:length(PowerCurve_T2) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T2{1,i};
            
            PowerCurve_New=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
            
            for j=1:WindSpeed_Vector_Len % For each Row in the PowerCurve
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindSpeed_Vector(j,1), 0, Max_Ws );
               
                PowerCurve_New(j,2)=WTGPowerPoint;
                
            end
           
            PowerCurve_Sub_T2_Corrected(1,i)={PowerCurve_New};
            
        end 
        
        % Creating PowerCurve_Sub_T2_Total_Matrix        
        
        PowerCurve_Sub_T2_Total_Matrix=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
        
        for i=1:length(PowerCurve_T2) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T2_Corrected{1,i};
            
            PowerCurve_Sub_T2_Total_Matrix(:,2)=PowerCurve_Sub_T2_Total_Matrix(:,2)+PowerCurve(:,2);
            
        end        
        
    end
    
    if (T3==1) % WTG Type3 is Present
        
        % Getting the WTG Type 3 required Variables
        
        %sub_T3=Parameters_T3{1,1} ; % Modification over Opt2
        %subnum_T3=Parameters_T3{1,2} ;
        PowerCurve_T3=Parameters_T3{1,4};
        
        % Creating Sub Level Power Curves
        
        for i=1:length(PowerCurve_T3) % Modification over Opt2
            
            PowerCurve=PowerCurve_T3{1,i};
            
            PowerCurve(:,end)=PowerCurve(:,end)*(1); % Modification over Opt2
            
            PowerCurve_Sub_T3(1,i)={PowerCurve};
            
        end  
        
        % Getting the Maximum WindSpeed from PowerCurve_Sub_T3
        
        Max_Ws_Vector=0; % Initialization
        
        for i=1:length(PowerCurve_T3) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T3{1,i};
            
            Max_Ws_Vector(i,1)=max(PowerCurve(:,1));
           
        end
        
        Max_Ws=max(Max_Ws_Vector);
        
        % Creating WindSpeed_Vector
        
        DivisionStep=0.5; % Custom Initialization
        
        WindSpeed_Vector=0:DivisionStep:Max_Ws;
        
        WindSpeed_Vector=WindSpeed_Vector'; % Taking Transpose
        
        WindSpeed_Vector_Len=length( WindSpeed_Vector);        
        
        % Creating PowerCurve_Sub_T3_Corrected
        
        for i=1:length(PowerCurve_T3) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T3{1,i};
            
            PowerCurve_New=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
            
            for j=1:WindSpeed_Vector_Len % For each Row in the PowerCurve
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindSpeed_Vector(j,1), 0, Max_Ws );
               
                PowerCurve_New(j,2)=WTGPowerPoint;
                
            end
           
            PowerCurve_Sub_T3_Corrected(1,i)={PowerCurve_New};
            
        end 
        
        % Creating PowerCurve_Sub_T3_Total_Matrix        
        
        PowerCurve_Sub_T3_Total_Matrix=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
        
        for i=1:length(PowerCurve_T3) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T3_Corrected{1,i};
            
            PowerCurve_Sub_T3_Total_Matrix(:,2)=PowerCurve_Sub_T3_Total_Matrix(:,2)+PowerCurve(:,2);
            
        end        
        
    end
    
    if (T4==1) % WTG Type4 is Present
        
        % Getting the WTG Type 4 required Variables
        
        %sub_T4=Parameters_T4{1,1} ; % Modification over Opt2
        %subnum_T4=Parameters_T4{1,2} ;
        PowerCurve_T4=Parameters_T4{1,4};
        
        % Creating Sub Level Power Curves
        
        for i=1:length(PowerCurve_T4) % Modification over Opt2
            
            PowerCurve=PowerCurve_T4{1,i};
            
            PowerCurve(:,end)=PowerCurve(:,end)*(1); % Modification over Opt2
            
            PowerCurve_Sub_T4(1,i)={PowerCurve};
            
        end  
        
        % Getting the Maximum WindSpeed from PowerCurve_Sub_T4
        
        Max_Ws_Vector=0; % Initialization
        
        for i=1:length(PowerCurve_T4) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T4{1,i};
            
            Max_Ws_Vector(i,1)=max(PowerCurve(:,1));
           
        end
        
        Max_Ws=max(Max_Ws_Vector);
        
        % Creating WindSpeed_Vector
        
        DivisionStep=0.5; % Custom Initialization
        
        WindSpeed_Vector=0:DivisionStep:Max_Ws;
        
        WindSpeed_Vector=WindSpeed_Vector'; % Taking Transpose
        
        WindSpeed_Vector_Len=length( WindSpeed_Vector);        
        
        % Creating PowerCurve_Sub_T4_Corrected
        
        for i=1:length(PowerCurve_T4) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T4{1,i};
            
            PowerCurve_New=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
            
            for j=1:WindSpeed_Vector_Len % For each Row in the PowerCurve
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindSpeed_Vector(j,1), 0, Max_Ws );
               
                PowerCurve_New(j,2)=WTGPowerPoint;
                
            end
           
            PowerCurve_Sub_T4_Corrected(1,i)={PowerCurve_New};
            
        end 
        
        % Creating PowerCurve_Sub_T4_Total_Matrix        
        
        PowerCurve_Sub_T4_Total_Matrix=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
        
        for i=1:length(PowerCurve_T4) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T4_Corrected{1,i};
            
            PowerCurve_Sub_T4_Total_Matrix(:,2)=PowerCurve_Sub_T4_Total_Matrix(:,2)+PowerCurve(:,2);
            
        end        
        
    end 
    
    % Creating PowerCurve_Sub_Total_Cell
    
    PowerCurve_Sub_Total_Cell={PowerCurve_Sub_T1_Total_Matrix,PowerCurve_Sub_T2_Total_Matrix,PowerCurve_Sub_T3_Total_Matrix,PowerCurve_Sub_T4_Total_Matrix};
    
    % Getting the Maximum WindSpeed from PowerCurve_Sub_Total_Cell
        
    Max_Ws_Vector=0; % Initialization

    for i=1:4

        if (WG_TurbineType(1,i)==1)
        
            PowerCurve=PowerCurve_Sub_Total_Cell{1,i};

            Max_Ws_Vector(i,1)=max(PowerCurve(:,1));
        
        end

    end

    Max_Ws=max(Max_Ws_Vector);

    % Creating WindSpeed_Vector

    DivisionStep=0.5; % Custom Initialization

    WindSpeed_Vector=0:DivisionStep:Max_Ws;

    WindSpeed_Vector=WindSpeed_Vector'; % Taking Transpose

    WindSpeed_Vector_Len=length( WindSpeed_Vector);        

    % Creating PowerCurve_Sub_Total_Cell_Corrected

    PowerCurve_Sub_Total_Cell_Corrected=cell(4,1); % Initialization
    
    for i=1:4

        if (WG_TurbineType(1,i)==1)
        
            PowerCurve=PowerCurve_Sub_Total_Cell{1,i};

            PowerCurve_New=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];

            for j=1:WindSpeed_Vector_Len % For each Row in the PowerCurve

                [ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindSpeed_Vector(j,1), 0, Max_Ws );

                PowerCurve_New(j,2)=WTGPowerPoint;

            end

            PowerCurve_Sub_Total_Cell_Corrected(1,i)={PowerCurve_New};

        end
        
    end 

    % Creating PowerCurve_Sub_Total_Matrix        

    PowerCurve_Sub_Total_Matrix=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];

    for i=1:sub_T4

        if (WG_TurbineType(1,i)==1)
        
            PowerCurve=PowerCurve_Sub_Total_Cell_Corrected{1,i};

            PowerCurve_Sub_Total_Matrix(:,2)=PowerCurve_Sub_Total_Matrix(:,2)+PowerCurve(:,2);

        end
        
    end    
           
    % Creating WindSpeed_PlantLevel_Column_New and Power_PlantLevel_Column_New
    
    WindSpeed_PlantLevel_Column_New=vertcat(WindSpeed_PlantLevel_Column,PowerCurve_Sub_Total_Matrix(:,1));
    Power_PlantLevel_Column_New=vertcat(Power_PlantLevel_Column,PowerCurve_Sub_Total_Matrix(:,2));    
    
elseif (Type==2) % Turbine-Type Level
    
    if (WTG_Type==1) % T1 

        % Getting the WTG Type 1 required Variables

        %sub_T1=Parameters_T1{1,1} ; % Modification over Opt2
        %subnum_T1=Parameters_T1{1,2} ;
        PowerCurve_T1=Parameters_T1{1,4};

        % Creating Sub Level Power Curves

        for i=1:length(PowerCurve_T1) % Modification over Opt2

            PowerCurve=PowerCurve_T1{1,i};

            PowerCurve(:,end)=PowerCurve(:,end)*(1); % Modification over Opt2

            PowerCurve_Sub_T1(1,i)={PowerCurve};

        end

        % Getting the Maximum WindSpeed from PowerCurve_Sub_T1

        Max_Ws_Vector=0; % Initialization

        for i=1:length(PowerCurve_T1) % Modification over Opt2

            PowerCurve=PowerCurve_Sub_T1{1,i};

            Max_Ws_Vector(i,1)=max(PowerCurve(:,1));

        end

        Max_Ws=max(Max_Ws_Vector);

        % Creating WindSpeed_Vector

        DivisionStep=0.5; % Custom Initialization

        WindSpeed_Vector=0:DivisionStep:Max_Ws;

        WindSpeed_Vector=WindSpeed_Vector'; % Taking Transpose

        WindSpeed_Vector_Len=length( WindSpeed_Vector);        

        % Creating PowerCurve_Sub_T1_Corrected

        for i=1:length(PowerCurve_T1) % Modification over Opt2

            PowerCurve=PowerCurve_Sub_T1{1,i};

            PowerCurve_New=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];

            for j=1:WindSpeed_Vector_Len % For each Row in the PowerCurve

                [ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindSpeed_Vector(j,1), 0, Max_Ws );

                PowerCurve_New(j,2)=WTGPowerPoint;

            end

            PowerCurve_Sub_T1_Corrected(1,i)={PowerCurve_New};

        end 

        % Creating PowerCurve_Sub_T1_Total_Matrix        

        PowerCurve_Sub_T1_Total_Matrix=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];

        for i=1:length(PowerCurve_T1) % Modification over Opt2

            PowerCurve=PowerCurve_Sub_T1_Corrected{1,i};

            PowerCurve_Sub_T1_Total_Matrix(:,2)=PowerCurve_Sub_T1_Total_Matrix(:,2)+PowerCurve(:,2);

        end

        % Creating WindSpeed_PlantLevel_Column_New and Power_PlantLevel_Column_New

        WindSpeed_PlantLevel_Column_New=vertcat(WindSpeed_PlantLevel_Column,PowerCurve_Sub_T1_Total_Matrix(:,1));
        Power_PlantLevel_Column_New=vertcat(Power_PlantLevel_Column,PowerCurve_Sub_T1_Total_Matrix(:,2));    

        
    elseif (WTG_Type==2) % T2
        
        % Getting the WTG Type 2 required Variables
        
        %sub_T2=Parameters_T2{1,1} ; % Modification over Opt2
        %subnum_T2=Parameters_T2{1,2} ;
        PowerCurve_T2=Parameters_T2{1,4};
        
        % Creating Sub Level Power Curves
        
        for i=1:length(PowerCurve_T2) % Modification over Opt2
            
            PowerCurve=PowerCurve_T2{1,i};
            
            PowerCurve(:,end)=PowerCurve(:,end)*(1); % Modification over Opt2
            
            PowerCurve_Sub_T2(1,i)={PowerCurve};
            
        end  
        
        % Getting the Maximum WindSpeed from PowerCurve_Sub_T2
        
        Max_Ws_Vector=0; % Initialization
        
        for i=1:length(PowerCurve_T2) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T2{1,i};
            
            Max_Ws_Vector(i,1)=max(PowerCurve(:,1));
           
        end
        
        Max_Ws=max(Max_Ws_Vector);
        
        % Creating WindSpeed_Vector
        
        DivisionStep=0.5; % Custom Initialization
        
        WindSpeed_Vector=0:DivisionStep:Max_Ws;
        
        WindSpeed_Vector=WindSpeed_Vector'; % Taking Transpose
        
        WindSpeed_Vector_Len=length( WindSpeed_Vector);        
        
        % Creating PowerCurve_Sub_T2_Corrected
        
        for i=1:length(PowerCurve_T2) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T2{1,i};
            
            PowerCurve_New=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
            
            for j=1:WindSpeed_Vector_Len % For each Row in the PowerCurve
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindSpeed_Vector(j,1), 0, Max_Ws );
               
                PowerCurve_New(j,2)=WTGPowerPoint;
                
            end
           
            PowerCurve_Sub_T2_Corrected(1,i)={PowerCurve_New};
            
        end 
        
        % Creating PowerCurve_Sub_T2_Total_Matrix        
        
        PowerCurve_Sub_T2_Total_Matrix=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
        
        for i=1:length(PowerCurve_T2) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T2_Corrected{1,i};
            
            PowerCurve_Sub_T2_Total_Matrix(:,2)=PowerCurve_Sub_T2_Total_Matrix(:,2)+PowerCurve(:,2);
            
        end  
        
        % Creating WindSpeed_PlantLevel_Column_New and Power_PlantLevel_Column_New

        WindSpeed_PlantLevel_Column_New=vertcat(WindSpeed_PlantLevel_Column,PowerCurve_Sub_T2_Total_Matrix(:,1));
        Power_PlantLevel_Column_New=vertcat(Power_PlantLevel_Column,PowerCurve_Sub_T2_Total_Matrix(:,2));        
        
    elseif (WTG_Type==3) % T3
        
        % Getting the WTG Type 3 required Variables
        
        %sub_T3=Parameters_T3{1,1} ; % Modification over Opt2
        %subnum_T3=Parameters_T3{1,2} ;
        PowerCurve_T3=Parameters_T3{1,4};
        
        % Creating Sub Level Power Curves
        
        for i=1:length(PowerCurve_T3) % Modification over Opt2
            
            PowerCurve=PowerCurve_T3{1,i};
            
            PowerCurve(:,end)=PowerCurve(:,end)*(1); % Modification over Opt2
            
            PowerCurve_Sub_T3(1,i)={PowerCurve};
            
        end  
        
        % Getting the Maximum WindSpeed from PowerCurve_Sub_T3
        
        Max_Ws_Vector=0; % Initialization
        
        for i=1:length(PowerCurve_T3) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T3{1,i};
            
            Max_Ws_Vector(i,1)=max(PowerCurve(:,1));
           
        end
        
        Max_Ws=max(Max_Ws_Vector);
        
        % Creating WindSpeed_Vector
        
        DivisionStep=0.5; % Custom Initialization
        
        WindSpeed_Vector=0:DivisionStep:Max_Ws;
        
        WindSpeed_Vector=WindSpeed_Vector'; % Taking Transpose
        
        WindSpeed_Vector_Len=length( WindSpeed_Vector);        
        
        % Creating PowerCurve_Sub_T3_Corrected
        
        for i=1:length(PowerCurve_T3) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T3{1,i};
            
            PowerCurve_New=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
            
            for j=1:WindSpeed_Vector_Len % For each Row in the PowerCurve
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindSpeed_Vector(j,1), 0, Max_Ws );
               
                PowerCurve_New(j,2)=WTGPowerPoint;
                
            end
           
            PowerCurve_Sub_T3_Corrected(1,i)={PowerCurve_New};
            
        end 
        
        % Creating PowerCurve_Sub_T3_Total_Matrix        
        
        PowerCurve_Sub_T3_Total_Matrix=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
        
        for i=1:length(PowerCurve_T3) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T3_Corrected{1,i};
            
            PowerCurve_Sub_T3_Total_Matrix(:,2)=PowerCurve_Sub_T3_Total_Matrix(:,2)+PowerCurve(:,2);
            
        end 
        
        % Creating WindSpeed_PlantLevel_Column_New and Power_PlantLevel_Column_New

        WindSpeed_PlantLevel_Column_New=vertcat(WindSpeed_PlantLevel_Column,PowerCurve_Sub_T3_Total_Matrix(:,1));
        Power_PlantLevel_Column_New=vertcat(Power_PlantLevel_Column,PowerCurve_Sub_T3_Total_Matrix(:,2));        
        
    elseif (WTG_Type==4) % T4
        
        % Getting the WTG Type 4 required Variables
        
        %sub_T4=Parameters_T4{1,1} ; % Modification over Opt2
        %subnum_T4=Parameters_T4{1,2} ;
        PowerCurve_T4=Parameters_T4{1,4};
        
        % Creating Sub Level Power Curves
        
        for i=1:length(PowerCurve_T4) % Modification over Opt2
            
            PowerCurve=PowerCurve_T4{1,i};
            
            PowerCurve(:,end)=PowerCurve(:,end)*(1); % Modification over Opt2
            
            PowerCurve_Sub_T4(1,i)={PowerCurve};
            
        end  
        
        % Getting the Maximum WindSpeed from PowerCurve_Sub_T4
        
        Max_Ws_Vector=0; % Initialization
        
        for i=1:length(PowerCurve_T4) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T4{1,i};
            
            Max_Ws_Vector(i,1)=max(PowerCurve(:,1));
           
        end
        
        Max_Ws=max(Max_Ws_Vector);
        
        % Creating WindSpeed_Vector
        
        DivisionStep=0.5; % Custom Initialization
        
        WindSpeed_Vector=0:DivisionStep:Max_Ws;
        
        WindSpeed_Vector=WindSpeed_Vector'; % Taking Transpose
        
        WindSpeed_Vector_Len=length( WindSpeed_Vector);        
        
        % Creating PowerCurve_Sub_T4_Corrected
        
        for i=1:length(PowerCurve_T4) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T4{1,i};
            
            PowerCurve_New=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
            
            for j=1:WindSpeed_Vector_Len % For each Row in the PowerCurve
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindSpeed_Vector(j,1), 0, Max_Ws );
               
                PowerCurve_New(j,2)=WTGPowerPoint;
                
            end
           
            PowerCurve_Sub_T4_Corrected(1,i)={PowerCurve_New};
            
        end 
        
        % Creating PowerCurve_Sub_T4_Total_Matrix        
        
        PowerCurve_Sub_T4_Total_Matrix=[WindSpeed_Vector,zeros(WindSpeed_Vector_Len,1)];
        
        for i=1:length(PowerCurve_T4) % Modification over Opt2
            
            PowerCurve=PowerCurve_Sub_T4_Corrected{1,i};
            
            PowerCurve_Sub_T4_Total_Matrix(:,2)=PowerCurve_Sub_T4_Total_Matrix(:,2)+PowerCurve(:,2);
            
        end          
        
        % Creating WindSpeed_PlantLevel_Column_New and Power_PlantLevel_Column_New

        WindSpeed_PlantLevel_Column_New=vertcat(WindSpeed_PlantLevel_Column,PowerCurve_Sub_T4_Total_Matrix(:,1));
        Power_PlantLevel_Column_New=vertcat(Power_PlantLevel_Column,PowerCurve_Sub_T4_Total_Matrix(:,2));    
    
    end


end



