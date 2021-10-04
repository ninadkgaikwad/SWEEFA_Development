function [ EnergySimulation_Status] = SolarPVEnergySimulation_ForecastMode( PrjName,Lat,Long,Alt,UTCTimeDiff,Pmod,PVTech,ModNum,ModTemCF,Tn,Gn,SF,LID,LS,Arraymismat,OhmicLoss,rho,TrackerL,INVeff,TransLoss,Uo,U1,Shading,bo,WeatherFile,OrientationType,OrientationParameters,HHres,PlantCapacity,DateTime_Index,SolarSimResults_FullPath,RegionalTimeMeridian);

%% Function Details

% PrjName = Name of the Solar Plant
% Lat = Local Latitutde of the Plant Site
% Long = Local Longitude of the Plant Site
% Alt = Altitude of the Plant Site
% UTCTimeDiff = Relative time difference between Regional time of plant and UTC in Decimal Hours 
% Pmod = Vector of Module Power
% PVTech = Vector of PVTech, if PVTech==1, then Module is Crystalline ; if PVTech==2, then Module is Thin Film
% ModNum = Vector of Total number of Modules in the plant per Module Type
% ModTemCF = Vector of Module Power Temerature Coeeficients [%/Deg]
% Tn = 25 Deg Celsius, Temperature at STC
% Gn = 1000 W/m^(2), Irradiance at STC
% SF = Soiling Loss in [%]
% LID = Light Induced Diffusion in [%]
% LS = Light Soaking Effect in [%]
% Arraymismat =
% OhmicLoss = System Loss in powe carrying cables in [%]
% rho = Albedo of the Site Surface
% TrackerL = Tracker System Loss in [%]
% INVeff = Efficiency of the Inverter in [%]
% TransLoss = Transformer Loss in [%]
% Uo = The constant heat transfer component in [W/m^(2)K]
% U1 = The convective heat transfer component in [W/m^(2)K]
% Shading = Shading Loss in [%]
% bo = Incidence Angle Loss Constant
% WeatherFile = The file consisting od D-M-Y-T-Ws-T-Ir-PlantStatus values
% OrientationType = Value giving the type of orientation used in the plant
% OrientationParameters = Vector of all the orientation parameters of the plant
% HHres = Simulation Resolution in [mins]
% PlantCapacity = Total Capacity of the plant in [kW]
% DateTime_Index = If DateTime_Index == 1, then The Date-Time Stamp in the Weather File is Regional Time based ; If DateTime_Index == 2, then the Date-Time Stamp in the Weather File is Solar/Local Time based
% SolarSimResults_FullPath = String of the Full Path where the output excel files will be stored

%% Pre-Processing the Input Data

% Computing the Size of the WeatherFile

[Row, Col]=size(WeatherFile);

% Dividing the Weather File into Dtate-Time Atamp and Other Variables

DateTime_Stamp_WeatherFile=WeatherFile(:,1:4);

OtherVariables=WeatherFile(:,5:end);

% Creating DateTime_Stamp_Regional (for Excel Files) and DateTime_Stamp_SolarLocal (for Energy Estimation) according to DateTime_Index

if (DateTime_Index==1) % DateTime_Stamp_WeatherFile is in Regional Time
    
    % Creating DateTime_Stamp_Regional
    
    DateTime_Stamp_Regional=DateTime_Stamp_WeatherFile;
    
    % Creating DateTime_Stamp_SolarLocal
    
    DateTime_Stamp_SolarLocal=DateTime_Stamp_RegionalSolar_Converter(DateTime_Stamp_WeatherFile, Lat, Long, RegionalTimeMeridian, UTCTimeDiff, DateTime_Index, HHres); % 1 indicates convert from Regional to Solar/Local DateTime
    
elseif (DateTime_Index==2) % DateTime_Stamp_WeatherFile is in Local/Solar Time
    
    % Creating DateTime_Stamp_Regional
    
    DateTime_Stamp_Regional=DateTime_Stamp_RegionalSolar_Converter(DateTime_Stamp_WeatherFile, Lat, Long, RegionalTimeMeridian, UTCTimeDiff, DateTime_Index, HHres); % 2 indicates convert from Solar/Local to Regional DateTime
    
    % Creating DateTime_Stamp_SolarLocal
    
    DateTime_Stamp_SolarLocal=DateTime_Stamp_WeatherFile;
    
end

% Dividing the OtherVariables into its Constituent Components

Ws=OtherVariables(:,1);

T=OtherVariables(:,2);

Ir=OtherVariables(:,3);

PlantStatus=OtherVariables(:,4);

% Dividing the OrientationParameters into its Constituent Components

tilt=OrientationParameters(1,1);
phic=OrientationParameters(1,2);
tiltsummer=OrientationParameters(1,3);
tiltwinter=OrientationParameters(1,4);
phicmax=OrientationParameters(1,5);
phicmin=OrientationParameters(1,6);
tiltmax=OrientationParameters(1,7);
tiltmin=OrientationParameters(1,8);

% PV Module Vectored Information from the User
LenPVmod=length(Pmod);
len1=length(PVTech);
len2=length(ModNum);
len3=length(ModTemCF);

if (LenPVmod~=len1)||(LenPVmod~=len2)||(LenPVmod~=len3)
    
    msgbox('Vectored Input lengths for PV Module Information not equal', 'Solar Energy Estimation Error Message');
    
end

%% Computing the Energy Data Holder and Energy Converter (Using DateTime_Stamp_Regional)

% Creating EnergyMATRIX - For holding the Estimated Energy

EnergyMATRIX=zeros(Row,15,len1); % Column Description: 4 = Date-Time Stamp and 11 = Computed Energy Variables

% Filling the EnergyMATRIX with DateTime_Stamp_Regional

for i=1:len1
    
   EnergyMATRIX(:,1:4,i)= DateTime_Stamp_Regional;
    
end

% Computing the Energy Converter

EnergyConverter=(HHres/60);

%% Solar Plant Energy Estimation (Using DateTime_Stamp_SolarLocal)

for i=1:len1 % For Each PV Technology
    
    for j=1:Row % For Each Date-Time Stamp
        
        % Getting D-M-Y-T from the DateTime_Stamp_SolarLocal
        
        Day=DateTime_Stamp_SolarLocal(j,1);
        Month=DateTime_Stamp_SolarLocal(j,2);
        Year=DateTime_Stamp_SolarLocal(j,3);
        Time=DateTime_Stamp_SolarLocal(j,4);
        
        % Computing Julian Day using External Function
        
        [n]=JulianDay(Day,Month,Year);
        
        % Computing Declination using External Function
        
        [ dec ] = Declination( n );
        
        % Computing Hour-Angle from Time using External Function
        
        ha=HourAngle(Time);
        
        % Computing the Sun Position using External Function
        
        [beta,phi]=AltiAzi(dec,Lat,ha);
        
        % Computing Ib, Id, C sing External Function
        
        [ Ib, Id,C] = BeamDiffGHI(n, Ir(j,1),beta ); % Computing Beam & Diffused Irradiance at given moment in the specified day
                
        % Selecting the Orientation Type Defined by the User

        if OrientationType==1 % Fixed Tilt

            [ Ic,Ibc,Idc,Irc,CosInciAngle ] = FixedTilt( Ib,Id,C,beta,phi,tilt,phic,rho);                      

        elseif OrientationType==2 % Seasonal Tilt

             [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SeasonalTilt( n,Lat,Ib,Id,C,beta,phi,tilt,tiltsummer,tiltwinter,phic,rho );                        

        elseif OrientationType==3 % Single Axis E-W Tracker

            [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SingleAxisEW(Ib,Id,C,beta,phi,phicmin,phicmax,tilt,rho );                     

        elseif OrientationType==4 % Single Axis N-S Tracker

            [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SingleAxisNS(Ib,Id,C,beta,phi,phic,tiltmin,tiltmax,rho );                        

        elseif OrientationType==5 % Double Axis Tracker

            [ Ic,Ibc,Idc,Irc,CosInciAngle ] = DoubleAxis( Ib,Id,C,phi,phicmin,phicmax,tiltmin,tiltmax,beta,rho  );                      

        end  
        
        % Computing Incidence Losses and Soiling Losses
                
        [ Iciam,Icsf ] = ArrayIncidenceLoss( Ic,CosInciAngle,bo,SF );
        
        % Computing Power from the PV Module due to Incident Radiation
                        
        [ Pmodtot,Pmodin,Tm]=ModulePower( Pmod(1,i),ModTemCF(1,i),ModNum(1,i),Tn,Gn,Icsf,T(j,1),Ic,Uo,U1,Ws(j,1) );
        
        % Computing Various Losses associated to PV Systems and the Energy at each Step of Conversion/Transfer
                
        [ PVout,INVpin,INVpout,Pgrid,ArrayMismatchLoss,ShadingLoss,LIDLoss,OhmicLossP,InverterLoss,TransformerLossP,TrackerLossP ] = PVoutputPower( Pmodtot, LID,LS,Arraymismat,PVTech(1,i),Shading, OhmicLoss,TrackerL,INVeff,TransLoss );
                        
        % Checking and correcting for NAN and Negative values

        if ((PVout<0)||(isnan(PVout))) % For PVout

            PVout=0;                   

        end

         if ((INVpin<0)||(isnan(INVpin))) % For INVpin

            INVpin=0;                   

         end     

         if ((INVpout<0)||(isnan(INVpout))) % For INVpout

            INVpout=0;                   

         end                 

         if ((Pgrid<0)||(isnan(Pgrid))) % For Pgrid

            Pgrid=0;                   

         end                    

         if ((ArrayMismatchLoss<0)||(isnan(ArrayMismatchLoss))) % For ArrayMismatchLoss

            ArrayMismatchLoss=0;                   

         end         

         if ((ShadingLoss<0)||(isnan(ShadingLoss))) % For ShadingLoss

            ShadingLoss=0;                   

         end              

         if ((LIDLoss<0)||(isnan(LIDLoss))) % For LIDLoss

            LIDLoss=0;                   

         end     

         if ((OhmicLossP<0)||(isnan(OhmicLossP))) % For OhmicLossP

            OhmicLossP=0;                   

         end          

         if ((InverterLoss<0)||(isnan(InverterLoss))) % For InverterLoss

            InverterLoss=0;                   

         end      

         if ((TransformerLossP<0)||(isnan(TransformerLossP))) % For TransformerLossP

            TransformerLossP=0;                   

         end  

         if ((TrackerLossP<0)||(isnan(TrackerLossP))) % For TrackerLossP

            TrackerLossP=0;                   

         end            

         % Filling the EnergyMATRIX
        
        EnergyMATRIX( j , 5, i)=PVout*EnergyConverter ;
        EnergyMATRIX( j, 6, i)=INVpin*EnergyConverter ;
        EnergyMATRIX( j, 7, i)=INVpout*EnergyConverter ;
        EnergyMATRIX( j, 8, i)=Pgrid*EnergyConverter ;
        EnergyMATRIX( j, 9, i)=ArrayMismatchLoss*EnergyConverter ;
        EnergyMATRIX( j, 10, i)=ShadingLoss*EnergyConverter ;
        EnergyMATRIX( j, 11, i)=LIDLoss*EnergyConverter ;
        EnergyMATRIX( j, 12, i)=OhmicLossP*EnergyConverter ;
        EnergyMATRIX( j, 13, i)=InverterLoss*EnergyConverter ;
        EnergyMATRIX( j, 14, i)=TrackerLossP*EnergyConverter ;
        EnergyMATRIX( j, 15, i)=TransformerLossP*EnergyConverter ;
        
    end
    
end

%% Computing EnergyMATRIX_PlantLevel

% Creating EnergyMATRIX_PlantLevel - For holding the Estimated Energy

EnergyMATRIX_PlantLevel=zeros(Row,15); % Column Description: 4 = Date-Time Stamp and 11 = Computed Energy Variables

% Putting Regional Date-Time Stamp in EnergyMATRIX_PlantLevel

EnergyMATRIX_PlantLevel(:,1:4)= DateTime_Stamp_Regional;

% Computing EnergyMATRIX_PlantLevel from EnergyMATRIX

for i=5:15  % For Each Eneargy Variable
    
    for j=1:Row % For Each Date-Time Stamp
        
       for k=1:len1 % For Each PV Technology
           
           EnergyMATRIX_PlantLevel(j,i)=EnergyMATRIX_PlantLevel(j,i)+EnergyMATRIX(j,i,k);
           
       end
        
    end
    
end

%% Creating EnergyMATRIX_Plantlevel_Forecasted

% Computing the Energy as affected by PlantStatus

EnergyGrid_Forecasted=EnergyMATRIX_PlantLevel(:,8).*PlantStatus;

EnergyMATRIX_Plantlevel_Forecasted=[DateTime_Stamp_Regional,OtherVariables,EnergyGrid_Forecasted];

%% Creating Data Excel Files

HorizontalExcelIntraDay_Energy={'Day','Month','Year','Time','PVoutEnergy','INVpinEnergy','INVpoutEnergy','PgridEnergy','ArrayMismatchLossEnergy','ShadingLossEnergy','LIDLossEnergy','OhmicLossPEnergy','InverterLossEnergy','TrackerLossEnergy','TransformerLossPEnergy'};
 
HorizontalExcelIntraDay_Forecast={'Day','Month','Year','Time','WindSpeed','Temperature','Irradiance','PlantStatus','PgridEnergy'};

% Creating Excel Files from EnergyMATRIX Intra-Day Values

for m=1:len1

   filename = [PrjName,'_PVPlantEnergy_PVTechWise_IntraDay_File.xlsx'];

   sheet = m;

   xlRange = 'A1';

   xlswrite(filename,HorizontalExcelIntraDay_Energy,sheet,xlRange);       

   sheet = m;

   xlRange = 'A2';

   xlswrite(filename,EnergyMATRIX(:,:,m),sheet,xlRange); 

end

% Creating Excel Files from EnergyMATRIX_PlantLevel Intra-Day Values

filename = [PrjName,'_PVPlantEnergy_Complete_IntraDay_File.xlsx'];

sheet = m;

xlRange = 'A1';

xlswrite(filename,HorizontalExcelIntraDay_Energy,sheet,xlRange);       

sheet = m;

xlRange = 'A2';

xlswrite(filename,EnergyMATRIX_PlantLevel,sheet,xlRange); 

% Creating Excel Files from EnergyMATRIX_PlantLevel Intra-Day Values

filename = [PrjName,'_PVPlantEnergy_Complete_ForecastResult_IntraDay_File.xlsx'];

sheet = m;

xlRange = 'A1';

xlswrite(filename,HorizontalExcelIntraDay_Forecast,sheet,xlRange);       

sheet = m;

xlRange = 'A2';

xlswrite(filename,EnergyMATRIX_Plantlevel_Forecasted,sheet,xlRange); 

end

