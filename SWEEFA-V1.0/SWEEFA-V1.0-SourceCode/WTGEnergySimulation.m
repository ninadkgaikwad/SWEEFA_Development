function [TotalWTGOut,TotalWTGPGrid,TotalWTGOhmicLoss,TotalWTGTransLoss,MonthWTGOut,MonthWTGPGrid,MonthWTGOhmicLoss,MonthWTGTransLoss] = WTGEnergySimulation( SimParameters,AllParameters,WindLossParameters )

%% AllParameters 

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

% Disintegrating Parameters_T1

sub_T1=Parameters_T1{1,1} ;
subnum_T1=Parameters_T1{1,2} ;
hub_T1=Parameters_T1{1,3} ;
Power_T1=Parameters_T1{1,4} ;
cutin_T1=Parameters_T1{1,5} ;
rated_T1=Parameters_T1{1,6} ;
cutout_T1=Parameters_T1{1,7} ;
rotrad_T1=Parameters_T1{1,8} ;

% Disintegrating Parameters_T2

sub_T2=Parameters_T2{1,1} ;
subnum_T2=Parameters_T2{1,2} ;
hub_T2=Parameters_T2{1,3} ;
Power_T2=Parameters_T2{1,4} ;
cutin_T2=Parameters_T2{1,5} ;
rated_T2=Parameters_T2{1,6} ;
cutout_T2=Parameters_T2{1,7} ;
rotrad_T2=Parameters_T2{1,8} ;

% Disintegrating Parameters_T3

sub_T3=Parameters_T3{1,1} ;
subnum_T3=Parameters_T3{1,2} ;
hub_T3=Parameters_T3{1,3} ;
Power_T3=Parameters_T3{1,4} ;
cutin_T3=Parameters_T3{1,5} ;
rated_T3=Parameters_T3{1,6} ;
cutout_T3=Parameters_T3{1,7} ;
rotrad_T3=Parameters_T3{1,8} ;

% Disintegrating Parameters_T4

sub_T4=Parameters_T4{1,1} ;
subnum_T4=Parameters_T4{1,2} ;
hub_T4=Parameters_T4{1,3} ;
Power_T4=Parameters_T4{1,4} ;
cutin_T4=Parameters_T4{1,5} ;
rated_T4=Parameters_T4{1,6} ;
cutout_T4=Parameters_T4{1,7} ;
rotrad_T4=Parameters_T4{1,8} ;

%% SimParameters

% Disintegrating Cell SimParameters

PrjName=SimParameters{1,1} ;
PlantCapacity=SimParameters{1,2} ;
Lat=SimParameters{1,3} ;
Long=SimParameters{1,4} ;
Altitude=SimParameters{1,5} ;
lpy=SimParameters{1,6} ;
nolpy=SimParameters{1,7} ;
StartMonth=SimParameters{1,8} ;
StartDay=SimParameters{1,9} ;
EndMonth=SimParameters{1,10} ;
EndDay=SimParameters{1,11} ;
StartYear=SimParameters{1,12} ;
Res=SimParameters{1,13} ;
Sim1=SimParameters{1,14} ;
Sim2=SimParameters{1,15} ;
Temp=SimParameters{1,16} ;
WS=SimParameters{1,17} ;

%% WindLossParameters

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

ActiveTurbines_T1=ActiveTurbines;
%ActiveTurbines_T2=ActiveTurbines{1,2};
%ActiveTurbines_T3=ActiveTurbines{1,3};
%ActiveTurbines_T4=ActiveTurbines{1,4};

%% Computing Total Days for Simulation and EnergyConverter

% Leap Year Information from User
LeapYear=lpy;

if LeapYear==1
yeardays=366;
elseif LeapYear==0
yeardays=365;
end

% Computing Total Number of Days to be simulated from user input
[StartD,EndD]=DaysToCompute( LeapYear,StartDay,StartMonth,EndDay,EndMonth );

n=StartD:EndD; % Day Number Vector for Simulation

TotDays=length(n); % Computing Total Simulation Days

% Latitude Information from the User
L=Lat;

% Simulation temporal Resolution Information from the User
HHres=Res;

EnergyConverter=(HHres/60);

%% Number of SubModels of Each WTG Type

Len_T1=sub_T1;
Len_T2=sub_T2;
Len_T3=sub_T3;
Len_T4=sub_T4;

LenWTG=[Len_T1,Len_T2,Len_T3,Len_T4];

%% Getting Hourly Temperature and Wind Speed Files 

T=Temp; % Hourly Indexed Vector

Ws=WS; % Hourly Indexxed Vector

%% Initializing Computed Power and Power Loss Vectors

% For WTG1

WTGoutPower_T1=zeros(sub_T1,yeardays);
PgridPower_T1=zeros(sub_T1,yeardays);
OhmicLossPPower_T1=zeros(sub_T1,yeardays);
TransformerLossPPower_T1=zeros(sub_T1,yeardays);

WTGOutEnergy_T1=zeros(sub_T1,yeardays);
WTGPowerGridEnergy_T1=zeros(sub_T1,yeardays);
WTGOhmicLossEnergy_T1=zeros(sub_T1,yeardays);
WTGTransLossEnergy_T1=zeros(sub_T1,yeardays);

% For WTG2

WTGoutPower_T2=zeros(sub_T2,yeardays);
PgridPower_T2=zeros(sub_T2,yeardays);
OhmicLossPPower_T2=zeros(sub_T2,yeardays);
TransformerLossPPower_T2=zeros(sub_T2,yeardays);

WTGOutEnergy_T2=zeros(sub_T2,yeardays);
WTGPowerGridEnergy_T2=zeros(sub_T2,yeardays);
WTGOhmicLossEnergy_T2=zeros(sub_T2,yeardays);
WTGTransLossEnergy_T2=zeros(sub_T2,yeardays);

% For WTG3

WTGoutPower_T3=zeros(sub_T3,yeardays);
PgridPower_T3=zeros(sub_T3,yeardays);
OhmicLossPPower_T3=zeros(sub_T3,yeardays);
TransformerLossPPower_T3=zeros(sub_T3,yeardays);

WTGOutEnergy_T3=zeros(sub_T3,yeardays);
WTGPowerGridEnergy_T3=zeros(sub_T3,yeardays);
WTGOhmicLossEnergy_T3=zeros(sub_T3,yeardays);
WTGTransLossEnergy_T3=zeros(sub_T3,yeardays);

% For WTG4

WTGoutPower_T4=zeros(sub_T4,yeardays);
PgridPower_T4=zeros(sub_T4,yeardays);
OhmicLossPPower_T4=zeros(sub_T4,yeardays);
TransformerLossPPower_T4=zeros(sub_T4,yeardays);

WTGOutEnergy_T4=zeros(sub_T4,yeardays);
WTGPowerGridEnergy_T4=zeros(sub_T4,yeardays);
WTGOhmicLossEnergy_T4=zeros(sub_T4,yeardays);
WTGTransLossEnergy_T4=zeros(sub_T4,yeardays);

%% Initializing Energy Matrices

% Creating EnergyMatrix for storing Intra-Day Energy Values to create an EXCEL File 

[ EnergyMatrix,TotDataPoints,Time] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,HHres,4 );

% WTG1

EnergyMATRIX_T1=zeros(TotDataPoints,8,Len_T1);

% WTG2

EnergyMATRIX_T2=zeros(TotDataPoints,8,Len_T2);

% WTG3

EnergyMATRIX_T3=zeros(TotDataPoints,8,Len_T3);

% WTG4

EnergyMATRIX_T4=zeros(TotDataPoints,8,Len_T4);

%% Length of Weather Files

LenYearlyResFile=24*(60/HHres)*yeardays;

LenYearlyResFileReq=length(n)*24*(60/HHres);

%% Indicators for getting correct Indices of Weather File

if (StartMonth~=1)&&(n(1,1)~=1)
    
    % Initializing Indicator for getting Correct Index for the T, WS, GhiInsoFile
    
    IndexIndi=1;
    
else
    
    % Initializing Indicator for getting Correct Index for the T, WS, GhiInsoFile
    
    IndexIndi=0;
    
end

% Computing Pressure [atm] at the Altitude of Location
[ Pressure ] = PressureAtHeight( Altitude );

%% WTG Level Simulation

%% WTG1

if (T1==1)
    
  % WTG Sub-Model Level Simulation
  
  for i=1:Len_T1
      
        DayCounter=0; % Initializing Day Counter
        
        % Creating EnergyMATRIX for current PV Technology to create an EXCEL File        
        
        EnergyMATRIX_T1(:,:,i)=EnergyMatrix; % Initializing Correct Dates in EnergyMATRIX

        %Day Level Simulation    
        
        for j=n
            
            DayCounter=DayCounter+1; % Incrementing Day Counter
            
            DayLen=24*(60/Res); % For Computing Wind Energy within the n^(th) day
            
            hp=0:1/(60/Res):(24-1/(60/Res)); % Time Signature
            
            % User Defined Time-Step Level Simulation
            
            for k=1:DayLen
                
                % Computing Power from the PV Module due to Incident Radiation
                
                if IndexIndi==0               
                                   
                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  
                   
                elseif IndexIndi==1                    
                   
                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  
                                         
                end                
                
                % Correct WindSpeed and Temperature Values
                
                WindSpeedMeasured=Ws(hi,1);
                
                TemperatureMeasured=T(hi,1);
                
                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                
                
                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T1(1,i),Terrain );
                
                % Computing Wake Effect on Wind Speed
                
                if (Wake2==1)
                    
                    if (Jensen==1)
                        
                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T1(1,i),x_J,k_J, WindCorrected1 );
                        
                    elseif (Frandsen==1)
                        
                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T1(1,i),x_F,k_F,alpha, WindCorrected1 );
                        
                    end
                    
                else
                    
                    WindCorrected2=WindCorrected1;
                    
                end
                
                % Computing Power Curve Point for the current instance
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T1{1,i}, WindCorrected2, cutin_T1(1,i), cutout_T1(1,i) ) ;   
                  
                % Computing Corrected Power Curve Point due to effect of Air Density
                
                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density
                
                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );
                
                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines
                
                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput( WTGPowerPointCorrected, subnum_T1(1,i), Perf_Rat, Turbine_File, PR, ActiveTurbines_T1, hi  );
                
                % Computing Wind Turbine Power Losses and Power Supplied to the Grid
                
                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);
                
                % Filling the EnergyMATRIX
                
                [II]= ResFileIndex(DayCounter,hp(1,k),HHres); % Computing Correct Row Index for placing Intr-Day Energy Values
                
                EnergyMATRIX_T1( II , 5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T1( II, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T1( II, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T1( II, 8, i)=WTGTransLossP*EnergyConverter ;

                % Summing Up Power Losses and Power Available at various Stages of Conversion/Transfer
                
                WTGoutPower_T1(i,j)=WTGoutPower_T1(i,j)+WTGPower;
                PgridPower_T1(i,j)=PgridPower_T1(i,j)+WTGPowerGrid;
                OhmicLossPPower_T1(i,j)=OhmicLossPPower_T1(i,j)+WTGOhmicLossP;
                TransformerLossPPower_T1(i,j)=TransformerLossPPower_T1(i,j)+WTGTransLossP;

            end
            
            
        end
      
      
  end
  
  WTGOutEnergy_T1=WTGoutPower_T1*EnergyConverter;
  WTGPowerGridEnergy_T1=PgridPower_T1*EnergyConverter;
  WTGOhmicLossEnergy_T1=OhmicLossPPower_T1*EnergyConverter;
  WTGTransLossEnergy_T1=TransformerLossPPower_T1*EnergyConverter;

  

end

%% WTG2

if (T2==1)
  % WTG Sub-Model Level Simulation
  
  for i=1:Len_T2
      
        DayCounter=0; % Initializing Day Counter
        
        % Creating EnergyMATRIX for current PV Technology to create an EXCEL File        
        
        EnergyMATRIX_T2(:,:,i)=EnergyMatrix; % Initializing Correct Dates in EnergyMATRIX

        %Day Level Simulation    
        
        for j=n
            
            DayCounter=DayCounter+1; % Incrementing Day Counter
            
            DayLen=24*(60/Res); % For Computing Wind Energy within the n^(th) day
            
            hp=0:1/(60/Res):(24-1/(60/Res)); % Time Signature
            
            % User Defined Time-Step Level Simulation
            
            for k=1:DayLen
                
                % Computing Power from the PV Module due to Incident Radiation
                
                if IndexIndi==0               
                                   
                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  
                   
                elseif IndexIndi==1                    
                   
                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  
                                         
                end                
                
                % Correct WindSpeed and Temperature Values
                
                WindSpeedMeasured=Ws(hi,1);
                
                TemperatureMeasured=T(hi,1);
                
                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                
                
                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T2(1,i),Terrain );
                
                % Computing Wake Effect on Wind Speed
                
                if (Wake2==1)
                    
                    if (Jensen==1)
                        
                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T2(1,i),x_J,k_J, WindCorrected1 );
                        
                    elseif (Frandsen==1)
                        
                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T2(1,i),x_F,k_F,alpha, WindCorrected1 );
                        
                    end
                    
                else
                    
                    WindCorrected2=WindCorrected1;
                    
                end
                
                % Computing Power Curve Point for the current instance
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T2{1,i}, WindCorrected2, cutin_T2(1,i), cutout_T2(1,i) ) ;   
                  
                % Computing Corrected Power Curve Point due to effect of Air Density
                
                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density
                
                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );
                
                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines
                
                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput( WTGPowerPointCorrected, subnum_T2(1,i), Perf_Rat, Turbine_File, PR, ActiveTurbines_T2{1,i}, hi  );
                
                % Computing Wind Turbine Power Losses and Power Supplied to the Grid
                
                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);
                
                % Filling the EnergyMATRIX
                
                [II]= ResFileIndex(DayCounter,hp(1,k),HHres); % Computing Correct Row Index for placing Intr-Day Energy Values
                
                EnergyMATRIX_T2( II , 5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T2( II, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T2( II, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T2( II, 8, i)=WTGTransLossP*EnergyConverter ;

                % Summing Up Power Losses and Power Available at various Stages of Conversion/Transfer
                
                WTGoutPower_T2(i,j)=WTGoutPower_T2(i,j)+WTGPower;
                PgridPower_T2(i,j)=PgridPower_T2(i,j)+WTGPowerGrid;
                OhmicLossPPower_T2(i,j)=OhmicLossPPower_T2(i,j)+WTGOhmicLossP;
                TransformerLossPPower_T2(i,j)=TransformerLossPPower_T2(i,j)+WTGTransLossP;

            end
            
            
        end
      
      
  end
  
  WTGOutEnergy_T2=WTGoutPower_T2*EnergyConverter;
  WTGPowerGridEnergy_T2=PgridPower_T2*EnergyConverter;
  WTGOhmicLossEnergy_T2=OhmicLossPPower_T2*EnergyConverter;
  WTGTransLossEnergy_T2=TransformerLossPPower_T2*EnergyConverter;    
    
  
  
end

%% WTG3

if (T3==1)
  % WTG Sub-Model Level Simulation
  
  for i=1:Len_T3
      
        DayCounter=0; % Initializing Day Counter
        
        % Creating EnergyMATRIX for current PV Technology to create an EXCEL File        
        
        EnergyMATRIX_T3(:,:,i)=EnergyMatrix; % Initializing Correct Dates in EnergyMATRIX

        %Day Level Simulation    
        
        for j=n
            
            DayCounter=DayCounter+1; % Incrementing Day Counter
            
            DayLen=24*(60/Res); % For Computing Wind Energy within the n^(th) day
            
            hp=0:1/(60/Res):(24-1/(60/Res)); % Time Signature
            
            % User Defined Time-Step Level Simulation
            
            for k=1:DayLen
                
                % Computing Power from the PV Module due to Incident Radiation
                
                if IndexIndi==0               
                                   
                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  
                   
                elseif IndexIndi==1                    
                   
                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  
                                         
                end                
                
                % Correct WindSpeed and Temperature Values
                
                WindSpeedMeasured=Ws(hi,1);
                
                TemperatureMeasured=T(hi,1);
                
                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                
                
                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T3(1,i),Terrain );
                
                % Computing Wake Effect on Wind Speed
                
                if (Wake2==1)
                    
                    if (Jensen==1)
                        
                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T3(1,i),x_J,k_J, WindCorrected1 );
                        
                    elseif (Frandsen==1)
                        
                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T3(1,i),x_F,k_F,alpha, WindCorrected1 );
                        
                    end
                    
                else
                    
                    WindCorrected2=WindCorrected1;
                    
                end
                
                % Computing Power Curve Point for the current instance
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T3{1,i}, WindCorrected2, cutin_T3(1,i), cutout_T3(1,i) ) ;   
                  
                % Computing Corrected Power Curve Point due to effect of Air Density
                
                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density
                
                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );
                
                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines
                
                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput( WTGPowerPointCorrected, subnum_T3(1,i), Perf_Rat, Turbine_File, PR, ActiveTurbines_T3{1,i}, hi  );
                
                % Computing Wind Turbine Power Losses and Power Supplied to the Grid
                
                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);
                
                % Filling the EnergyMATRIX
                
                [II]= ResFileIndex(DayCounter,hp(1,k),HHres); % Computing Correct Row Index for placing Intr-Day Energy Values
                
                EnergyMATRIX_T3( II , 5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T3( II, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T3( II, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T3( II, 8, i)=WTGTransLossP*EnergyConverter ;

                % Summing Up Power Losses and Power Available at various Stages of Conversion/Transfer
                
                WTGoutPower_T3(i,j)=WTGoutPower_T3(i,j)+WTGPower;
                PgridPower_T3(i,j)=PgridPower_T3(i,j)+WTGPowerGrid;
                OhmicLossPPower_T3(i,j)=OhmicLossPPower_T3(i,j)+WTGOhmicLossP;
                TransformerLossPPower_T3(i,j)=TransformerLossPPower_T3(i,j)+WTGTransLossP;

            end
            
            
        end
      
      
  end
  
  WTGOutEnergy_T3=WTGoutPower_T3*EnergyConverter;
  WTGPowerGridEnergy_T3=PgridPower_T3*EnergyConverter;
  WTGOhmicLossEnergy_T3=OhmicLossPPower_T3*EnergyConverter;
  WTGTransLossEnergy_T3=TransformerLossPPower_T3*EnergyConverter;    
    
  
  
end

%% WTG4

if (T4==1)
  % WTG Sub-Model Level Simulation
  
  for i=1:Len_T4
      
        DayCounter=0; % Initializing Day Counter
        
        % Creating EnergyMATRIX for current PV Technology to create an EXCEL File        
        
        EnergyMATRIX_T4(:,:,i)=EnergyMatrix; % Initializing Correct Dates in EnergyMATRIX

        %Day Level Simulation    
        
        for j=n
            
            DayCounter=DayCounter+1; % Incrementing Day Counter
            
            DayLen=24*(60/Res); % For Computing Wind Energy within the n^(th) day
            
            hp=0:1/(60/Res):(24-1/(60/Res)); % Time Signature
            
            % User Defined Time-Step Level Simulation
            
            for k=1:DayLen
                
                % Computing Power from the PV Module due to Incident Radiation
                
                if IndexIndi==0               
                                   
                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  
                   
                elseif IndexIndi==1                    
                   
                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  
                                         
                end                
                
                % Correct WindSpeed and Temperature Values
                
                WindSpeedMeasured=Ws(hi,1);
                
                TemperatureMeasured=T(hi,1);
                
                % Computing Effect of Hub-Height and Terrain on Wind Speed using external function                
                
                [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,hub_T4(1,i),Terrain );
                
                % Computing Wake Effect on Wind Speed
                
                if (Wake2==1)
                    
                    if (Jensen==1)
                        
                        [ WindCorrected2 ] = JensenWakeEffect( a_J,rotrad_T4(1,i),x_J,k_J, WindCorrected1 );
                        
                    elseif (Frandsen==1)
                        
                        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,rotrad_T4(1,i),x_F,k_F,alpha, WindCorrected1 );
                        
                    end
                    
                else
                    
                    WindCorrected2=WindCorrected1;
                    
                end
                
                % Computing Power Curve Point for the current instance
                
                [ WTGPowerPoint ] = PowerCurvePoint_Capture(Power_T4{1,i}, WindCorrected2, cutin_T4(1,i), cutout_T4(1,i) ) ;   
                  
                % Computing Corrected Power Curve Point due to effect of Air Density
                
                [ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density
                
                [ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );
                
                % Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines
                
                [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput( WTGPowerPointCorrected, subnum_T4(1,i), Perf_Rat, Turbine_File, PR, ActiveTurbines_T4{1,i}, hi  );
                
                % Computing Wind Turbine Power Losses and Power Supplied to the Grid
                
                [WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);
                
                % Filling the EnergyMATRIX
                
                [II]= ResFileIndex(DayCounter,hp(1,k),HHres); % Computing Correct Row Index for placing Intr-Day Energy Values
                
                EnergyMATRIX_T4( II , 5, i)=WTGPower*EnergyConverter ;
                EnergyMATRIX_T4( II, 6, i)=WTGPowerGrid*EnergyConverter ;
                EnergyMATRIX_T4( II, 7, i)=WTGOhmicLossP*EnergyConverter ;
                EnergyMATRIX_T4( II, 8, i)=WTGTransLossP*EnergyConverter ;

                % Summing Up Power Losses and Power Available at various Stages of Conversion/Transfer
                
                WTGoutPower_T4(i,j)=WTGoutPower_T4(i,j)+WTGPower;
                PgridPower_T4(i,j)=PgridPower_T4(i,j)+WTGPowerGrid;
                OhmicLossPPower_T4(i,j)=OhmicLossPPower_T4(i,j)+WTGOhmicLossP;
                TransformerLossPPower_T4(i,j)=TransformerLossPPower_T4(i,j)+WTGTransLossP;

            end
            
            
        end
      
      
  end
  
  WTGOutEnergy_T4=WTGoutPower_T4*EnergyConverter;
  WTGPowerGridEnergy_T4=PgridPower_T4*EnergyConverter;
  WTGOhmicLossEnergy_T4=OhmicLossPPower_T4*EnergyConverter;
  WTGTransLossEnergy_T4=TransformerLossPPower_T4*EnergyConverter;    
    
  
end

EnergyParameters_T1={WTGOutEnergy_T1,WTGPowerGridEnergy_T1,WTGOhmicLossEnergy_T1,WTGTransLossEnergy_T1};
EnergyParameters_T2={WTGOutEnergy_T2,WTGPowerGridEnergy_T2,WTGOhmicLossEnergy_T2,WTGTransLossEnergy_T2};
EnergyParameters_T3={WTGOutEnergy_T3,WTGPowerGridEnergy_T3,WTGOhmicLossEnergy_T3,WTGTransLossEnergy_T3};
EnergyParameters_T4={WTGOutEnergy_T4,WTGPowerGridEnergy_T4,WTGOhmicLossEnergy_T4,WTGTransLossEnergy_T4};

EnergyParametersAll={EnergyParameters_T1,EnergyParameters_T2,EnergyParameters_T3,EnergyParameters_T4};

[ EnergyTotCell,EnergyMonthWiseTotCell ] = WTGEnergyCalculator( EnergyParametersAll,LenWTG,yeardays );

% Total Energy For Given Simulation Period

TotalWTGOut=EnergyTotCell{1,1};  
TotalWTGPGrid=EnergyTotCell{1,2};
TotalWTGOhmicLoss=EnergyTotCell{1,3};
TotalWTGTransLoss=EnergyTotCell{1,4};

% Monthly Energy For Given Simulation Period

MonthWTGOut=EnergyMonthWiseTotCell{1,1};
MonthWTGPGrid=EnergyMonthWiseTotCell{1,2};
MonthWTGOhmicLoss=EnergyMonthWiseTotCell{1,3};
MonthWTGTransLoss=EnergyMonthWiseTotCell{1,4};

%% Excel File Creation

    HorizontalExcelIntraDay={'Day','Month','Year','Time','WTGOutEnergy','WTGPowerGridEnergy','WTGOhmicLossEnergy','WTGTransLossEnergy'};
    
    HorizontalExcelDay={'Day','Month','Year','WTGOutEnergy','WTGPowerGridEnergy','WTGOhmicLossEnergy','WTGTransLossEnergy'};

    HorizontalExcelMonth={'Month','Year','WTGOutEnergy','WTGPowerGridEnergy','WTGOhmicLossEnergy','WTGTransLossEnergy'};


% WTG1

if (T1==1)

    % Creating Excel Files from EnergyMATRIX Intra-Day Values
    
    for m=1:Len_T1
        
       filename = 'WindTurbinePlantEnergy(Type1)_IntraDay_File.xlsx';
       
       sheet = m;

       xlRange = 'A1';

       xlswrite(filename,HorizontalExcelIntraDay,sheet,xlRange); 

       sheet = m;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T1(:,:,m),sheet,xlRange); 
        
    end
    
    
    % Converting Intra-Day Files to Daily Files & Daily Files to Monthly Files
    
       for n=1:Len_T1
           
           [ ProcessedData1 ] = MINToDayDataCoverterApp( EnergyMATRIX_T1(:,:,n),4,HHres,ones(1,4) );
        
           filename = 'WindTurbinePlantEnergy(Type1)_Daily_File.xlsx';
           
           sheet = n;

           xlRange = 'A1';

           xlswrite(filename,HorizontalExcelDay,sheet,xlRange); 

           sheet = n;

           xlRange = 'A2';

           xlswrite(filename,ProcessedData1,sheet,xlRange); 
           
           [ ProcessedData2 ] = DayToMonthDataCoverterApp( ProcessedData1,4,ones(1,4) );
           
           filename = 'WindTurbinePlantEnergy(Type1)_Monthly_File.xlsx';
           
           sheet = n;

           xlRange = 'A1';

           xlswrite(filename,HorizontalExcelMonth,sheet,xlRange); 

           sheet = n;

           xlRange = 'A2';

           xlswrite(filename,ProcessedData2,sheet,xlRange);  
           
       end

end

% WTG2
if (T2==1)

    % Creating Excel Files from EnergyMATRIX Intra-Day Values
    
    for m=1:Len_T2
        
       filename = 'WindTurbinePlantEnergy(Type2)_IntraDay_File.xlsx';
       
       sheet = m;

       xlRange = 'A1';

       xlswrite(filename,HorizontalExcelIntraDay,sheet,xlRange);        

       sheet = m;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T2(:,:,m),sheet,xlRange); 
        
    end
    
    
    % Converting Intra-Day Files to Daily Files & Daily Files to Monthly Files
    
       for n=1:Len_T2
           
           [ ProcessedData1 ] = MINToDayDataCoverterApp( EnergyMATRIX_T2(:,:,n),4,HHres,ones(1,4) );
        
           filename = 'WindTurbinePlantEnergy(Type2)_Daily_File.xlsx';
           
           sheet = n;

           xlRange = 'A1';

           xlswrite(filename,HorizontalExcelDay,sheet,xlRange);            

           sheet = n;

           xlRange = 'A2';

           xlswrite(filename,ProcessedData1,sheet,xlRange); 
           
           [ ProcessedData2 ] = DayToMonthDataCoverterApp( ProcessedData1,4,ones(1,4) );
           
           filename = 'WindTurbinePlantEnergy(Type2)_Monthly_File.xlsx';
           
           sheet = n;

           xlRange = 'A1';

           xlswrite(filename,HorizontalExcelMonth,sheet,xlRange);            

           sheet = n;

           xlRange = 'A2';

           xlswrite(filename,ProcessedData2,sheet,xlRange);  
           
       end

end

% WTG3
if (T3==1)

    % Creating Excel Files from EnergyMATRIX Intra-Day Values
    
    for m=1:Len_T3
        
       filename = 'WindTurbinePlantEnergy(Type3)_IntraDay_File.xlsx';
       
       sheet = m;

       xlRange = 'A1';

       xlswrite(filename,HorizontalExcelIntraDay,sheet,xlRange);        

       sheet = m;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T3(:,:,m),sheet,xlRange); 
        
    end
    
    
    % Converting Intra-Day Files to Daily Files & Daily Files to Monthly Files
    
       for n=1:Len_T3
           
           [ ProcessedData1 ] = MINToDayDataCoverterApp( EnergyMATRIX_T3(:,:,n),4,HHres,ones(1,4) );
        
           filename = 'WindTurbinePlantEnergy(Type3)_Daily_File.xlsx';
           
           sheet = n;

           xlRange = 'A1';

           xlswrite(filename,HorizontalExcelDay,sheet,xlRange);            

           sheet = n;

           xlRange = 'A2';

           xlswrite(filename,ProcessedData1,sheet,xlRange); 
           
           [ ProcessedData2 ] = DayToMonthDataCoverterApp( ProcessedData1,4,ones(1,4) );
           
           filename = 'WindTurbinePlantEnergy(Type3)_Monthly_File.xlsx';
           
           sheet = n;

           xlRange = 'A1';

           xlswrite(filename,HorizontalExcelMonth,sheet,xlRange);            

           sheet = n;

           xlRange = 'A2';

           xlswrite(filename,ProcessedData2,sheet,xlRange);  
           
       end

end

%WTG4
if (T4==1)

    % Creating Excel Files from EnergyMATRIX Intra-Day Values
    
    for m=1:Len_T4
        
       filename = 'WindTurbinePlantEnergy(Type4)_IntraDay_File.xlsx';
       
       sheet = m;

       xlRange = 'A1';

       xlswrite(filename,HorizontalExcelIntraDay,sheet,xlRange);        

       sheet = m;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX_T4(:,:,m),sheet,xlRange); 
        
    end
    
    
    % Converting Intra-Day Files to Daily Files & Daily Files to Monthly Files
    
       for n=1:Len_T4
           
           [ ProcessedData1 ] = MINToDayDataCoverterApp( EnergyMATRIX_T4(:,:,n),4,HHres,ones(1,4) );
        
           filename = 'WindTurbinePlantEnergy(Type4)_Daily_File.xlsx';
           
           sheet = n;

           xlRange = 'A1';

           xlswrite(filename,HorizontalExcelDay,sheet,xlRange);            

           sheet = n;

           xlRange = 'A2';

           xlswrite(filename,ProcessedData1,sheet,xlRange); 
           
           [ ProcessedData2 ] = DayToMonthDataCoverterApp( ProcessedData1,4,ones(1,4) );
           
           filename = 'WindTurbinePlantEnergy(Type4)_Monthly_File.xlsx';
           
           sheet = n;

           xlRange = 'A1';

           xlswrite(filename,HorizontalExcelMonth,sheet,xlRange);            

           sheet = n;

           xlRange = 'A2';

           xlswrite(filename,ProcessedData2,sheet,xlRange);  
           
       end

end

%% Creating Master Excel Sheets    



%% Creating Standard DateTime Stamp Files



end

