function [WTG_Generation] = WTGEnergySimulation_PointWise_NormalMode( WindSpeedMeasured, TemperatureMeasured, Hres,EnergyOrPower,AllParameters_Disintegrated_Cell,WindLossParameters,WTGGenCleanAlgorithm)

%% AllParameters 

% Disintegrating Cell AllParameters_Disintegrated

sub = AllParameters_Disintegrated_Cell{1,1};
subnum = AllParameters_Disintegrated_Cell{1,2};
HubHeight = AllParameters_Disintegrated_Cell{1,3};
PowerCurve = AllParameters_Disintegrated_Cell{1,4};
CutIn = AllParameters_Disintegrated_Cell{1,5};
RatedPower = AllParameters_Disintegrated_Cell{1,6};
CutOut = AllParameters_Disintegrated_Cell{1,7};
RotRad = AllParameters_Disintegrated_Cell{1,8};
Altitude = AllParameters_Disintegrated_Cell{1,9};

%% Computing Energy Converter and subnum_Total

EnergyConverter = (Hres/60);

subnum_Total=sum(subnum);

%% WindLossParameters

% Disintegrating Cell WindLossParameters

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

ActiveTurbines={0};

%% Computation of Point-Wise Wind Plant Energy and Power

% Computing Pressure [atm] at the Altitude of Location
[ Pressure ] = PressureAtHeight( Altitude );             
 
% Computing Effect of Hub-Height and Terrain on Wind Speed using external function              

if (~isempty(HeightAnemometer))

    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HeightAnemometer,HubHeight,Terrain );

else

    [ WindCorrected1 ] = HubHeight_Terrain_EffectOnWindSpeed( WindSpeedMeasured,HubHeight,HubHeight,Terrain );

end             

% Computing Wake Effect on Wind Speed

if (Wake2==1)

    if (Jensen==1)

        [ WindCorrected2 ] = JensenWakeEffect( a_J,RotRad,x_J,k_J, WindCorrected1 );

    elseif (Frandsen==1)

        [ WindCorrected2 ] = FrandsenWakeEffect(a_F,RotRad,x_F,k_F,alpha, WindCorrected1 );

    end

else

    WindCorrected2=WindCorrected1;

end

% Computing Power Curve Point for the current instance

[ WTGPowerPoint ] = PowerCurvePoint_Capture(PowerCurve, WindCorrected2, CutIn, CutOut ) ;   

% Computing Corrected Power Curve Point due to effect of Air Density

[ DenNew ] = AirDensity( Pressure, TemperatureMeasured); % Corrected Air Density

[ WTGPowerPointCorrected ] = PowerCurveCorrection( WTGPowerPoint,DenSTC,DenNew );

% Computing Power Produced by Total Wind Turbines with effect of Performance Ratio and Active Wind Turbines according to WTGGenCleanAlgorithm

if ((WTGGenCleanAlgorithm==2)||(WTGGenCleanAlgorithm==3)) % Use CompOpt23    
    
    PlantStatus=1;
       
    [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt23_ForecastMode( WTGPowerPointCorrected, subnum_Total, Perf_Rat, Turbine_File, PR, PlantStatus  );        
  
   
elseif (WTGGenCleanAlgorithm==4) % Use CompOpt4
    
    PlantStatus=subnum_Total;
    
    [WTGPowerTotal, WTGPowerPR  ] = WTGPowerOutput_CompOpt4_ForecastMode( WTGPowerPointCorrected, subnum_Total, Perf_Rat, Turbine_File, PR, PlantStatus  );
    
end

% Computing Wind Turbine Power Losses and Power Supplied to the Grid

[WTGPower,WTGOhmicLossP,WTGTransLossP,WTGPowerGrid] = WTGPowerLoss(WTGPowerPR, OhmicLoss, TransLoss, Wake1, WakeLoss);

% Converting Power to Energy according to EnergyOrPower

if (EnergyOrPower==1) % Convert Power to Energy
    
    WTG_Generation=WTGPower*EnergyConverter;
    
elseif (EnergyOrPower==2) % Do not Convert Power to Energy
    
    WTG_Generation=WTGPower;
    
end

end





