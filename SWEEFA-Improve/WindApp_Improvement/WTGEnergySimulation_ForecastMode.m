function [EnergySimulation_Status] = WTGEnergySimulation_ForecastMode( SimParameters,AllParameters,WindLossParameters,LatLongAlt_Pant_Handles )

%% Function Details

% SimParameters = Cell containing Plant Information from Wind App Main GUI
% AllParameters = Cell containing Plant Information from the Wind Data Acquisition App
% WindLossParameters = Cell containing Plant Information from the Wind Loss Parameters App

%% Disintegrating Cell Parameters

% Disintegrating AllParameters

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
    
    WG_TurbineType_Total=T1+T2+T3+T4;

    % Disintegrating Parameters_T1

    sub_T1=Parameters_T1{1,1} ;
    subnum_T1=Parameters_T1{1,2} ;
    hub_T1=Parameters_T1{1,3} ;
    Power_T1=Parameters_T1{1,4} ;
    cutin_T1=Parameters_T1{1,5} ;
    rated_T1=Parameters_T1{1,6} ;
    cutout_T1=Parameters_T1{1,7} ;
    rotrad_T1=Parameters_T1{1,8} ;
    LatLongAlt_T1=Parameters_T1{1,9} ;

    % Disintegrating Parameters_T2

    sub_T2=Parameters_T2{1,1} ;
    subnum_T2=Parameters_T2{1,2} ;
    hub_T2=Parameters_T2{1,3} ;
    Power_T2=Parameters_T2{1,4} ;
    cutin_T2=Parameters_T2{1,5} ;
    rated_T2=Parameters_T2{1,6} ;
    cutout_T2=Parameters_T2{1,7} ;
    rotrad_T2=Parameters_T2{1,8} ;
    LatLongAlt_T2=Parameters_T2{1,9} ;

    % Disintegrating Parameters_T3

    sub_T3=Parameters_T3{1,1} ;
    subnum_T3=Parameters_T3{1,2} ;
    hub_T3=Parameters_T3{1,3} ;
    Power_T3=Parameters_T3{1,4} ;
    cutin_T3=Parameters_T3{1,5} ;
    rated_T3=Parameters_T3{1,6} ;
    cutout_T3=Parameters_T3{1,7} ;
    rotrad_T3=Parameters_T3{1,8} ;
    LatLongAlt_T3=Parameters_T3{1,9} ;

    % Disintegrating Parameters_T4

    sub_T4=Parameters_T4{1,1} ;
    subnum_T4=Parameters_T4{1,2} ;
    hub_T4=Parameters_T4{1,3} ;
    Power_T4=Parameters_T4{1,4} ;
    cutin_T4=Parameters_T4{1,5} ;
    rated_T4=Parameters_T4{1,6} ;
    cutout_T4=Parameters_T4{1,7} ;
    rotrad_T4=Parameters_T4{1,8} ;
    LatLongAlt_T4=Parameters_T4{1,9} ;

% Disintegrating SimParameters

PrjName=SimParameters{1,1} ;
PlantCapacity=SimParameters{1,2} ;
Res=SimParameters{1,3} ;
ComputationOptionsMenu=SimParameters{1,4} ;
WeatherFile=SimParameters{1,5} ;

% Disntegrating WindLossParameters

    % Disintegrating Cell SimParameters

    Wake1=WindLossParameters{1,1} ;
    Wake2=WindLossParameters{1,2} ;
    DenSTC=WindLossParameters{1,3} ;
    OhmicLoss=WindLossParameters{1,4} ;
    TransLoss=WindLossParameters{1,5} ;
    WakeLoss=WindLossParameters{1,6} ;
    WakeModelParameters=WindLossParameters{1,7} ;
    Perf_Rat=WindLossParameters{1,8} ;
    Turbine_File=WindLossParameters{1,9} ;
    PR=WindLossParameters{1,10} ;
    ActiveTurbines=WindLossParameters{1,11} ;
    Terrain=WindLossParameters{1,12} ;
    HeightAnemometer=WindLossParameters{1,13} ;

    % Disintegrating Cell WakeModelParameters

    Jensen=WakeModelParameters{1,1} ; 
    Frandsen=WakeModelParameters{1,2} ; 
    a_J=WakeModelParameters{1,3} ; 
    k_J=WakeModelParameters{1,4} ; 
    x_J=WakeModelParameters{1,5} ; 
    a_F=WakeModelParameters{1,6} ; 
    k_F=WakeModelParameters{1,7} ; 
    x_F=WakeModelParameters{1,8} ; 
    alpha=WakeModelParameters{1,9} ; 

    % Disintegrating Cell ActiveTurbines

    ActiveTurbines_T1=ActiveTurbines{1,1};
    ActiveTurbines_T2=ActiveTurbines{1,2};
    ActiveTurbines_T3=ActiveTurbines{1,3};
    ActiveTurbines_T4=ActiveTurbines{1,4};
    
% Disintegrating LatLongAlt_Pant_Handles

Lat_Plant=LatLongAlt_Pant_Handles{1,1};
Long_Plant=LatLongAlt_Pant_Handles{1,2};
Altitude_Plant=LatLongAlt_Pant_Handles{1,3};

%% Pre-Processing the Input Data

% Pre-Processing the WeatherFile based on Computation Option

if ((ComputationOptionsMenu==2) || (ComputationOptionsMenu==3)) % Weather File contains sheets per Turbine
    
    % Getting the Length of WeatherFile Cell

    Len_WeatherFile=length(WeatherFile); 
    
    % Getting Weather File out of Cell 
    
    for i=1:Len_WeatherFile
        
        WeatherFile_Matrix(:,:,i)=WeatherFile{1,i};
        
    end
    
    % Computing the Size of the WeatherFile_Matrix

    [Row, Col, Z]=size(WeatherFile_Matrix);

    % Dividing the Weather File into Date-Time Stamp and Other Variables

    DateTime_Stamp_WeatherFile=WeatherFile_Matrix(:,1:4,1);

    OtherVariables=WeatherFile_Matrix(:,5:end,:);
    
    [~,OtherVariables_Col,~]=size(OtherVariables); % Getting Col Number of Weather Variables
    
    % Dividing the OtherVariables into its Constituent Components

    Ws=OtherVariables(:,1,:);

    T=OtherVariables(:,2,:);

    Wd=OtherVariables(:,3,:);

    TurbineStatus=OtherVariables(:,4,:);     
    
elseif (ComputationOptionsMenu==4) % Weather File contains only one Sheet
    
    % Getting the Length of WeatherFile Cell

    Len_WeatherFile=length(WeatherFile); 
    
    % Getting Weather File out of Cell 
    
    for i=1:Len_WeatherFile
        
        WeatherFile_Matrix(:,:,i)=WeatherFile{1,i};
        
    end
    
    % Computing the Size of the WeatherFile_Matrix

    [Row, Col, Z]=size(WeatherFile_Matrix);

    % Dividing the Weather File into Date-Time Stamp and Other Variables

    DateTime_Stamp_WeatherFile=WeatherFile_Matrix(:,1:4,1);

    OtherVariables=WeatherFile_Matrix(:,5:end,:); 
    
    % Dividing the OtherVariables into its Constituent Components

    Ws=OtherVariables(:,1,:);

    T=OtherVariables(:,2,:);

    Wd=OtherVariables(:,3,:);

    PlantStatus=OtherVariables(:,4,:);    
    
end


%% Computing the Energy Data Holder and Energy Converter (Using DateTime_Stamp_WeatherFile)

% Creating EnergyMATRIX - For holding the Estimated Energy

EnergyMATRIX=zeros(Row,8,Len_WeatherFile); % Column Description: 4 = Date-Time Stamp and 4 = Computed Energy Variables

% Filling the EnergyMATRIX with DateTime_Stamp_WeatherFile
for i=1:Len_WeatherFile
    
    EnergyMATRIX(:,1:4,i)= DateTime_Stamp_WeatherFile;
    
end

% Initializing Plant Level Energy Matrices with appropriate Dimensions and Date-Time Stamp

EnergyMATRIX_T1_PlantLevel=zeros(Row,8);
EnergyMATRIX_T1_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile;

EnergyMATRIX_T2_PlantLevel=zeros(Row,8);
EnergyMATRIX_T2_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile;

EnergyMATRIX_T3_PlantLevel=zeros(Row,8);
EnergyMATRIX_T3_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile;

EnergyMATRIX_T4_PlantLevel=zeros(Row,8);
EnergyMATRIX_T4_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile;

% Initializing Plant Level Energy Matrices with appropriate Dimensions and Date-Time Stamp

EnergyMATRIX_Weather_T1_PlantLevel=zeros(Row,(5+OtherVariables_Col));
EnergyMATRIX_Weather_T1_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile;

EnergyMATRIX_Weather_T2_PlantLevel=zeros(Row,(5+OtherVariables_Col));
EnergyMATRIX_Weather_T2_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile;

EnergyMATRIX_Weather_T3_PlantLevel=zeros(Row,(5+OtherVariables_Col));
EnergyMATRIX_Weather_T3_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile;

EnergyMATRIX_Weather_T4_PlantLevel=zeros(Row,(5+OtherVariables_Col));
EnergyMATRIX__WeatherT4_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile;


% Computing the Energy Converter

EnergyConverter=(Res/60);

%% Wind Plant Energy Estimation 

% Computation based on Computation Options

if (ComputationOptionsMenu==2) % Using Standard Power Curves
    
    % Computing Average Lat-Long-Alt for each WTG Type and entire Plant using External Function
    
    [Avg_LatLongAlt_T1,Avg_LatLongAlt_T2,Avg_LatLongAlt_T3,Avg_LatLongAlt_T4,Avg_LatLongAlt_Plant]=WTG_Average_LatLongAlt_Generator(LatLongAlt_T1,LatLongAlt_T2,LatLongAlt_T3,LatLongAlt_T4,WG_TurbineType);
    
    % Disintegrating Avg_LatLongAlt_Plant
    Lat_Plant=Avg_LatLongAlt_Plant(1,1);
    Lat_Plant_Str=num2str(Lat_Plant);
    
    Long_Plant=Avg_LatLongAlt_Plant(1,2);
    Long_Plant_Str=num2str(Long_Plant);
    
    Alt_Plant=Avg_LatLongAlt_Plant(1,3);
    Alt_Plant_Str=num2str(Alt_Plant);
    
    % Updating the Lat-Long-Alt Edit Boxes in Wind_GUI_MainPage
    
    set(Lat_Plant,'String',Lat_Plant_Str);
    set(Long_Plant,'String',Long_Plant_Str);
    set(Altitude_Plant,'String',Alt_Plant_Str);    

    % Computing Total Number of Turbines of each WTG Type
    subnum_Total_T1=sum(subnum_T1);
    subnum_Total_T2=sum(subnum_T2);
    subnum_Total_T3=sum(subnum_T3);
    subnum_Total_T4=sum(subnum_T4);    
    
    % Initializing EnergyMATRIX_T
    EnergyMATRIX_T1=zeros(Row,8,subnum_Total_T1);
    EnergyMATRIX_T2=zeros(Row,8,subnum_Total_T2);
    EnergyMATRIX_T3=zeros(Row,8,subnum_Total_T3);
    EnergyMATRIX_T4=zeros(Row,8,subnum_Total_T4);
    
    % Filling EnergyMATRIX_T with Date-Time Stamp
    for i=1:subnum_Total_T1
        
        EnergyMATRIX_T1(:,1:4,i)=DateTime_Stamp_WeatherFile;
        
    end
    for i=1:subnum_Total_T2
        
        EnergyMATRIX_T2(:,1:4,i)=DateTime_Stamp_WeatherFile;
        
    end
    for i=1:subnum_Total_T3
        
        EnergyMATRIX_T3(:,1:4,i)=DateTime_Stamp_WeatherFile;
        
    end
    for i=1:subnum_Total_T4
        
        EnergyMATRIX_T4(:,1:4,i)=DateTime_Stamp_WeatherFile;
        
    end      
    
    % Computing Correct Indices for Computation using External Function
    
    sub_T=[sub_T1,sub_T2,sub_T3,sub_T4];
    subnum_T={subnum_T1,subnum_T2,subnum_T3,subnum_T4};
    
    [WeatherFile_Indices_Cell,SubType_Indices_Corrected_Cell]=WTG_CorrectIndex_CompOpt34_Generator(WG_TurbineType,sub_T,subnum_T);       
  
    % Disintegrating WeatherFile_Indices_Cell
    WeatherFile_Indices_T1=WeatherFile_Indices_Cell{1,1};
    WeatherFile_Indices_T2=WeatherFile_Indices_Cell{1,2};
    WeatherFile_Indices_T3=WeatherFile_Indices_Cell{1,3};
    WeatherFile_Indices_T4=WeatherFile_Indices_Cell{1,4};
    
    % Disintegrating SubType_Indices_Corrected_Cell
    SubType_Indices_Corrected_T1=SubType_Indices_Corrected_Cell{1,1};
    SubType_Indices_Corrected_T2=SubType_Indices_Corrected_Cell{1,2};
    SubType_Indices_Corrected_T3=SubType_Indices_Corrected_Cell{1,3};
    SubType_Indices_Corrected_T4=SubType_Indices_Corrected_Cell{1,4};    
    
    % Computation based on WTG Type
    
    if (T1==1) % WTG Type 1 is Selected
       
        for i=1:subnum_Total_T1 % For Each Weather File
                             
           % Getting the Correct Weather File Index 
           
           WeatherFile_Index=WeatherFile_Indices_T1(1,i);
           
           % Getting the Correct Sub-Type Index Using External Function 
           
           SubType_Index=WTG_SubType_Index_Generator(SubType_Indices_Corrected_T1,WeatherFile_Index); 
                      
           [ Pressure ] = PressureAtHeight( LatLongAlt_T1(i,3) );

           for j=1:Row % For each Date-Time Stamp

                % Correct WindSpeed and Temperature Values

                WindSpeedMeasured=Ws(j,1,WeatherFile_Index);

                TemperatureMeasured=T(j,1,WeatherFile_Index);    

                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function 
                
                if (~isempty(HeightAnemometer))
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T1(1,SubType_Index),Terrain );
                    
                else
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,hub_T1(1,SubType_Index),hub_T1(1,SubType_Index),Terrain );
                    
                end                

                % Computing Wake Effect on Wind Speed

                if (Wake2==1)

                    if (Jensen==1)

                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T1(1,SubType_Index),x_J,k_J, WindCorrected1 );

                    elseif (Frandsen==1)

                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T1(1,SubType_Index),x_F,k_F,alpha, WindCorrected1 );

                    end

                else

                    WindCorrected2=WindCorrected1;

                end

                % Computing Power Curve Point for the current instance

                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T1{1,SubType_Index}, WindCorrected2, cutin_T1(1,SubType_Index), cutout_T1(1,SubType_Index) ) ;   

                % Computing Corrected Power Curve Point due to effect of Air Density

                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density

                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt23_ForecastMode( WTGPowerPointCorrected, subnum_Total_T1, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,WeatherFile_Index)  );

                % Computing Wind Turbine Power Losses and Power Supplied to the Grid

                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

                % Filling the EnergyMATRIX

                EnergyMATRIX_T1( j ,5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T1( j, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T1( j, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T1( j, 8, i)=WTGTransLossP*EnergyConverter ;

           end   
       
        end
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_T
        
        for i=1:subnum_Total_T1           
                       
            EnergyMATRIX_T1(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp            
            
        end 
        
        % Converting EnergyMATRIX_T to EnergyMATRIX_T_PlantLevel
        
        EnergyMATRIX_T1_PlantLevel=zeros(Row,8); % Initialization
        
        EnergyMATRIX_T1_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:8
               
               EnergyMATRIX_T1_PlantLevel(1,j)=sum(EnergyMATRIX_T1(i,j,:));
               
           end
            
        end
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_Weather_T
        
        EnergyMATRIX_Weather_T1=zeros(Row,(5+OtherVariables_Col),subnum_Total_T1); % Initialization
        
        for i=1:subnum_Total_T1
            
            % Getting the Correct Weather File Index 
           
            WeatherFile_Index=WeatherFile_Indices_T1(1,i);            
            
            EnergyMATRIX_Weather_T1(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
            
            EnergyMATRIX_Weather_T1(:,5:(5+(OtherVariables_Col-1)),i)=OtherVariables(:,:,WeatherFile_Index); % Placing Weather Variables
            
            EnergyMATRIX_Weather_T1(:,(5+OtherVariables_Col),i)=EnergyMATRIX_T1(:,5,i); % Placing WTGOut Energy
            
        end
        
        % Converting EnergyMATRIX_Weather_T to EnergyMATRIX_Weather_T_PlantLevel
        
        EnergyMATRIX_Weather_T1_PlantLevel=zeros(Row,(5+OtherVariables_Col)); % Initialization
        
        EnergyMATRIX_Weather_T1_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:(5+OtherVariables_Col)
               
               if ((j~=(5+OtherVariables_Col))||(j~=((5+OtherVariables_Col)-1)))
                   
                EnergyMATRIX_Weather_T1_PlantLevel(1,j)=sum(EnergyMATRIX_Weather_T1(i,j,:)); % Adding Energies and Turbine Status
                
               end
               
               EnergyMATRIX_Weather_T1_PlantLevel(1,j)=mean(EnergyMATRIX_Weather_T1(i,j,:)); % Averaging Weather Variables
               
           end
            
        end        
        
    end               
        
    if (T2==1) % WTG Type 2 is Selected
        
        for i=1:subnum_Total_T2 % For Each Weather File
                             
           % Getting the Correct Weather File Index 
           
           WeatherFile_Index=WeatherFile_Indices_T2(1,i);
           
           % Getting the Correct Sub-Type Index Using External Function 
           
           SubType_Index=WTG_SubType_Index_Generator(SubType_Indices_Corrected_T2,WeatherFile_Index); 
                      
           [ Pressure ] = PressureAtHeight( LatLongAlt_T2(i,3) );

           for j=1:Row % For each Date-Time Stamp

                % Correct WindSpeed and Temperature Values

                WindSpeedMeasured=Ws(j,1,WeatherFile_Index);

                TemperatureMeasured=T(j,1,WeatherFile_Index);    

                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                

                if (~isempty(HeightAnemometer))
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T2(1,SubType_Index),Terrain );
                    
                else
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,hub_T2(1,SubType_Index),hub_T2(1,SubType_Index),Terrain );
                    
                end 

                % Computing Wake Effect on Wind Speed

                if (Wake2==1)

                    if (Jensen==1)

                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T2(1,SubType_Index),x_J,k_J, WindCorrected1 );

                    elseif (Frandsen==1)

                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T2(1,SubType_Index),x_F,k_F,alpha, WindCorrected1 );

                    end

                else

                    WindCorrected2=WindCorrected1;

                end

                % Computing Power Curve Point for the current instance

                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T2{1,SubType_Index}, WindCorrected2, cutin_T2(1,SubType_Index), cutout_T2(1,SubType_Index) ) ;   

                % Computing Corrected Power Curve Point due to effect of Air Density

                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density

                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt23_ForecastMode( WTGPowerPointCorrected, subnum_Total_T2, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,WeatherFile_Index)  );

                % Computing Wind Turbine Power Losses and Power Supplied to the Grid

                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

                % Filling the EnergyMATRIX

                EnergyMATRIX_T2( j ,5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T2( j, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T2( j, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T2( j, 8, i)=WTGTransLossP*EnergyConverter ;

           end   
       
        end
     
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_T
        
        for i=1:subnum_Total_T2           
                       
            EnergyMATRIX_T2(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp            
            
        end 
        
        % Converting EnergyMATRIX_T to EnergyMATRIX_T_PlantLevel
        
        EnergyMATRIX_T2_PlantLevel=zeros(Row,8); % Initialization
        
        EnergyMATRIX_T2_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:8
               
               EnergyMATRIX_T2_PlantLevel(1,j)=sum(EnergyMATRIX_T2(i,j,:));
               
           end
            
        end
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_Weather_T
        
        EnergyMATRIX_Weather_T2=zeros(Row,(5+OtherVariables_Col),subnum_Total_T2); % Initialization
        
        for i=1:subnum_Total_T2
            
            % Getting the Correct Weather File Index 
           
            WeatherFile_Index=WeatherFile_Indices_T2(1,i);            
            
            EnergyMATRIX_Weather_T2(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
            
            EnergyMATRIX_Weather_T2(:,5:(5+(OtherVariables_Col-1)),i)=OtherVariables(:,:,WeatherFile_Index); % Placing Weather Variables
            
            EnergyMATRIX_Weather_T2(:,(5+OtherVariables_Col),i)=EnergyMATRIX_T2(:,5,i); % Placing WTGOut Energy
            
        end
        
        % Converting EnergyMATRIX_Weather_T to EnergyMATRIX_Weather_T_PlantLevel
        
        EnergyMATRIX_Weather_T2_PlantLevel=zeros(Row,(5+OtherVariables_Col)); % Initialization
        
        EnergyMATRIX_Weather_T2_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:(5+OtherVariables_Col)
               
               if ((j~=(5+OtherVariables_Col))||(j~=((5+OtherVariables_Col)-1)))
                   
                EnergyMATRIX_Weather_T2_PlantLevel(1,j)=sum(EnergyMATRIX_Weather_T2(i,j,:)); % Adding Energies and Turbine Status
                
               end
               
               EnergyMATRIX_Weather_T2_PlantLevel(1,j)=mean(EnergyMATRIX_Weather_T2(i,j,:)); % Averaging Weather Variables
               
           end
            
        end         
        
    end
        
    if (T3==1) % WTG Type 3 is Selected
        
        for i=1:subnum_Total_T3 % For Each Weather File
                             
           % Getting the Correct Weather File Index 
           
           WeatherFile_Index=WeatherFile_Indices_T3(1,i);
           
           % Getting the Correct Sub-Type Index Using External Function 
           
           SubType_Index=WTG_SubType_Index_Generator(SubType_Indices_Corrected_T3,WeatherFile_Index); 
                      
           [ Pressure ] = PressureAtHeight( LatLongAlt_T3(i,3) );

           for j=1:Row % For each Date-Time Stamp

                % Correct WindSpeed and Temperature Values

                WindSpeedMeasured=Ws(j,1,WeatherFile_Index);

                TemperatureMeasured=T(j,1,WeatherFile_Index);    

                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                

                if (~isempty(HeightAnemometer))
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T3(1,SubType_Index),Terrain );
                    
                else
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,hub_T3(1,SubType_Index),hub_T3(1,SubType_Index),Terrain );
                    
                end 

                % Computing Wake Effect on Wind Speed

                if (Wake2==1)

                    if (Jensen==1)

                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T3(1,SubType_Index),x_J,k_J, WindCorrected1 );

                    elseif (Frandsen==1)

                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T3(1,SubType_Index),x_F,k_F,alpha, WindCorrected1 );

                    end

                else

                    WindCorrected2=WindCorrected1;

                end

                % Computing Power Curve Point for the current instance

                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T3{1,SubType_Index}, WindCorrected2, cutin_T3(1,SubType_Index), cutout_T3(1,SubType_Index) ) ;   

                % Computing Corrected Power Curve Point due to effect of Air Density

                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density

                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt23_ForecastMode( WTGPowerPointCorrected, subnum_Total_T3, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,WeatherFile_Index)  );

                % Computing Wind Turbine Power Losses and Power Supplied to the Grid

                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

                % Filling the EnergyMATRIX

                EnergyMATRIX_T3( j ,5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T3( j, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T3( j, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T3( j, 8, i)=WTGTransLossP*EnergyConverter ;

           end   
       
        end        
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_T
        
        for i=1:subnum_Total_T3           
                       
            EnergyMATRIX_T3(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp            
            
        end 
        
        % Converting EnergyMATRIX_T to EnergyMATRIX_T_PlantLevel
        
        EnergyMATRIX_T3_PlantLevel=zeros(Row,8); % Initialization
        
        EnergyMATRIX_T3_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:8
               
               EnergyMATRIX_T3_PlantLevel(1,j)=sum(EnergyMATRIX_T3(i,j,:));
               
           end
            
        end
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_Weather_T
        
        EnergyMATRIX_Weather_T3=zeros(Row,(5+OtherVariables_Col),subnum_Total_T3); % Initialization
        
        for i=1:subnum_Total_T3
            
            % Getting the Correct Weather File Index 
           
            WeatherFile_Index=WeatherFile_Indices_T3(1,i);            
            
            EnergyMATRIX_Weather_T3(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
            
            EnergyMATRIX_Weather_T3(:,5:(5+(OtherVariables_Col-1)),i)=OtherVariables(:,:,WeatherFile_Index); % Placing Weather Variables
            
            EnergyMATRIX_Weather_T3(:,(5+OtherVariables_Col),i)=EnergyMATRIX_T3(:,5,i); % Placing WTGOut Energy
            
        end
        
        % Converting EnergyMATRIX_Weather_T to EnergyMATRIX_Weather_T_PlantLevel
        
        EnergyMATRIX_Weather_T3_PlantLevel=zeros(Row,(5+OtherVariables_Col)); % Initialization
        
        EnergyMATRIX_Weather_T3_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:(5+OtherVariables_Col)
               
               if ((j~=(5+OtherVariables_Col))||(j~=((5+OtherVariables_Col)-1)))
                   
                EnergyMATRIX_Weather_T3_PlantLevel(1,j)=sum(EnergyMATRIX_Weather_T3(i,j,:)); % Adding Energies and Turbine Status
                
               end
               
               EnergyMATRIX_Weather_T3_PlantLevel(1,j)=mean(EnergyMATRIX_Weather_T3(i,j,:)); % Averaging Weather Variables
               
           end
            
        end         
        
    end  
        
    if (T4==1) % WTG Type 4 is Selected
        
        for i=1:subnum_Total_T4 % For Each Weather File
                             
           % Getting the Correct Weather File Index 
           
           WeatherFile_Index=WeatherFile_Indices_T4(1,i);
           
           % Getting the Correct Sub-Type Index Using External Function 
           
           SubType_Index=WTG_SubType_Index_Generator(SubType_Indices_Corrected_T4,WeatherFile_Index); 
                      
           [ Pressure ] = PressureAtHeight( LatLongAlt_T4(i,3) );

           for j=1:Row % For each Date-Time Stamp

                % Correct WindSpeed and Temperature Values

                WindSpeedMeasured=Ws(j,1,WeatherFile_Index);

                TemperatureMeasured=T(j,1,WeatherFile_Index);    

                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                

                if (~isempty(HeightAnemometer))
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T4(1,SubType_Index),Terrain );
                    
                else
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,hub_T4(1,SubType_Index),hub_T4(1,SubType_Index),Terrain );
                    
                end 

                % Computing Wake Effect on Wind Speed

                if (Wake2==1)

                    if (Jensen==1)

                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T4(1,SubType_Index),x_J,k_J, WindCorrected1 );

                    elseif (Frandsen==1)

                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T4(1,SubType_Index),x_F,k_F,alpha, WindCorrected1 );

                    end

                else

                    WindCorrected2=WindCorrected1;

                end

                % Computing Power Curve Point for the current instance

                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T4{1,SubType_Index}, WindCorrected2, cutin_T4(1,SubType_Index), cutout_T4(1,SubType_Index) ) ;   

                % Computing Corrected Power Curve Point due to effect of Air Density

                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density

                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt23_ForecastMode( WTGPowerPointCorrected, subnum_Total_T4, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,WeatherFile_Index)  );

                % Computing Wind Turbine Power Losses and Power Supplied to the Grid

                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

                % Filling the EnergyMATRIX

                EnergyMATRIX_T4( j ,5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T4( j, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T4( j, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T4( j, 8, i)=WTGTransLossP*EnergyConverter ;

           end   
       
        end        
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_T
        
        for i=1:subnum_Total_T4           
                       
            EnergyMATRIX_T4(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp            
            
        end 
        
        % Converting EnergyMATRIX_T to EnergyMATRIX_T_PlantLevel
        
        EnergyMATRIX_T4_PlantLevel=zeros(Row,8); % Initialization
        
        EnergyMATRIX_T4_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:8
               
               EnergyMATRIX_T4_PlantLevel(1,j)=sum(EnergyMATRIX_T4(i,j,:));
               
           end
            
        end
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_Weather_T
        
        EnergyMATRIX_Weather_T4=zeros(Row,(5+OtherVariables_Col),subnum_Total_T4); % Initialization
        
        for i=1:subnum_Total_T4
            
            % Getting the Correct Weather File Index 
           
            WeatherFile_Index=WeatherFile_Indices_T4(1,i);            
            
            EnergyMATRIX_Weather_T4(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
            
            EnergyMATRIX_Weather_T4(:,5:(5+(OtherVariables_Col-1)),i)=OtherVariables(:,:,WeatherFile_Index); % Placing Weather Variables
            
            EnergyMATRIX_Weather_T4(:,(5+OtherVariables_Col),i)=EnergyMATRIX_T4(:,5,i); % Placing WTGOut Energy
            
        end
        
        % Converting EnergyMATRIX_Weather_T to EnergyMATRIX_Weather_T_PlantLevel
        
        EnergyMATRIX_Weather_T4_PlantLevel=zeros(Row,(5+OtherVariables_Col)); % Initialization
        
        EnergyMATRIX_Weather_T4_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:(5+OtherVariables_Col)
               
               if ((j~=(5+OtherVariables_Col))||(j~=((5+OtherVariables_Col)-1)))
                   
                EnergyMATRIX_Weather_T4_PlantLevel(1,j)=sum(EnergyMATRIX_Weather_T4(i,j,:)); % Adding Energies and Turbine Status
                
               end
               
               EnergyMATRIX_Weather_T4_PlantLevel(1,j)=mean(EnergyMATRIX_Weather_T4(i,j,:)); % Averaging Weather Variables
               
           end
            
        end         
        
    end   
    
elseif (ComputationOptionsMenu==3) % Using Real Aveaged Power Curve per Turbine    
   
    % Computing Average Lat-Long-Alt for each WTG Type and entire Plant using External Function
    
    [Avg_LatLongAlt_T1,Avg_LatLongAlt_T2,Avg_LatLongAlt_T3,Avg_LatLongAlt_T4,Avg_LatLongAlt_Plant]=WTG_Average_LatLongAlt_Generator(LatLongAlt_T1,LatLongAlt_T2,LatLongAlt_T3,LatLongAlt_T4,WG_TurbineType);
    
    % Disintegrating Avg_LatLongAlt_Plant
    Lat_Plant=Avg_LatLongAlt_Plant(1,1);
    Lat_Plant_Str=num2str(Lat_Plant);
    
    Long_Plant=Avg_LatLongAlt_Plant(1,2);
    Long_Plant_Str=num2str(Long_Plant);
    
    Alt_Plant=Avg_LatLongAlt_Plant(1,3);
    Alt_Plant_Str=num2str(Alt_Plant);
    
    % Updating the Lat-Long-Alt Edit Boxes in Wind_GUI_MainPage
    
    set(Lat_Plant,'String',Lat_Plant_Str);
    set(Long_Plant,'String',Long_Plant_Str);
    set(Altitude_Plant,'String',Alt_Plant_Str); 
    
    % Computing Total Number of Turbines of each WTG Type
    subnum_Total_T1=sum(subnum_T1);
    subnum_Total_T2=sum(subnum_T2);
    subnum_Total_T3=sum(subnum_T3);
    subnum_Total_T4=sum(subnum_T4);    
    
    % Initializing EnergyMATRIX_T
    EnergyMATRIX_T1=zeros(Row,8,subnum_Total_T1);
    EnergyMATRIX_T2=zeros(Row,8,subnum_Total_T2);
    EnergyMATRIX_T3=zeros(Row,8,subnum_Total_T3);
    EnergyMATRIX_T4=zeros(Row,8,subnum_Total_T4);
    
    % Filling EnergyMATRIX_T with Date-Time Stamp
    for i=1:subnum_Total_T1
        
        EnergyMATRIX_T1(:,1:4,i)=DateTime_Stamp_WeatherFile;
        
    end
    for i=1:subnum_Total_T2
        
        EnergyMATRIX_T2(:,1:4,i)=DateTime_Stamp_WeatherFile;
        
    end
    for i=1:subnum_Total_T3
        
        EnergyMATRIX_T3(:,1:4,i)=DateTime_Stamp_WeatherFile;
        
    end
    for i=1:subnum_Total_T4
        
        EnergyMATRIX_T4(:,1:4,i)=DateTime_Stamp_WeatherFile;
        
    end  
    
    % Computing Correct Indices for Computation using External Function
    
    sub_T=[sub_T1,sub_T2,sub_T3,sub_T4];
    subnum_T={subnum_T1,subnum_T2,subnum_T3,subnum_T4};
    
    [WeatherFile_Indices_Cell,SubType_Indices_Corrected_Cell]=WTG_CorrectIndex_CompOpt34_Generator(WG_TurbineType,sub_T,subnum_T);
    
    % Disintegrating WeatherFile_Indices_Cell
    WeatherFile_Indices_T1=WeatherFile_Indices_Cell{1,1};
    WeatherFile_Indices_T2=WeatherFile_Indices_Cell{1,2};
    WeatherFile_Indices_T3=WeatherFile_Indices_Cell{1,3};
    WeatherFile_Indices_T4=WeatherFile_Indices_Cell{1,4};
    
    % Disintegrating SubType_Indices_Corrected_Cell
    SubType_Indices_Corrected_T1=SubType_Indices_Corrected_Cell{1,1};
    SubType_Indices_Corrected_T2=SubType_Indices_Corrected_Cell{1,2};
    SubType_Indices_Corrected_T3=SubType_Indices_Corrected_Cell{1,3};
    SubType_Indices_Corrected_T4=SubType_Indices_Corrected_Cell{1,4};     
    
    % Computation based on WTG Type
    
    if (T1==1) % WTG Type 1 is Selected
       
        for i=1:subnum_Total_T1 % For Each Weather File
                             
           % Getting the Correct Weather File Index 
           
           WeatherFile_Index=WeatherFile_Indices_T1(1,i);
           
           % Getting the Correct Sub-Type Index Using External Function 
           
           SubType_Index=WTG_SubType_Index_Generator(SubType_Indices_Corrected_T1,WeatherFile_Index); 
                      
           [ Pressure ] = PressureAtHeight( LatLongAlt_T1(i,3) );

           for j=1:Row % For each Date-Time Stamp

                % Correct WindSpeed and Temperature Values

                WindSpeedMeasured=Ws(j,1,WeatherFile_Index);

                TemperatureMeasured=T(j,1,WeatherFile_Index);    

                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                

                if (~isempty(HeightAnemometer))
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T1(1,SubType_Index),Terrain );
                    
                else
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,hub_T1(1,SubType_Index),hub_T1(1,SubType_Index),Terrain );
                    
                end 

                % Computing Wake Effect on Wind Speed

                if (Wake2==1)

                    if (Jensen==1)

                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T1(1,SubType_Index),x_J,k_J, WindCorrected1 );

                    elseif (Frandsen==1)

                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T1(1,SubType_Index),x_F,k_F,alpha, WindCorrected1 );

                    end

                else

                    WindCorrected2=WindCorrected1;

                end

                % Computing Power Curve Point for the current instance

                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T1{1,WeatherFile_Index}, WindCorrected2, cutin_T1(1,SubType_Index), cutout_T1(1,SubType_Index) ) ;   

                % Computing Corrected Power Curve Point due to effect of Air Density

                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density

                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt23_ForecastMode( WTGPowerPointCorrected, subnum_Total_T1, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,WeatherFile_Index)  );

                % Computing Wind Turbine Power Losses and Power Supplied to the Grid

                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

                % Filling the EnergyMATRIX

                EnergyMATRIX_T1( j ,5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T1( j, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T1( j, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T1( j, 8, i)=WTGTransLossP*EnergyConverter ;

           end   
       
        end
 
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_T
        
        for i=1:subnum_Total_T1           
                       
            EnergyMATRIX_T1(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp            
            
        end 
        
        % Converting EnergyMATRIX_T to EnergyMATRIX_T_PlantLevel
        
        EnergyMATRIX_T1_PlantLevel=zeros(Row,8); % Initialization
        
        EnergyMATRIX_T1_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:8
               
               EnergyMATRIX_T1_PlantLevel(1,j)=sum(EnergyMATRIX_T1(i,j,:));
               
           end
            
        end
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_Weather_T
        
        EnergyMATRIX_Weather_T1=zeros(Row,(5+OtherVariables_Col),subnum_Total_T1); % Initialization
        
        for i=1:subnum_Total_T1
            
            % Getting the Correct Weather File Index 
           
            WeatherFile_Index=WeatherFile_Indices_T1(1,i);            
            
            EnergyMATRIX_Weather_T1(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
            
            EnergyMATRIX_Weather_T1(:,5:(5+(OtherVariables_Col-1)),i)=OtherVariables(:,:,WeatherFile_Index); % Placing Weather Variables
            
            EnergyMATRIX_Weather_T1(:,(5+OtherVariables_Col),i)=EnergyMATRIX_T1(:,5,i); % Placing WTGOut Energy
            
        end
        
        % Converting EnergyMATRIX_Weather_T to EnergyMATRIX_Weather_T_PlantLevel
        
        EnergyMATRIX_Weather_T1_PlantLevel=zeros(Row,(5+OtherVariables_Col)); % Initialization
        
        EnergyMATRIX_Weather_T1_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:(5+OtherVariables_Col)
               
               if ((j~=(5+OtherVariables_Col))||(j~=((5+OtherVariables_Col)-1)))
                   
                EnergyMATRIX_Weather_T1_PlantLevel(1,j)=sum(EnergyMATRIX_Weather_T1(i,j,:)); % Adding Energies and Turbine Status
                
               end
               
               EnergyMATRIX_Weather_T1_PlantLevel(1,j)=mean(EnergyMATRIX_Weather_T1(i,j,:)); % Averaging Weather Variables
               
           end
            
        end         
        
    end               
        
    if (T2==1) % WTG Type 2 is Selected
        
        for i=1:subnum_Total_T2 % For Each Weather File
                             
           % Getting the Correct Weather File Index 
           
           WeatherFile_Index=WeatherFile_Indices_T2(1,i);
           
           % Getting the Correct Sub-Type Index Using External Function 
           
           SubType_Index=WTG_SubType_Index_Generator(SubType_Indices_Corrected_T2,WeatherFile_Index); 
                      
           [ Pressure ] = PressureAtHeight( LatLongAlt_T2(i,3) );

           for j=1:Row % For each Date-Time Stamp

                % Correct WindSpeed and Temperature Values

                WindSpeedMeasured=Ws(j,1,WeatherFile_Index);

                TemperatureMeasured=T(j,1,WeatherFile_Index);    

                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                

                if (~isempty(HeightAnemometer))
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T2(1,SubType_Index),Terrain );
                    
                else
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,hub_T2(1,SubType_Index),hub_T2(1,SubType_Index),Terrain );
                    
                end 

                % Computing Wake Effect on Wind Speed

                if (Wake2==1)

                    if (Jensen==1)

                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T2(1,SubType_Index),x_J,k_J, WindCorrected1 );

                    elseif (Frandsen==1)

                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T2(1,SubType_Index),x_F,k_F,alpha, WindCorrected1 );

                    end

                else

                    WindCorrected2=WindCorrected1;

                end

                % Computing Power Curve Point for the current instance

                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T2{1,WeatherFile_Index}, WindCorrected2, cutin_T2(1,SubType_Index), cutout_T2(1,SubType_Index) ) ;   

                % Computing Corrected Power Curve Point due to effect of Air Density

                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density

                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt23_ForecastMode( WTGPowerPointCorrected, subnum_Total_T2, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,WeatherFile_Index)  );

                % Computing Wind Turbine Power Losses and Power Supplied to the Grid

                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

                % Filling the EnergyMATRIX

                EnergyMATRIX_T2( j ,5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T2( j, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T2( j, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T2( j, 8, i)=WTGTransLossP*EnergyConverter ;

           end   
       
        end  
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_T
        
        for i=1:subnum_Total_T2           
                       
            EnergyMATRIX_T2(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp            
            
        end 
        
        % Converting EnergyMATRIX_T to EnergyMATRIX_T_PlantLevel
        
        EnergyMATRIX_T2_PlantLevel=zeros(Row,8); % Initialization
        
        EnergyMATRIX_T2_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:8
               
               EnergyMATRIX_T2_PlantLevel(1,j)=sum(EnergyMATRIX_T2(i,j,:));
               
           end
            
        end
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_Weather_T
        
        EnergyMATRIX_Weather_T2=zeros(Row,(5+OtherVariables_Col),subnum_Total_T2); % Initialization
        
        for i=1:subnum_Total_T2
            
            % Getting the Correct Weather File Index 
           
            WeatherFile_Index=WeatherFile_Indices_T2(1,i);            
            
            EnergyMATRIX_Weather_T2(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
            
            EnergyMATRIX_Weather_T2(:,5:(5+(OtherVariables_Col-1)),i)=OtherVariables(:,:,WeatherFile_Index); % Placing Weather Variables
            
            EnergyMATRIX_Weather_T2(:,(5+OtherVariables_Col),i)=EnergyMATRIX_T2(:,5,i); % Placing WTGOut Energy
            
        end
        
        % Converting EnergyMATRIX_Weather_T to EnergyMATRIX_Weather_T_PlantLevel
        
        EnergyMATRIX_Weather_T2_PlantLevel=zeros(Row,(5+OtherVariables_Col)); % Initialization
        
        EnergyMATRIX_Weather_T2_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:(5+OtherVariables_Col)
               
               if ((j~=(5+OtherVariables_Col))||(j~=((5+OtherVariables_Col)-1)))
                   
                EnergyMATRIX_Weather_T2_PlantLevel(1,j)=sum(EnergyMATRIX_Weather_T2(i,j,:)); % Adding Energies and Turbine Status
                
               end
               
               EnergyMATRIX_Weather_T2_PlantLevel(1,j)=mean(EnergyMATRIX_Weather_T2(i,j,:)); % Averaging Weather Variables
               
           end
            
        end        
        
    end
        
    if (T3==1) % WTG Type 3 is Selected
        
        for i=1:subnum_Total_T3 % For Each Weather File
                             
           % Getting the Correct Weather File Index 
           
           WeatherFile_Index=WeatherFile_Indices_T3(1,i);
           
           % Getting the Correct Sub-Type Index Using External Function 
           
           SubType_Index=WTG_SubType_Index_Generator(SubType_Indices_Corrected_T3,WeatherFile_Index); 
                      
           [ Pressure ] = PressureAtHeight( LatLongAlt_T3(i,3) );

           for j=1:Row % For each Date-Time Stamp

                % Correct WindSpeed and Temperature Values

                WindSpeedMeasured=Ws(j,1,WeatherFile_Index);

                TemperatureMeasured=T(j,1,WeatherFile_Index);    

                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                

                if (~isempty(HeightAnemometer))
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T3(1,SubType_Index),Terrain );
                    
                else
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,hub_T3(1,SubType_Index),hub_T3(1,SubType_Index),Terrain );
                    
                end 

                % Computing Wake Effect on Wind Speed

                if (Wake2==1)

                    if (Jensen==1)

                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T3(1,SubType_Index),x_J,k_J, WindCorrected1 );

                    elseif (Frandsen==1)

                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T3(1,SubType_Index),x_F,k_F,alpha, WindCorrected1 );

                    end

                else

                    WindCorrected2=WindCorrected1;

                end

                % Computing Power Curve Point for the current instance

                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T3{1,WeatherFile_Index}, WindCorrected2, cutin_T3(1,SubType_Index), cutout_T3(1,SubType_Index) ) ;   

                % Computing Corrected Power Curve Point due to effect of Air Density

                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density

                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt23_ForecastMode( WTGPowerPointCorrected, subnum_Total_T3, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,WeatherFile_Index)  );

                % Computing Wind Turbine Power Losses and Power Supplied to the Grid

                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

                % Filling the EnergyMATRIX

                EnergyMATRIX_T3( j ,5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T3( j, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T3( j, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T3( j, 8, i)=WTGTransLossP*EnergyConverter ;

           end   
       
        end        

        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_T
        
        for i=1:subnum_Total_T3           
                       
            EnergyMATRIX_T3(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp            
            
        end 
        
        % Converting EnergyMATRIX_T to EnergyMATRIX_T_PlantLevel
        
        EnergyMATRIX_T3_PlantLevel=zeros(Row,8); % Initialization
        
        EnergyMATRIX_T3_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:8
               
               EnergyMATRIX_T3_PlantLevel(1,j)=sum(EnergyMATRIX_T3(i,j,:));
               
           end
            
        end
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_Weather_T
        
        EnergyMATRIX_Weather_T3=zeros(Row,(5+OtherVariables_Col),subnum_Total_T3); % Initialization
        
        for i=1:subnum_Total_T3
            
            % Getting the Correct Weather File Index 
           
            WeatherFile_Index=WeatherFile_Indices_T3(1,i);            
            
            EnergyMATRIX_Weather_T3(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
            
            EnergyMATRIX_Weather_T3(:,5:(5+(OtherVariables_Col-1)),i)=OtherVariables(:,:,WeatherFile_Index); % Placing Weather Variables
            
            EnergyMATRIX_Weather_T3(:,(5+OtherVariables_Col),i)=EnergyMATRIX_T3(:,5,i); % Placing WTGOut Energy
            
        end
        
        % Converting EnergyMATRIX_Weather_T to EnergyMATRIX_Weather_T_PlantLevel
        
        EnergyMATRIX_Weather_T3_PlantLevel=zeros(Row,(5+OtherVariables_Col)); % Initialization
        
        EnergyMATRIX_Weather_T3_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:(5+OtherVariables_Col)
               
               if ((j~=(5+OtherVariables_Col))||(j~=((5+OtherVariables_Col)-1)))
                   
                EnergyMATRIX_Weather_T3_PlantLevel(1,j)=sum(EnergyMATRIX_Weather_T3(i,j,:)); % Adding Energies and Turbine Status
                
               end
               
               EnergyMATRIX_Weather_T3_PlantLevel(1,j)=mean(EnergyMATRIX_Weather_T3(i,j,:)); % Averaging Weather Variables
               
           end
            
        end        
        
    end  
        
    if (T4==1) % WTG Type 4 is Selected
        
        for i=1:subnum_Total_T4 % For Each Weather File
                             
           % Getting the Correct Weather File Index 
           
           WeatherFile_Index=WeatherFile_Indices_T4(1,i);
           
           % Getting the Correct Sub-Type Index Using External Function 
           
           SubType_Index=WTG_SubType_Index_Generator(SubType_Indices_Corrected_T4,WeatherFile_Index); 
                      
           [ Pressure ] = PressureAtHeight( LatLongAlt_T4(i,3) );

           for j=1:Row % For each Date-Time Stamp

                % Correct WindSpeed and Temperature Values

                WindSpeedMeasured=Ws(j,1,WeatherFile_Index);

                TemperatureMeasured=T(j,1,WeatherFile_Index);    

                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                

                if (~isempty(HeightAnemometer))
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T4(1,SubType_Index),Terrain );
                    
                else
                    
                    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,hub_T4(1,SubType_Index),hub_T4(1,SubType_Index),Terrain );
                    
                end 

                % Computing Wake Effect on Wind Speed

                if (Wake2==1)

                    if (Jensen==1)

                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T4(1,SubType_Index),x_J,k_J, WindCorrected1 );

                    elseif (Frandsen==1)

                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T4(1,SubType_Index),x_F,k_F,alpha, WindCorrected1 );

                    end

                else

                    WindCorrected2=WindCorrected1;

                end

                % Computing Power Curve Point for the current instance

                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T4{1,WeatherFile_Index}, WindCorrected2, cutin_T4(1,SubType_Index), cutout_T4(1,SubType_Index) ) ;   

                % Computing Corrected Power Curve Point due to effect of Air Density

                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density

                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt23_ForecastMode( WTGPowerPointCorrected, subnum_Total_T4, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,WeatherFile_Index)  );

                % Computing Wind Turbine Power Losses and Power Supplied to the Grid

                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

                % Filling the EnergyMATRIX

                EnergyMATRIX_T4( j ,5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T4( j, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T4( j, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T4( j, 8, i)=WTGTransLossP*EnergyConverter ;

           end   
       
        end
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_T
        
        for i=1:subnum_Total_T4           
                       
            EnergyMATRIX_T4(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp            
            
        end 
        
        % Converting EnergyMATRIX_T to EnergyMATRIX_T_PlantLevel
        
        EnergyMATRIX_T4_PlantLevel=zeros(Row,8); % Initialization
        
        EnergyMATRIX_T4_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:8
               
               EnergyMATRIX_T4_PlantLevel(1,j)=sum(EnergyMATRIX_T4(i,j,:));
               
           end
            
        end
        
        % Placing Appropriate Weather Variable Matrices and Date-Time Stamps in EnergyMATRIX_Weather_T
        
        EnergyMATRIX_Weather_T4=zeros(Row,(5+OtherVariables_Col),subnum_Total_T4); % Initialization
        
        for i=1:subnum_Total_T4
            
            % Getting the Correct Weather File Index 
           
            WeatherFile_Index=WeatherFile_Indices_T4(1,i);            
            
            EnergyMATRIX_Weather_T4(:,1:4,i)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
            
            EnergyMATRIX_Weather_T4(:,5:(5+(OtherVariables_Col-1)),i)=OtherVariables(:,:,WeatherFile_Index); % Placing Weather Variables
            
            EnergyMATRIX_Weather_T4(:,(5+OtherVariables_Col),i)=EnergyMATRIX_T4(:,5,i); % Placing WTGOut Energy
            
        end
        
        % Converting EnergyMATRIX_Weather_T to EnergyMATRIX_Weather_T_PlantLevel
        
        EnergyMATRIX_Weather_T4_PlantLevel=zeros(Row,(5+OtherVariables_Col)); % Initialization
        
        EnergyMATRIX_Weather_T4_PlantLevel(:,1:4)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
        
        for i=1:Row
            
           for j=5:(5+OtherVariables_Col)
               
               if ((j~=(5+OtherVariables_Col))||(j~=((5+OtherVariables_Col)-1)))
                   
                EnergyMATRIX_Weather_T4_PlantLevel(1,j)=sum(EnergyMATRIX_Weather_T4(i,j,:)); % Adding Energies and Turbine Status
                
               end
               
               EnergyMATRIX_Weather_T4_PlantLevel(1,j)=mean(EnergyMATRIX_Weather_T4(i,j,:)); % Averaging Weather Variables
               
           end
            
        end        
        
    end     
    
elseif (ComputationOptionsMenu==4) % using Real Averaged Power Curve of the Plant
    
    % Computing Average Lat-Long-Alt for each WTG Type and entire Plant using External Function
    
    [Avg_LatLongAlt_T1,Avg_LatLongAlt_T2,Avg_LatLongAlt_T3,Avg_LatLongAlt_T4,Avg_LatLongAlt_Plant]=WTG_Average_LatLongAlt_Generator(LatLongAlt_T1,LatLongAlt_T2,LatLongAlt_T3,LatLongAlt_T4,WG_TurbineType);
    
    % Disintegrating Avg_LatLongAlt_Plant
    Lat_Plant=Avg_LatLongAlt_Plant(1,1);
    Lat_Plant_Str=num2str(Lat_Plant);
    
    Long_Plant=Avg_LatLongAlt_Plant(1,2);
    Long_Plant_Str=num2str(Long_Plant);
    
    Alt_Plant=Avg_LatLongAlt_Plant(1,3);
    Alt_Plant_Str=num2str(Alt_Plant);
    
    % Updating the Lat-Long-Alt Edit Boxes in Wind_GUI_MainPage
    
    set(Lat_Plant,'String',Lat_Plant_Str);
    set(Long_Plant,'String',Long_Plant_Str);
    set(Altitude_Plant,'String',Alt_Plant_Str);
    
    % Computing Total Number of Turbines of each WTG Type
    subnum_Total_T1=sum(subnum_T1);
    subnum_Total_T2=sum(subnum_T2);
    subnum_Total_T3=sum(subnum_T3);
    subnum_Total_T4=sum(subnum_T4);
           
    % Computing Average Cut-In Speed of Turbines of each WTG Type using External Function    
        
    [CutIn_Average_T1]=WTG_PlantWTGTypeLevel_Averager(subnum_T1,subnum_Total_T1,cutin_T1); 
    [CutIn_Average_T2]=WTG_PlantWTGTypeLevel_Averager(subnum_T2,subnum_Total_T2,cutin_T2);
    [CutIn_Average_T3]=WTG_PlantWTGTypeLevel_Averager(subnum_T3,subnum_Total_T3,cutin_T3);
    [CutIn_Average_T4]=WTG_PlantWTGTypeLevel_Averager(subnum_T4,subnum_Total_T4,cutin_T4);
        
    % Computing Average Cut-Out Speed of Turbines of each WTG Type using External Function  
    
    [CutOut_Average_T1]=WTG_PlantWTGTypeLevel_Averager(subnum_T1,subnum_Total_T1,cutout_T1);
    [CutOut_Average_T2]=WTG_PlantWTGTypeLevel_Averager(subnum_T2,subnum_Total_T2,cutout_T2);
    [CutOut_Average_T3]=WTG_PlantWTGTypeLevel_Averager(subnum_T3,subnum_Total_T3,cutout_T3);
    [CutOut_Average_T4]=WTG_PlantWTGTypeLevel_Averager(subnum_T4,subnum_Total_T4,cutout_T4);
    
    % Computing Average Hub-Height of Turbines of each WTG Type using External Function  
    
    [HubHeight_Average_T1]=WTG_PlantWTGTypeLevel_Averager(subnum_T1,subnum_Total_T1,hub_T1);
    [HubHeight_Average_T2]=WTG_PlantWTGTypeLevel_Averager(subnum_T2,subnum_Total_T2,hub_T2);
    [HubHeight_Average_T3]=WTG_PlantWTGTypeLevel_Averager(subnum_T3,subnum_Total_T3,hub_T3);
    [HubHeight_Average_T4]=WTG_PlantWTGTypeLevel_Averager(subnum_T4,subnum_Total_T4,hub_T4);
        
    % Computing Average Rotor-Radius of Turbines of each WTG Type using External Function  
    
    [RotRad_Average_T1]=WTG_PlantWTGTypeLevel_Averager(subnum_T1,subnum_Total_T1,rotrad_T1);
    [RotRad_Average_T2]=WTG_PlantWTGTypeLevel_Averager(subnum_T2,subnum_Total_T2,rotrad_T2);
    [RotRad_Average_T3]=WTG_PlantWTGTypeLevel_Averager(subnum_T3,subnum_Total_T3,rotrad_T3);
    [RotRad_Average_T4]=WTG_PlantWTGTypeLevel_Averager(subnum_T4,subnum_Total_T4,rotrad_T4);
    
    % Computing Pressure [atm] at the Avegrage Altitude of Plant
    
    [ Pressure_T1 ] = PressureAtHeight( Avg_LatLongAlt_T1(1,3) );
    [ Pressure_T2 ] = PressureAtHeight( Avg_LatLongAlt_T2(1,3) ); 
    [ Pressure_T3 ] = PressureAtHeight( Avg_LatLongAlt_T3(1,3) ); 
    [ Pressure_T4 ] = PressureAtHeight( Avg_LatLongAlt_T4(1,3) ); 
    
    % Initializing EnergyMATRIX_T
    EnergyMATRIX_T1=zeros(Row,8,1);
    EnergyMATRIX_T2=zeros(Row,8,1);
    EnergyMATRIX_T3=zeros(Row,8,1);
    EnergyMATRIX_T4=zeros(Row,8,1);
    
    % Filling EnergyMATRIX_T with Date-Time Stamp
    EnergyMATRIX_T1(:,1:4,1)=DateTime_Stamp_WeatherFile;
    EnergyMATRIX_T2(:,1:4,1)=DateTime_Stamp_WeatherFile;
    EnergyMATRIX_T3(:,1:4,1)=DateTime_Stamp_WeatherFile;
    EnergyMATRIX_T4(:,1:4,1)=DateTime_Stamp_WeatherFile;
    
    % Initializing Counter for WTG Type
    Counter_WTGType=0;
    
    % Computation based on WTG Type    
       
    if (T1==1) % WTG Type 1 is Selected         
            
       % Incrementing Counter_WTGType
       
       Counter_WTGType=Counter_WTGType+1;
           
       for j=1:Row % For each Date-Time Stamp

            % Correct WindSpeed and Temperature Values

            WindSpeedMeasured=Ws(j,1,Counter_WTGType);

            TemperatureMeasured=T(j,1,Counter_WTGType);    

            % Computing Effect of Hub-Height and Terrain on Wind Speed using external function              
            
            if (~isempty(HeightAnemometer))

                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,HubHeight_Average_T1,Terrain );

            else

                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HubHeight_Average_T1,HubHeight_Average_T1,Terrain );

            end             

            % Computing Wake Effect on Wind Speed

            if (Wake2==1)

                if (Jensen==1)

                    [ WindCorrected2 ] = JensenWakeEffect( a_J,RotRad_Average_T1,x_J,k_J, WindCorrected1 );

                elseif (Frandsen==1)

                    [ WindCorrected2 ] = FrandsenWakeEffect(a_F,RotRad_Average_T1,x_F,k_F,alpha, WindCorrected1 );

                end

            else

                WindCorrected2=WindCorrected1;

            end

            % Computing Power Curve Point for the current instance

            [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T1{1,1}, WindCorrected2, CutIn_Average_T1, CutOut_Average_T1 ) ;   

            % Computing Corrected Power Curve Point due to effect of Air Density

            [ DenNew ] = AirDensity( Pressure_T1, TemperatureMeasured); % Corrected Air Density

            [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

            % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

            [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt4_ForecastMode( WTGPowerPointCorrected, subnum_Total_T1, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,Counter_WTGType)  );

            % Computing Wind Turbine Power Losses and Power Supplied to the Grid

            [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

            % Filling the EnergyMATRIX

            EnergyMATRIX_T1( j ,5, 1)=WTGPower*EnergyConverter ;
            EnergyMATRIX_T1( j, 6, 1)=WTGPowerGrid*EnergyConverter ;
            EnergyMATRIX_T1( j, 7, 1)=WTGOhmicLossP*EnergyConverter ;
            EnergyMATRIX_T1( j, 8, 1)=WTGTransLossP*EnergyConverter ;

       end           
        
       % Placing Date-Time Stamp in EnergyMATRIX_T
       
       EnergyMATRIX_T1( :, 1:4, 1)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
       
       % Creating EnergyMATRIX_T_PlantLevel
       
       EnergyMATRIX_T1_PlantLevel=EnergyMATRIX_T1;       
             
       % Creating EnergyMATRIX_Weather_T
       
       EnergyMATRIX_Weather_T1=[DateTime_Stamp_WeatherFile , OtherVariables(:,:,1) , EnergyMATRIX_T1(:,5,1)];
       
       % Creating EnergyMATRIX_Weather_Weather_T_PlantLevel
       
       EnergyMATRIX_Weather_T1_PlantLevel=[DateTime_Stamp_WeatherFile , OtherVariables(:,:,1) , EnergyMATRIX_T1_PlantLevel(:,end,1)];       
       
    end               
        
    if (T2==1) % WTG Type 2 is Selected
        
       % Incrementing Counter_WTGType
       
       Counter_WTGType=Counter_WTGType+1;
           
       for j=1:Row % For each Date-Time Stamp

            % Correct WindSpeed and Temperature Values

            WindSpeedMeasured=Ws(j,1,Counter_WTGType);

            TemperatureMeasured=T(j,1,Counter_WTGType);    

            % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                

            if (~isempty(HeightAnemometer))

                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,HubHeight_Average_T2,Terrain );

            else

                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HubHeight_Average_T2,HubHeight_Average_T2,Terrain );

            end  

            % Computing Wake Effect on Wind Speed

            if (Wake2==1)

                if (Jensen==1)

                    [ WindCorrected2 ] = JensenWakeEffect( a_J,RotRad_Average_T2,x_J,k_J, WindCorrected1 );

                elseif (Frandsen==1)

                    [ WindCorrected2 ] = FrandsenWakeEffect(a_F,RotRad_Average_T2,x_F,k_F,alpha, WindCorrected1 );

                end

            else

                WindCorrected2=WindCorrected1;

            end

            % Computing Power Curve Point for the current instance

            [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T2{1,1}, WindCorrected2, CutIn_Average_T2, CutOut_Average_T2 ) ;   

            % Computing Corrected Power Curve Point due to effect of Air Density

            [ DenNew ] = AirDensity( Pressure_T2, TemperatureMeasured); % Corrected Air Density

            [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

            % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

            [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt4_ForecastMode( WTGPowerPointCorrected, subnum_Total_T2, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,Counter_WTGType)  );

            % Computing Wind Turbine Power Losses and Power Supplied to the Grid

            [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

            % Filling the EnergyMATRIX

            EnergyMATRIX_T2( j ,5, 1)=WTGPower*EnergyConverter ;
            EnergyMATRIX_T2( j, 6, 1)=WTGPowerGrid*EnergyConverter ;
            EnergyMATRIX_T2( j, 7, 1)=WTGOhmicLossP*EnergyConverter ;
            EnergyMATRIX_T2( j, 8, 1)=WTGTransLossP*EnergyConverter ;

       end
       
       % Placing Date-Time Stamp in EnergyMATRIX_T
       
       EnergyMATRIX_T2( :, 1:4, 1)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
       
       % Creating EnergyMATRIX_T_PlantLevel
       
       EnergyMATRIX_T2_PlantLevel=EnergyMATRIX_T2;       
             
       % Creating EnergyMATRIX_Weather_T
       
       EnergyMATRIX_Weather_T2=[DateTime_Stamp_WeatherFile , OtherVariables(:,:,2) , EnergyMATRIX_T2(:,5,1)];
       
       % Creating EnergyMATRIX_Weather_Weather_T_PlantLevel
       
       EnergyMATRIX_Weather_T2_PlantLevel=[DateTime_Stamp_WeatherFile , OtherVariables(:,:,2) , EnergyMATRIX_T2_PlantLevel(:,end,1)];         
        
    end
        
    if (T3==1) % WTG Type 3 is Selected
        
       % Incrementing Counter_WTGType
       
       Counter_WTGType=Counter_WTGType+1;
           
       for j=1:Row % For each Date-Time Stamp

            % Correct WindSpeed and Temperature Values

            WindSpeedMeasured=Ws(j,1,Counter_WTGType);

            TemperatureMeasured=T(j,1,Counter_WTGType);    

            % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                

            if (~isempty(HeightAnemometer))

                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,HubHeight_Average_T3,Terrain );

            else

                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HubHeight_Average_T3,HubHeight_Average_T3,Terrain );

            end  

            % Computing Wake Effect on Wind Speed

            if (Wake2==1)

                if (Jensen==1)

                    [ WindCorrected2 ] = JensenWakeEffect( a_J,RotRad_Average_T3,x_J,k_J, WindCorrected1 );

                elseif (Frandsen==1)

                    [ WindCorrected2 ] = FrandsenWakeEffect(a_F,RotRad_Average_T3,x_F,k_F,alpha, WindCorrected1 );

                end

            else

                WindCorrected2=WindCorrected1;

            end

            % Computing Power Curve Point for the current instance

            [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T3{1,1}, WindCorrected2, CutIn_Average_T3, CutOut_Average_T3 ) ;   

            % Computing Corrected Power Curve Point due to effect of Air Density

            [ DenNew ] = AirDensity( Pressure_T3, TemperatureMeasured); % Corrected Air Density

            [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

            % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

            [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt4_ForecastMode( WTGPowerPointCorrected, subnum_Total_T3, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,Counter_WTGType)  );

            % Computing Wind Turbine Power Losses and Power Supplied to the Grid

            [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

            % Filling the EnergyMATRIX

            EnergyMATRIX_T3( j ,5, 1)=WTGPower*EnergyConverter ;
            EnergyMATRIX_T3( j, 6, 1)=WTGPowerGrid*EnergyConverter ;
            EnergyMATRIX_T3( j, 7, 1)=WTGOhmicLossP*EnergyConverter ;
            EnergyMATRIX_T3( j, 8, 1)=WTGTransLossP*EnergyConverter ;

       end         
     
       % Placing Date-Time Stamp in EnergyMATRIX_T
       
       EnergyMATRIX_T3( :, 1:4, 1)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
       
       % Creating EnergyMATRIX_T_PlantLevel
       
       EnergyMATRIX_T3_PlantLevel=EnergyMATRIX_T3;       
             
       % Creating EnergyMATRIX_Weather_T
       
       EnergyMATRIX_Weather_T3=[DateTime_Stamp_WeatherFile , OtherVariables(:,:,3) , EnergyMATRIX_T3(:,5,1)];
       
       % Creating EnergyMATRIX_Weather_Weather_T_PlantLevel
       
       EnergyMATRIX_Weather_T3_PlantLevel=[DateTime_Stamp_WeatherFile , OtherVariables(:,:,3) , EnergyMATRIX_T3_PlantLevel(:,end,1)];         
       
    end  
        
    if (T4==1) % WTG Type 4 is Selected
        
       % Incrementing Counter_WTGType
       
       Counter_WTGType=Counter_WTGType+1;
           
       for j=1:Row % For each Date-Time Stamp

            % Correct WindSpeed and Temperature Values

            WindSpeedMeasured=Ws(j,1,Counter_WTGType);

            TemperatureMeasured=T(j,1,Counter_WTGType);    

            % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                

            if (~isempty(HeightAnemometer))

                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,HubHeight_Average_T4,Terrain );

            else

                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HubHeight_Average_T4,HubHeight_Average_T4,Terrain );

            end  

            % Computing Wake Effect on Wind Speed

            if (Wake2==1)

                if (Jensen==1)

                    [ WindCorrected2 ] = JensenWakeEffect( a_J,RotRad_Average_T4,x_J,k_J, WindCorrected1 );

                elseif (Frandsen==1)

                    [ WindCorrected2 ] = FrandsenWakeEffect(a_F,RotRad_Average_T4,x_F,k_F,alpha, WindCorrected1 );

                end

            else

                WindCorrected2=WindCorrected1;

            end

            % Computing Power Curve Point for the current instance

            [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T4{1,1}, WindCorrected2, CutIn_Average_T4, CutOut_Average_T4 ) ;   

            % Computing Corrected Power Curve Point due to effect of Air Density

            [ DenNew ] = AirDensity( Pressure_T4, TemperatureMeasured); % Corrected Air Density

            [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

            % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines

            [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt4_ForecastMode( WTGPowerPointCorrected, subnum_Total_T4, Perf_Rat, Turbine_File, PR, PlantStatus(j,1,Counter_WTGType)  );

            % Computing Wind Turbine Power Losses and Power Supplied to the Grid

            [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

            % Filling the EnergyMATRIX

            EnergyMATRIX_T4( j ,5, 1)=WTGPower*EnergyConverter ;
            EnergyMATRIX_T4( j, 6, 1)=WTGPowerGrid*EnergyConverter ;
            EnergyMATRIX_T4( j, 7, 1)=WTGOhmicLossP*EnergyConverter ;
            EnergyMATRIX_T4( j, 8, 1)=WTGTransLossP*EnergyConverter ;

       end
       
       % Placing Date-Time Stamp in EnergyMATRIX_T
       
       EnergyMATRIX_T4( :, 1:4, 1)=DateTime_Stamp_WeatherFile; % Placing Date-Time-Stamp
       
       % Creating EnergyMATRIX_T_PlantLevel
       
       EnergyMATRIX_T4_PlantLevel=EnergyMATRIX_T4;       
             
       % Creating EnergyMATRIX_Weather_T
       
       EnergyMATRIX_Weather_T4=[DateTime_Stamp_WeatherFile , OtherVariables(:,:,4) , EnergyMATRIX_T4(:,5,1)];
       
       % Creating EnergyMATRIX_Weather_Weather_T_PlantLevel
       
       EnergyMATRIX_Weather_T4_PlantLevel=[DateTime_Stamp_WeatherFile , OtherVariables(:,:,4) , EnergyMATRIX_T4_PlantLevel(:,end,1)];          
        
    end    
    
end

%% Computing Full Plant Level EnergyMATRIX_FullPlant and EnergyMATRIX_Weather_FullPlant

% Computing Full Plant Level EnergyMATRIX_FullPlant from EnergyMATRIX_T_PlantLevel

EnergyMATRIX_FullPlant = [DateTime_Stamp_WeatherFile, EnergyMATRIX_T1_PlantLevel(:,5:end)+EnergyMATRIX_T2_PlantLevel(:,5:end)+EnergyMATRIX_T3_PlantLevel(:,5:end)+EnergyMATRIX_T4_PlantLevel(:,5:end)];

% Computing Full Plant Level EnergyMATRIX_Weather_FullPlant from EnergyMATRIX_Weather_T_PlantLevel

EnergyMATRIX_Weather_FullPlant = [DateTime_Stamp_WeatherFile, (EnergyMATRIX_Weather_T1_PlantLevel(:,5:(5+(OtherVariables_Col-2)))+EnergyMATRIX_Weather_T2_PlantLevel(:,5:(5+(OtherVariables_Col-2)))+EnergyMATRIX_Weather_T3_PlantLevel(:,5:(5+(OtherVariables_Col-2)))+EnergyMATRIX_Weather_T4_PlantLevel(:,5:(5+(OtherVariables_Col-2))))/(WG_TurbineType_Total) , (EnergyMATRIX_Weather_T1_PlantLevel(:,(end-1):end)+EnergyMATRIX_Weather_T2_PlantLevel(:,(end-1):end)+EnergyMATRIX_Weather_T3_PlantLevel(:,(end-1):end)+EnergyMATRIX_Weather_T4_PlantLevel(:,(end-1):end))];

%% Creating Output Excel Files

% Creating Appropriate Header for Relevant Files

Headers_EnergyMATRIX={'Day','Month','Year','Time','WTGEnergyOut','WTGPowerGridEnergy','WTGOhmicLossEnergy','WTGTransLossEnergy'};

Headers_EnergyMATRIX_Weather={'Day','Month','Year','Time','WindSpeed','Temperature','WindDirection','TurbineStatus','WTGEnergyOut'};

% Creating Excel Files at WTG Type Level

if (T1==1) % WTG Type 1 is Present
    
    % Creating EnergyMATRIX_T Excel File
    
    [r,c,z]=size(EnergyMATRIX_T1); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_T1_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T1(:,:,i),sheet,xlRange);                 
        
    end
    
    % Creating EnergyMATRIX_T_PlantLevel Excel File
    
    [r,c,z]=size(EnergyMATRIX_T1_PlantLevel); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_T1_PlantLevel_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T1_PlantLevel(:,:,i),sheet,xlRange);         
        
    end    
    
    % Creating EnergyMATRIX_Weather_T Excel File
    
    [r,c,z]=size(EnergyMATRIX_Weather_T1); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_Weather_T1_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX_Weather,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_Weather_T1(:,:,i),sheet,xlRange);         
        
    end    
    
    % Creating EnergyMATRIX_Weather_T_PlantLevel Excel File
    
    [r,c,z]=size(EnergyMATRIX_Weather_T1_PlantLevel); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_Weather_T1_PlantLevel_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX_Weather,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_Weather_T1_PlantLevel(:,:,i),sheet,xlRange);         
        
    end        
    
end

if (T2==1) % WTG Type 2 is Present
    
    % Creating EnergyMATRIX_T Excel File
    
    [r,c,z]=size(EnergyMATRIX_T2); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_T2_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T2(:,:,i),sheet,xlRange);                 
        
    end   
    
    % Creating EnergyMATRIX_T_PlantLevel Excel File
    
    [r,c,z]=size(EnergyMATRIX_T2_PlantLevel); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_T2_PlantLevel_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T2_PlantLevel(:,:,i),sheet,xlRange);         
        
    end      
    
    % Creating EnergyMATRIX_Weather_T Excel File
    
    [r,c,z]=size(EnergyMATRIX_Weather_T2); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_Weather_T2_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX_Weather,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_Weather_T2(:,:,i),sheet,xlRange);         
        
    end  
    
    % Creating EnergyMATRIX_Weather_T_PlantLevel Excel File
    
    [r,c,z]=size(EnergyMATRIX_Weather_T2_PlantLevel); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_Weather_T2_PlantLevel_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX_Weather,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_Weather_T2_PlantLevel(:,:,i),sheet,xlRange);         
        
    end       
    
end

if (T3==1) % WTG Type 3 is Present
    
    % Creating EnergyMATRIX_T Excel File
    
    [r,c,z]=size(EnergyMATRIX_T3); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_T3_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T3(:,:,i),sheet,xlRange);                 
        
    end 
    
    % Creating EnergyMATRIX_T_PlantLevel Excel File
    
    [r,c,z]=size(EnergyMATRIX_T3_PlantLevel); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_T3_PlantLevel_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T3_PlantLevel(:,:,i),sheet,xlRange);         
        
    end 
    
    % Creating EnergyMATRIX_Weather_T Excel File
    
    [r,c,z]=size(EnergyMATRIX_Weather_T3); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_Weather_T3_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX_Weather,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_Weather_T3(:,:,i),sheet,xlRange);         
        
    end        
    
    % Creating EnergyMATRIX_Weather_T_PlantLevel Excel File
    
    [r,c,z]=size(EnergyMATRIX_Weather_T3_PlantLevel); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_Weather_T3_PlantLevel_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX_Weather,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_Weather_T3_PlantLevel(:,:,i),sheet,xlRange);         
        
    end       
    
end

if (T4==1) % WTG Type 4 is Present
    
    % Creating EnergyMATRIX_T Excel File
    
    [r,c,z]=size(EnergyMATRIX_T4); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_T4_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T4(:,:,i),sheet,xlRange);                 
        
    end  
    
    % Creating EnergyMATRIX_T_PlantLevel Excel File
    
    [r,c,z]=size(EnergyMATRIX_T4_PlantLevel); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_T4_PlantLevel_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T4_PlantLevel(:,:,i),sheet,xlRange);         
        
    end  
    
    % Creating EnergyMATRIX_Weather_T Excel File
    
    [r,c,z]=size(EnergyMATRIX_Weather_T4); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_Weather_T4_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX_Weather,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_Weather_T4(:,:,i),sheet,xlRange);         
        
    end        
    
    % Creating EnergyMATRIX_Weather_T_PlantLevel Excel File
    
    [r,c,z]=size(EnergyMATRIX_Weather_T4_PlantLevel); % Getting Size of the Energy Data Matrix
    
    for i=1:z % For Each 2-D Data Matrix
        
       filename = [PrjName,'_EnergyMatrix_Weather_T4_PlantLevel_IntraDay_File.xlsx'];
       
       sheet = i;

       xlRange = 'A1';

       xlswrite(filename,Headers_EnergyMATRIX_Weather,sheet,xlRange);        

       sheet = i;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_Weather_T4_PlantLevel(:,:,i),sheet,xlRange);         
        
    end       
    
end

% Creating EnergyMATRIX_FullPlant

   filename = [PrjName,'_EnergyMatrix_FullPlant_IntraDay_File.xlsx'];

   sheet = 1;

   xlRange = 'A1';

   xlswrite(filename,Headers_EnergyMATRIX,sheet,xlRange);        

   sheet = 1;

   xlRange = 'A2';

   xlswrite(filename,EnergyMATRIX_FullPlant(:,:),sheet,xlRange);  

% Creating EnergyMATRIX_Weather_FullPlant

   filename = [PrjName,'_EnergyMatrix_Weather_FullPlant_IntraDay_File.xlsx'];

   sheet = 1;

   xlRange = 'A1';

   xlswrite(filename,Headers_EnergyMATRIX_Weather,sheet,xlRange);        

   sheet = 1;

   xlRange = 'A2';

   xlswrite(filename,EnergyMATRIX_Weather_FullPlant(:,:),sheet,xlRange); 

end

