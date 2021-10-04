function [ ProcessedData, PgridEnergy,Irradiance] = SolarPVEnergySimulationPointWiseSim1(ProcessedData,GenIrrad,WeatherFileHourlyOrRes,n,Index,Day,Col,Lat,Pmod,PVTech,ModNum,ModTemCF,SF,LID,LS,Arraymismat,OhmicLoss,rho,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,Years,RainSnowMonths,yr,mr,YearRain,MonthRain,HHres) 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Initializing Code for Setting Up Correct Day Environment

Res=HHres;

% Computing the DayDataPoints

DayDataPoints=24*(60/Res);

% Finding the SunRise and SunSet for the particular Day using Pre-defined Function

[~,~,~,~,Sr,Ss,~] = Sun1(n,Lat,Res);

% Computing the STARTING & ENDING ROW INDEX for the given DAY

Rstart=(DayDataPoints*(Day-1))+1;

Rend=Rstart+(DayDataPoints-1);

% Creating TIME & DATA COLUMN VECTORS between Sr and Ss as an INPUT to FITTING Function

TimeColumn=ProcessedData(Rstart:Rend,4); % Getting Complete Time Vector from ProcessedData Matrix

T1=find(TimeColumn>=Sr); % Getting Indices Greater Than Sr

T2=find(TimeColumn<=Ss); % Getting Indices Lesser Than Ss

T=intersect(T1,T2); % Getting Indices Between Sr and Ss

TT=T+(DayDataPoints*(Day-1)); % Correcting the Indices according to the Current Day

% Computing the Time Signatures/Correct Rows Asociated with the Zero/NaN Values in the Current Day

CorrectionRows=Index+(DayDataPoints*(Day-1));

% Corrected Indices for Generation/Irradiance Calculation

CorrectedIndex=intersect(CorrectionRows,TT);

CorrectedIndex=CorrectedIndex';

%% Computing Actual Generation/Irradiance

% Reference Temperature and Irradiance for PV Model Testing

Tn=25;

Gn=1000;

% Latitude Information from the User 
L=Lat;

% Simulation temporal Resolution Information from the User
HHres=HHres;

EnergyConverter=(HHres/60);

PVParaIndex=Col; % It is the Index of the PV Plant PV Technology Parameters Vector

% PV Module Vectored Information from the User
LenPVmod=length(Pmod);
len1=length(PVTech);
len2=length(ModNum);
len3=length(ModTemCF);

if (LenPVmod~=len1)||(LenPVmod~=len2)||(LenPVmod~=len3)
    
    error('Vectored Input lengths for PV Module Information not equal');
    
end

% Initializing Orientation Parameters Defined by the User

    tilt=OrientationParameters(1,1);
    phic=OrientationParameters(1,2);
    tiltsummer=OrientationParameters(1,3);
    tiltwinter=OrientationParameters(1,4);
    phicmax=OrientationParameters(1,5);
    phicmin=OrientationParameters(1,6);
    tiltmax=OrientationParameters(1,7);
    tiltmin=OrientationParameters(1,8);
    
% Getting Hourly Temperature and Wind Speed Files 

T=Temp; % Hourly Indexed Vector

Ws=WS; % Hourly Indexed Vector

% Initializing Computed Power and Power Loss Vectors

PVoutPower=zeros(1,1);
INVpinPower=zeros(1,1);
INVpoutPower=zeros(1,1);
PgridPower=zeros(1,1);
ArrayMismatchLossPower=zeros(1,1);
ShadingLossPower=zeros(1,1);
LIDLossPower=zeros(1,1);
OhmicLossPPower=zeros(1,1);
InverterLossPower=zeros(1,1);
TransformerLossPPower=zeros(1,1);

% Initializing Output Variables

PgridEnergy=0;
Irradiance=0;

%Computing PV Energy Evaluation in Accordance with the User-Defined Simulation Mode 
  
if GenIrrad(1,PVParaIndex)==1 % Data Column is Generation Data  
 
        %Day Level Simulation

        for jj=n
                                   
            d=Declination(n); % Calculating Declination
            
            for ii=CorrectedIndex
                
                % Finding Year and Month Values for the Current DataFile Row for ClearnessIndexDataCleaner
                
                Year=ProcessedData(ii,3);
                
                Month=ProcessedData(ii,2);
                
                Time=ProcessedData(ii,4);
                
                [ ClearIndex,DiffIndex] = ClearnessIndexDataCleaner( Year,Month,Years,RainSnowMonths,yr,mr,YearRain,MonthRain ); % Computing Clearness Index and Diffused Index for the given Rain data 
                
                % Computation for Generation/Irradiance

                ha=HourAngle(Time); % Calculating Hour Angle

                [beta,phi]=AltiAzi(d,L,ha);
               

                    if beta<0

                        beta=0; % Assigning negative beta values zero for computational coherence

                    end

                           
                % User Defined Time-Step Level Simulation                

                    [ Ib, Id ,C] = BeamDiffModelClearIndex( n,beta,ClearIndex,DiffIndex ); % Computing Beam & Diffused Irradiance at given moment in the specified day

                    % Selecting the Orientation Type Defined by the User

                    if OrientationType==1 % Fixed Tilt

                        [ Ic,Ibc,Idc,Irc,CosInciAngle ] = FixedTilt( Ib,Id,C,beta,phi,tilt,phic,rho);

                    elseif OrientationType==2 % Seasonal Tilt

                         [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SeasonalTilt( n,L,Ib,Id,C,beta,phi,tilt,tiltsummer,tiltwinter,phic,rho );

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
                    
                    if WeatherFileHourlyOrRes==1 % WeatherFileHourlyOrRes are in Hourly Format

                        [ hi ] = HourlyFileIndex1( Day,Time); % Computing correct index for Hourly Temperature and WindSpeed Files
                        
                    elseif WeatherFileHourlyOrRes==0 % WeatherFileHourlyOrRes are in Resolution Format
                        
                        [ hi ]=ii ;
                        
                    end

                    [ Pmodtot,Pmodin]=ModulePower( Pmod(1,PVParaIndex),ModTemCF(1,PVParaIndex),ModNum(1,PVParaIndex),Tn,Gn,Icsf,T(hi,1),Ic,Uo,U1,Ws(hi,1) );

                    % Computing Various Losses associated to PV Systems and the Energy at each Step of Conversion/Transfer

                    [ PVout,INVpin,INVpout,Pgrid,ArrayMismatchLoss,ShadingLoss,LIDLoss,OhmicLossP,InverterLoss,TransformerLossP ] = PVoutputPower( Pmodtot, LID,LS,Arraymismat,PVTech(1,PVParaIndex),Shading, OhmicLoss,INVeff,TransLoss );

                    % Summing Up Power Losses and Power Available at various Stages of Conversion/Transfer

                    PVoutPower=PVout;
                    if PVout<0                        
                       PVoutPower=0;
                    end
                    INVpinPower=INVpin;
                    if INVpin<0                        
                       INVpinPower=0;
                    end
                    INVpoutPower=INVpout;
                    if INVpout<0                        
                       INVpoutPower=0;
                    end                    
                    PgridPower=Pgrid;
                    if Pgrid<0                        
                       PgridPower=0;
                    end                    
                    ArrayMismatchLossPower=ArrayMismatchLoss;
                    if ArrayMismatchLoss<0                        
                       ArrayMismatchLossPower=0;
                    end                    
                    ShadingLossPower=ShadingLoss;
                    if ShadingLoss<0                        
                       ShadingLossPower=0;
                    end                    
                    LIDLossPower=LIDLoss;
                    if LIDLoss<0                        
                       LIDLossPower=0;
                    end                    
                    OhmicLossPPower=OhmicLossP;
                    if OhmicLossP<0                        
                       OhmicLossPPower=0;
                    end                    
                    InverterLossPower=InverterLoss;
                    if InverterLoss<0                        
                       InverterLossPower=0;
                    end                    
                    TransformerLossPPower=TransformerLossP; 
                    if TransformerLossP<0                        
                       TransformerLossPPower=0;
                    end                    
                    
                    % Converting Summed Power To Energies (Energy *(HHres/60))
                    PVoutEnergy=PVoutPower*EnergyConverter;
                    INVpinEnergy=INVpinPower*EnergyConverter;
                    INVpoutEnergy=INVpoutPower*EnergyConverter;

                    PgridEnergy=PgridPower*EnergyConverter/1000
                    ProcessedData(ii,(Col+4))=PgridEnergy; % Updating Generation Data in the Correct Column and Row

                    ArrayMismatchLossEnergy=ArrayMismatchLossPower*EnergyConverter;
                    ShadingLossEnergy=ShadingLossPower*EnergyConverter;
                    LIDLossEnergy=LIDLossPower*EnergyConverter;
                    OhmicLossPEnergy=OhmicLossPPower*EnergyConverter;
                    InverterLossEnergy=InverterLossPower*EnergyConverter;
                    TransformerLossPEnergy=TransformerLossPPower*EnergyConverter; 

                end


        end        


    

elseif GenIrrad(1,PVParaIndex)==0 % Data Column is Irradiance Data 
    
            %Day Level Simulation

        for jj=n
                                   
            d=Declination(n); % Calculating Declination
            
            for ii=CorrectedIndex
                
                % Finding Year and Month Values for the Current DataFile Row for ClearnessIndexDataCleaner
                
                Year=ProcessedData(ii,3);
                
                Month=ProcessedData(ii,2);
                
                [ ClearIndex,DiffIndex] = ClearnessIndexDataCleaner( Year,Month,Years,RainSnowMonths,yr,mr,YearRain,MonthRain ); % Computing Clearness Index and Diffused Index for the given Rain data 
                
                % Computation for Generation/Irradiance

                ha=HourAngle(ProcessedData(ii,4)); % Calculating Hour Angle

                [beta,phi]=AltiAzi(d,L,ha);
               

                    if beta<0

                        beta=0; % Assigning negative beta values zero for computational coherence

                    end

                           
                % User Defined Time-Step Level Simulation                

                    [ Ib, Id ,C] = BeamDiffModelClearIndex( n,beta,ClearIndex,DiffIndex ); % Computing Beam & Diffused Irradiance at given moment in the specified day
                    
                % Computing Irradiance (GHI)    
                
                Irradiance=Ib*(sin((pi/180)*beta))+Id;
                
                if Irradiance<0                    
                   Irradiance=0; 
                end
    
                ProcessedData(ii,(Col+4))=Irradiance; % Updating Irradiance Data in the Correct Column and Row
                
            end
            
        end

    
    
end



