function [ TotalPVout,TotalINVpin,TotalINVpout,TotalPgrid,TotalArrayMismatchLoss,TotalShadingLoss,TotalLIDLoss,TotalOhmicLoss,TotalInverterLoss, TotalTrackerLoss,TotalTransformerLoss,MonthPVout,MonthINVpin,MonthINVpout,MonthPgrid,MonthArrayMismatchLoss,MonthShadingLoss,MonthLIDLoss,MonthOhmicLoss,MonthInverterLoss,MonthTrackerLoss,MonthTransformerLoss,PgridEnergy ] = SolarPVEnergySimulation( PrjName,Lat,Long,Pmod,PVTech,ModNum,ModTemCF,Tn,Gn,lpy,nolpy,StartMonth,StartDay,EndMonth,EndDay,SF,LID,LS,Arraymismat,OhmicLoss,rho,TrackerL,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,HHres,SimulationMode,RainSnowMonths,yr,mr,YearRain,MonthRain,NormalClearSky,ModifiedClearSky,gau,sin,avg,GhiInsoFile,WeatherDataFormat,StartYear,PlantCapacity) 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

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

DayNum=length(n);

TotDays=length(n); % Computing Total Simulation Days

% Latitude Information from the User
L=Lat;

% Simulation temporal Resolution Information from the User
HHres=HHres;

EnergyConverter=(HHres/60);

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

Ws=WS; % Hourly Indexxed Vector

% Initializing Computed Power and Power Loss Vectors

PVoutPower=zeros(LenPVmod,yeardays);
INVpinPower=zeros(LenPVmod,yeardays);
INVpoutPower=zeros(LenPVmod,yeardays);
PgridPower=zeros(LenPVmod,yeardays);
ArrayMismatchLossPower=zeros(LenPVmod,yeardays);
ShadingLossPower=zeros(LenPVmod,yeardays);
LIDLossPower=zeros(LenPVmod,yeardays);
OhmicLossPPower=zeros(LenPVmod,yeardays);
InverterLossPower=zeros(LenPVmod,yeardays);
TrackerLossPower=zeros(LenPVmod,yeardays);
TransformerLossPPower=zeros(LenPVmod,yeardays);

% Creating EnergyMatrix for storing Intra-Day Energy Values to create an EXCEL File 

[ EnergyMatrix,TotDataPoints,Time] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,HHres,11 );

EnergyMATRIX=zeros(TotDataPoints,15,len1);

% Creating Module Temperature and GHI Vectors
ModuleTemperature=0;
TotPlaneInso=0;


% Checking for Yearly and Inter-Yearly T, WS and GhiInsoFile

    LenYearlyResFile=24*(60/HHres)*yeardays;

    LenYearlyHourlyFile=24*yeardays;

    LenTact=length(T);

    LenWSact=length(WS);

    LenGhiInsoFileact=length(GhiInsoFile);

    if WeatherDataFormat==1 % Hourly Format

        LenTreq=length(n)*24;

        LenWSreq=length(n)*24;

    elseif WeatherDataFormat==0 % Res Format

        LenTreq=length(n)*24*(60/HHres);

        LenWSreq=length(n)*24*(60/HHres);   

    end

    LenGhiInsoFilereq=length(n)*24*(60/HHres);
    
%     if (LenTact<LenTreq)||(LenWSact<LenWSreq)||(LenGhiInsoFileact<LenGhiInsoFilereq)
%     if (LenTact<LenTreq)||(LenWSact<LenWSreq)
%         error('Vectored Input lengths for Weather Varibles not equal to required lengths for the for the given Simulation Period');
%     
%     end
    

if (StartMonth~=1)&&(n(1,1)~=1)
    
    % Initializing Indicator for getting Correct Index for the T, WS, GhiInsoFile
    
    IndexIndi=1;
    
else
    
    % Initializing Indicator for getting Correct Index for the T, WS, GhiInsoFile
    
    IndexIndi=0;
    
end

% Computing PV Energy Evaluation in Accordance with the User-Defined Simulation Mode 

if SimulationMode==1
    
    [ ClearIndex,DiffIndex] = ClearnessIndex( RainSnowMonths,yr,mr,YearRain,MonthRain,LeapYear,NormalClearSky,ModifiedClearSky ); % Computing Clearness Index and Diffused Index for the given Rain data  
   
    i=0; % Loop Counter initialization for PV Module Level Simulation

% PV Module Level Simulation

    for i=1:LenPVmod

        j=0; % Loop Counter initialization for Day Level Simulation
        
        DayCounter=0; % Initializing Day Counter
        
        TotDataPointsCounter=0; % Initializing Data Points Counter
        
        % Creating EnergyMATRIX for current PV Technology to create an EXCEL File        
        
        EnergyMATRIX(:,:,i)=EnergyMatrix; % Initializing Correct Dates in EnergyMATRIX

        %Day Level Simulation

        for j=n
            
            DayCounter=DayCounter+1; % Incrementing Day Counter

            [hp,ha,beta,phi,~,Ss,Indi] = Sun1(j,L,HHres); % The Sun1 function internally utilizes Declination, SunRiseSet, HourAngle and AltiAzi Functions

            % hp = Vector of Solar Time (in Decimal Time) for which Simulation will occur on the n^(th)day
            % ha = Vector of Hour Angles (in Degrees) corresponding to the Vector hp on the n^(th)day
            % beta = Vector of Solar Elevation Angles (in Degrees) corresponding to the Vector ha on the n^(th)day
            % phi = Vector of Solar Azimuth Angles (in Degrees) corresponding to the Vector ha on the n^(th)day
            % Sr = Sunrise in Solar Time (in Decimal Time) for the n^(th)day
            % Sr = Sunset in Solar Time (in Decimal Time) for the n^(th)day

            % Correcting for neagative values of Solar Elevation angles (beta) which usually appear at first and last terms of beta vector
            for bb=1:length(beta)
                
                if beta(1,bb)<0
                    
                    beta(1,bb)=0; % Assigning negative beta values zero for computational coherence
                    
                end
                
            end
    
            
            DayLen=length(hp); % For Computing PV Energy within the n^(th) day
                        
            k=0; % Loop Counter initialization for Time-Step Level Simulation

            % User Defined Time-Step Level Simulation

            for k=1:DayLen
                
                % Incrementing TotDataPointsCounter 
                
                TotDataPointsCounter=TotDataPointsCounter+1;

                [ Ib, Id ,C] = BeamDiffModelClearIndex( j,beta(1,k),ClearIndex(1,j),DiffIndex(1,j) ); % Computing Beam & Diffused Irradiance at given moment in the specified day
                
                
                % Selecting the Orientation Type Defined by the User
                
                if OrientationType==1 % Fixed Tilt
                    
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = FixedTilt( Ib,Id,C,beta(1,k),phi(1,k),tilt,phic,rho);
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                    
                    
                elseif OrientationType==2 % Seasonal Tilt
                    
                     [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SeasonalTilt( j,L,Ib,Id,C,beta(1,k),phi(1,k),tilt,tiltsummer,tiltwinter,phic,rho );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                          
                     
                elseif OrientationType==3 % Single Axis E-W Tracker
                    
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SingleAxisEW(Ib,Id,C,beta(1,k),phi(1,k),phicmin,phicmax,tilt,rho );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                elseif OrientationType==4 % Single Axis N-S Tracker
                    
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SingleAxisNS(Ib,Id,C,beta(1,k),phi(1,k),phic,tiltmin,tiltmax,rho );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                elseif OrientationType==5 % Double Axis Tracker
                                        
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = DoubleAxis( Ib,Id,C,phi(1,k),phicmin,phicmax,tiltmin,tiltmax,beta(1,k),rho  );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                end
                
                % Computing Incidence Losses and Soiling Losses
                                
                [ Iciam,Icsf ] = ArrayIncidenceLoss( Ic,CosInciAngle,bo,SF );
                
                % Computing Power from the PV Module due to Incident Radiation
                
                if IndexIndi==0
                
                    if WeatherDataFormat==1

                        [ hi ] = HourlyFileIndex( j,hp(1,k)); % Computing correct index for Hourly Temperature and WindSpeed Files

                    elseif WeatherDataFormat==0

                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  

                    end
                
                elseif IndexIndi==1
                    
                    if WeatherDataFormat==1

                        [ hi ] = HourlyFileIndex( j,hp(1,k)); % Computing correct index for Hourly Temperature and WindSpeed Files

                        hi=LenTreq-(LenYearlyHourlyFile-hi);
                        
                    elseif WeatherDataFormat==0

                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  

                       % hi=LenTreq-(LenYearlyResFile-hi);                        
                        
                    end
                    
                end
                
                [ Pmodtot,Pmodin,Tm]=ModulePower( Pmod(1,i),ModTemCF(1,i),ModNum(1,i),Tn,Gn,Icsf,T(hi,1),Ic,Uo,U1,Ws(hi,1) );
                
                % Storing Module Temperatures
                
                ModuleTemperature(TotDataPointsCounter,1)=Tm;
                
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
                
                [II]= ResFileIndex(DayCounter,hp(1,k),HHres); % Computing Correct Row Index for placing Intr-Day Energy Values
                
                EnergyMATRIX( II , 5, i)=PVout*EnergyConverter ;
                EnergyMATRIX( II, 6, i)=INVpin*EnergyConverter ;
                EnergyMATRIX( II, 7, i)=INVpout*EnergyConverter ;
                EnergyMATRIX( II, 8, i)=Pgrid*EnergyConverter ;
                EnergyMATRIX( II, 9, i)=ArrayMismatchLoss*EnergyConverter ;
                EnergyMATRIX( II, 10, i)=ShadingLoss*EnergyConverter ;
                EnergyMATRIX( II, 11, i)=LIDLoss*EnergyConverter ;
                EnergyMATRIX( II, 12, i)=OhmicLossP*EnergyConverter ;
                EnergyMATRIX( II, 13, i)=InverterLoss*EnergyConverter ;
                EnergyMATRIX( II, 14, i)=TrackerLossP*EnergyConverter ;
                EnergyMATRIX( II, 15, i)=TransformerLossP*EnergyConverter ;
                                
                % Summing Up Power Losses and Power Available at various Stages of Conversion/Transfer
                
                PVoutPower(i,j)=PVoutPower(i,j)+PVout;
                INVpinPower(i,j)=INVpinPower(i,j)+INVpin;
                INVpoutPower(i,j)=INVpoutPower(i,j)+INVpout;
                PgridPower(i,j)=PgridPower(i,j)+Pgrid;
                ArrayMismatchLossPower(i,j)=ArrayMismatchLossPower(i,j)+ArrayMismatchLoss;
                ShadingLossPower(i,j)=ShadingLossPower(i,j)+ShadingLoss;
                LIDLossPower(i,j)=LIDLossPower(i,j)+LIDLoss;
                OhmicLossPPower(i,j)=OhmicLossPPower(i,j)+OhmicLossP;
                InverterLossPower(i,j)=InverterLossPower(i,j)+InverterLoss;
                TrackerLossPower(i,j)=TrackerLossPower(i,j)+TrackerLossP;
                TransformerLossPPower(i,j)=TransformerLossPPower(i,j)+TransformerLossP;                                          
                             


            end


        end



    end

    % Converting Summed Power To Energies (Energy *(HHres/60))
    PVoutEnergy=PVoutPower*EnergyConverter;
    INVpinEnergy=INVpinPower*EnergyConverter;
    INVpoutEnergy=INVpoutPower*EnergyConverter;
    PgridEnergy=PgridPower*EnergyConverter;
    ArrayMismatchLossEnergy=ArrayMismatchLossPower*EnergyConverter;
    ShadingLossEnergy=ShadingLossPower*EnergyConverter;
    LIDLossEnergy=LIDLossPower*EnergyConverter;
    OhmicLossPEnergy=OhmicLossPPower*EnergyConverter;
    InverterLossEnergy=InverterLossPower*EnergyConverter;
    TrackerLossEnergy=TrackerLossPower*EnergyConverter;
    TransformerLossPEnergy=TransformerLossPPower*EnergyConverter; 
    


elseif SimulationMode==2

        i=0; % Loop Counter initialization for PV Module Level Simulation

% PV Module Level Simulation

    for i=1:LenPVmod

        j=0; % Loop Counter initialization for Day Level Simulation
        
        DayCounter=0; % Initializing Day Counter
        
        TotDataPointsCounter=0; % Initializing Data Points Counter        
        
        % Creating EnergyMATRIX for current PV Technology to create an EXCEL File        
        
        EnergyMATRIX(:,:,i)=EnergyMatrix; % Initializing Correct Dates in EnergyMATRIX
        
        count1=0; % For Debugging

        %Day Level Simulation

        for j=n
            
            count1=count1+1 % For Debugging
            
            DayCounter=DayCounter+1; % Incrementing Day Counter

            [hp,ha,beta,phi,Sr,Ss,Indi] = Sun1(j,L,HHres); % The Sun1 function internally utilizes Declination, SunRiseSet, HourAngle and AltiAzi Functions

            % hp = Vector of Solar Time (in Decimal Time) for which Simulation will occur on the n^(th)day
            % ha = Vector of Hour Angles (in Degrees) corresponding to the Vector hp on the n^(th)day
            % beta = Vector of Solar Elevation Angles (in Degrees) corresponding to the Vector ha on the n^(th)day
            % phi = Vector of Solar Azimuth Angles (in Degrees) corresponding to the Vector ha on the n^(th)day
            % Sr = Sunrise in Solar Time (in Decimal Time) for the n^(th)day
            % Sr = Sunset in Solar Time (in Decimal Time) for the n^(th)day

            DayLen=length(hp); % For Computing PV Energy within the n^(th) day
                        
            k=0; % Loop Counter initialization for Time-Step Level Simulation

            % User Defined Time-Step Level Simulation
            
            count2=0 % For Debugging

            for k=1:DayLen
                
                % Incrementing TotDataPointsCounter 
                
                TotDataPointsCounter=TotDataPointsCounter+1;
                
                count2=count2+1 % For Debugging
                
                if IndexIndi==0
                
                    [ GHIIndex] = GHIHHresIndex( j,hp(1,k),HHres ); % Computing correct index for GHI File 

                elseif IndexIndi==1
                    
%                     [ GHIIndexx] = GHIHHresIndex( j,hp(1,k),HHres ); % Computing correct index for GHI File 
% 
%                      GHIIndex=LenGhiInsoFilereq-(LenYearlyResFile-GHIIndexx);     

                    [ GHIIndex] = GHIHHresIndex( DayCounter,hp(1,k),HHres ); % For Weather Files which are not of complete one year


                end
                 
                
                [ Ib, Id,C] = BeamDiffGHI(j, GhiInsoFile(GHIIndex,1),beta(1,k) ); % Computing Beam & Diffused Irradiance at given moment in the specified day

                
                % Selecting the Orientation Type Defined by the User
                
                if OrientationType==1 % Fixed Tilt
                    
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = FixedTilt( Ib,Id,C,beta(1,k),phi(1,k),tilt,phic,rho);
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                elseif OrientationType==2 % Seasonal Tilt
                    
                     [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SeasonalTilt( j,L,Ib,Id,C,beta(1,k),phi(1,k),tilt,tiltsummer,tiltwinter,phic,rho );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                          
                     
                elseif OrientationType==3 % Single Axis E-W Tracker
                    
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SingleAxisEW(Ib,Id,C,beta(1,k),phi(1,k),phicmin,phicmax,tilt,rho );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                elseif OrientationType==4 % Single Axis N-S Tracker
                    
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SingleAxisNS(Ib,Id,C,beta(1,k),phi(1,k),phic,tiltmin,tiltmax,rho );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                elseif OrientationType==5 % Double Axis Tracker
                                        
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = DoubleAxis( Ib,Id,C,phi(1,k),phicmin,phicmax,tiltmin,tiltmax,beta(1,k),rho  );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                end
                
                % Computing Incidence Losses and Soiling Losses
                
                [ Iciam,Icsf ] = ArrayIncidenceLoss( Ic,CosInciAngle,bo,SF );
                
                % Computing Power from the PV Module due to Incident Radiation
                
                if IndexIndi==0
                
                    if WeatherDataFormat==1

                        [ hi ] = HourlyFileIndex( j,hp(1,k)); % Computing correct index for Hourly Temperature and WindSpeed Files

                    elseif WeatherDataFormat==0

                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  

                    end
                
                elseif IndexIndi==1
                    
                    if WeatherDataFormat==1

                        [ hi ] = HourlyFileIndex( j,hp(1,k)); % Computing correct index for Hourly Temperature and WindSpeed Files

                        hi=LenTreq-(LenYearlyHourlyFile-hi);                       
                        
                    elseif WeatherDataFormat==0

                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  

                       % hi=LenTreq-(LenYearlyResFile-hi);                        
                        
                    end
                    
                end              
                
                [ Pmodtot,Pmodin,Tm]=ModulePower( Pmod(1,i),ModTemCF(1,i),ModNum(1,i),Tn,Gn,Icsf,T(hi,1),Ic,Uo,U1,Ws(hi,1) );
                
                % Storing Module Temperatures
                
                ModuleTemperature(TotDataPointsCounter,1)=Tm;                
                
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
                
                [II]= ResFileIndex(DayCounter,hp(1,k),HHres); % Computing Correct Row Index for placing Intr-Day Energy Values
                
                EnergyMATRIX( II , 5, i)=PVout*EnergyConverter ;
                EnergyMATRIX( II, 6, i)=INVpin*EnergyConverter ;
                EnergyMATRIX( II, 7, i)=INVpout*EnergyConverter ;
                EnergyMATRIX( II, 8, i)=Pgrid*EnergyConverter ;
                EnergyMATRIX( II, 9, i)=ArrayMismatchLoss*EnergyConverter ;
                EnergyMATRIX( II, 10, i)=ShadingLoss*EnergyConverter ;
                EnergyMATRIX( II, 11, i)=LIDLoss*EnergyConverter ;
                EnergyMATRIX( II, 12, i)=OhmicLossP*EnergyConverter ;
                EnergyMATRIX( II, 13, i)=InverterLoss*EnergyConverter ;
                EnergyMATRIX( II, 14, i)=TrackerLossP*EnergyConverter ;
                EnergyMATRIX( II, 15, i)=TransformerLossP*EnergyConverter ;

                
                % Summing Up Power Losses and Power Available at various Stages of Conversion/Transfer
                
                PVoutPower(i,j)=PVoutPower(i,j)+PVout;
                INVpinPower(i,j)=INVpinPower(i,j)+INVpin;
                INVpoutPower(i,j)=INVpoutPower(i,j)+INVpout;
                PgridPower(i,j)=PgridPower(i,j)+Pgrid;
                ArrayMismatchLossPower(i,j)=ArrayMismatchLossPower(i,j)+ArrayMismatchLoss;
                ShadingLossPower(i,j)=ShadingLossPower(i,j)+ShadingLoss;
                LIDLossPower(i,j)=LIDLossPower(i,j)+LIDLoss;
                OhmicLossPPower(i,j)=OhmicLossPPower(i,j)+OhmicLossP;
                InverterLossPower(i,j)=InverterLossPower(i,j)+InverterLoss;
                TrackerLossPower(i,j)=TrackerLossPower(i,j)+TrackerLossP;
                TransformerLossPPower(i,j)=TransformerLossPPower(i,j)+TransformerLossP;                                          
                             


            end


        end



    end

    % Converting Summed Power To Energies (Energy *(HHres/60))
    PVoutEnergy=PVoutPower*EnergyConverter;
    INVpinEnergy=INVpinPower*EnergyConverter;
    INVpoutEnergy=INVpoutPower*EnergyConverter;
    PgridEnergy=PgridPower*EnergyConverter;
    ArrayMismatchLossEnergy=ArrayMismatchLossPower*EnergyConverter;
    ShadingLossEnergy=ShadingLossPower*EnergyConverter;
    LIDLossEnergy=LIDLossPower*EnergyConverter;
    OhmicLossPEnergy=OhmicLossPPower*EnergyConverter;
    InverterLossEnergy=InverterLossPower*EnergyConverter;
    TrackerLossEnergy=TrackerLossPower*EnergyConverter;
    TransformerLossPEnergy=TransformerLossPPower*EnergyConverter; 


    

elseif SimulationMode==3
    
    i=0; % Loop Counter initialization for PV Module Level Simulation

% PV Module Level Simulation

    for i=1:LenPVmod

        j=0; % Loop Counter initialization for Day Level Simulation
        
        DayCounter=0; % Initializing Day Counter
        
        TotDataPointsCounter=0; % Initializing Data Points Counter        
        
        % Creating EnergyMATRIX for current PV Technology to create an EXCEL File        
        
        EnergyMATRIX(:,:,i)=EnergyMatrix; % Initializing Correct Dates in EnergyMATRIX

        %Day Level Simulation

        for j=n
            
            DayCounter=DayCounter+1; % Incrementing Day Counter

            [hp,ha,beta,phi,Sr,Ss,Indi] = Sun1(j,L,HHres); % The Sun1 function internally utilizes Declination, SunRiseSet, HourAngle and AltiAzi Functions

            % hp = Vector of Solar Time (in Decimal Time) for which Simulation will occur on the n^(th)day
            % ha = Vector of Hour Angles (in Degrees) corresponding to the Vector hp on the n^(th)day
            % beta = Vector of Solar Elevation Angles (in Degrees) corresponding to the Vector ha on the n^(th)day
            % phi = Vector of Solar Azimuth Angles (in Degrees) corresponding to the Vector ha on the n^(th)day
            % Sr = Sunrise in Solar Time (in Decimal Time) for the n^(th)day
            % Sr = Sunset in Solar Time (in Decimal Time) for the n^(th)day

            DayLen=length(hp); % For Computing PV Energy within the n^(th) day
            
            % Computing GHI (W/m^(2)) from Daily Insolation (Wh/m^(2)) accordance with the User-Defined Preference in
            
            if gau==1
                
                [ GHI] = GHIGaussianDistri( GhiInsoFile(j,1),Sr,Ss,Indi,HHres );
                
            elseif sin==1
                
                [ GHI] = GHISinusoidalDistri(GhiInsoFile(j,1),Sr,Ss,Indi,HHres);
                
            elseif avg==1
                
                [GHI] = GHIGauSinAvg( GhiInsoFile(j,1),Sr,Ss,Indi,HHres );
                
            end
            
            
            
            k=0; % Loop Counter initialization for Time-Step Level Simulation

            % User Defined Time-Step Level Simulation

            for k=1:DayLen
                
               % Incrementing TotDataPointsCounter 
                
                TotDataPointsCounter=TotDataPointsCounter+1;

                [ Ib, Id,C] = BeamDiffGHI(j, GHI(1,k),beta(1,k) ); % Computing Beam & Diffused Irradiance at given moment in the specified day
                
                % Selecting the Orientation Type Defined by the User
                
                if OrientationType==1 % Fixed Tilt
                    
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = FixedTilt( Ib,Id,C,beta(1,k),phi(1,k),tilt,phic,rho);
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                elseif OrientationType==2 % Seasonal Tilt
                    
                     [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SeasonalTilt( j,L,Ib,Id,C,beta(1,k),phi(1,k),tilt,tiltsummer,tiltwinter,phic,rho );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                          
                     
                elseif OrientationType==3 % Single Axis E-W Tracker
                    
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SingleAxisEW(Ib,Id,C,beta(1,k),phi(1,k),phicmin,phicmax,tilt,rho );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                elseif OrientationType==4 % Single Axis N-S Tracker
                    
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = SingleAxisNS(Ib,Id,C,beta(1,k),phi(1,k),phic,tiltmin,tiltmax,rho );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                elseif OrientationType==5 % Double Axis Tracker
                                        
                    [ Ic,Ibc,Idc,Irc,CosInciAngle ] = DoubleAxis( Ib,Id,C,phi(1,k),phicmin,phicmax,tiltmin,tiltmax,beta(1,k),rho  );
                    
                    % Storing Computed Total In Plane Irradiance Value              

                    TotPlaneInso(TotDataPointsCounter,1)=Ic;                         
                    
                end
                
                % Computing Incidence Losses and Soiling Losses
                
                [ Iciam,Icsf ] = ArrayIncidenceLoss( Ic,CosInciAngle,bo,SF );
                
                % Computing Power from the PV Module due to Incident Radiation
                
                if IndexIndi==0
                
                    if WeatherDataFormat==1

                        [ hi ] = HourlyFileIndex( j,hp(1,k)); % Computing correct index for Hourly Temperature and WindSpeed Files

                    elseif WeatherDataFormat==0

                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  

                    end
                
                elseif IndexIndi==1
                    
                    if WeatherDataFormat==1

                        [ hi ] = HourlyFileIndex( j,hp(1,k)); % Computing correct index for Hourly Temperature and WindSpeed Files

                        hi=LenTreq-(LenYearlyHourlyFile-hi);                        
                        
                    elseif WeatherDataFormat==0

                        [ hi]= ResFileIndex(DayCounter,hp(1,k),HHres) ;  

                        % hi=LenTreq-(LenYearlyResFile-hi);                        
                        
                    end
                    
                end
                
                [ Pmodtot,Pmodin,Tm]=ModulePower( Pmod(1,i),ModTemCF(1,i),ModNum(1,i),Tn,Gn,Icsf,T(hi,1),Ic,Uo,U1,Ws(hi,1) );
                
                % Storing Module Temperatures
                
                ModuleTemperature(TotDataPointsCounter,1)=Tm;                
                
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
                
                [II]= ResFileIndex(DayCounter,hp(1,k),HHres); % Computing Correct Row Index for placing Intr-Day Energy Values
                
                EnergyMATRIX( II , 5, i)=PVout*EnergyConverter ;
                EnergyMATRIX( II, 6, i)=INVpin*EnergyConverter ;
                EnergyMATRIX( II, 7, i)=INVpout*EnergyConverter ;
                EnergyMATRIX( II, 8, i)=Pgrid*EnergyConverter ;
                EnergyMATRIX( II, 9, i)=ArrayMismatchLoss*EnergyConverter ;
                EnergyMATRIX( II, 10, i)=ShadingLoss*EnergyConverter ;
                EnergyMATRIX( II, 11, i)=LIDLoss*EnergyConverter ;
                EnergyMATRIX( II, 12, i)=OhmicLossP*EnergyConverter ;
                EnergyMATRIX( II, 13, i)=InverterLoss*EnergyConverter ;
                EnergyMATRIX( II, 14, i)=TrackerLossP*EnergyConverter ;
                EnergyMATRIX( II, 15, i)=TransformerLossP*EnergyConverter ;

                
                % Summing Up Power Losses and Power Available at various Stages of Conversion/Transfer
                
                PVoutPower(i,j)=PVoutPower(i,j)+PVout;
                INVpinPower(i,j)=INVpinPower(i,j)+INVpin;
                INVpoutPower(i,j)=INVpoutPower(i,j)+INVpout;
                PgridPower(i,j)=PgridPower(i,j)+Pgrid;
                ArrayMismatchLossPower(i,j)=ArrayMismatchLossPower(i,j)+ArrayMismatchLoss;
                ShadingLossPower(i,j)=ShadingLossPower(i,j)+ShadingLoss;
                LIDLossPower(i,j)=LIDLossPower(i,j)+LIDLoss;
                OhmicLossPPower(i,j)=OhmicLossPPower(i,j)+OhmicLossP;
                InverterLossPower(i,j)=InverterLossPower(i,j)+InverterLoss;
                TrackerLossPower(i,j)=TrackerLossPower(i,j)+TrackerLossP;
                TransformerLossPPower(i,j)=TransformerLossPPower(i,j)+TransformerLossP;                                          
                             


            end


        end



    end

    % Converting Summed Power To Energies (Energy *(HHres/60))
    PVoutEnergy=PVoutPower*EnergyConverter;
    INVpinEnergy=INVpinPower*EnergyConverter;
    INVpoutEnergy=INVpoutPower*EnergyConverter;
    PgridEnergy=PgridPower*EnergyConverter;
    ArrayMismatchLossEnergy=ArrayMismatchLossPower*EnergyConverter;
    ShadingLossEnergy=ShadingLossPower*EnergyConverter;
    LIDLossEnergy=LIDLossPower*EnergyConverter;
    OhmicLossPEnergy=OhmicLossPPower*EnergyConverter;
    InverterLossEnergy=InverterLossPower*EnergyConverter;
    TrackerLossEnergy=TrackerLossPower*EnergyConverter;
    TransformerLossPEnergy=TransformerLossPPower*EnergyConverter; 



end

% Compacting Day-Wise Energy Calculated in Cell Structure

EnergyParameters={PVoutEnergy,INVpinEnergy,INVpoutEnergy,PgridEnergy,ArrayMismatchLossEnergy,ShadingLossEnergy,LIDLossEnergy,OhmicLossPEnergy,InverterLossEnergy,TrackerLossEnergy,TransformerLossPEnergy };

% Computing Module-Wise, Day-Wise, Month-Wise & Total Energies at different Transfers/Conversions and Loss Enrgies     
    
[ EnergyModTotCell,EnergyDayWiseTotCell,EnergyTotCell,EnergyMonthWiseTotCell ] = PVEnergyCalculator( EnergyParameters,LenPVmod,yeardays );

    % EnergyModTotCell = It is a Cell (Data-Type) which contains Energy Vectors for Each Module Type
    % EnergyDayWiseTotCell = It is a Cell (Data-Type) which contains Energy Vectors of the sum of enrgies for all module types for each Day
    % EnergyTotCell = It is a Cell (Data-Type) which contains Total Energy values for the entire PV System for the given period of Simulation
    % EnergyMonthWiseTotCell = It is a Cell (Data-Type) which contains Total Energy values for all module types but in Monthly Order


    % Total Energy For Given Simulation Period
    
    TotalPVout=EnergyTotCell{1,1};  
    TotalINVpin=EnergyTotCell{1,2};
    TotalINVpout=EnergyTotCell{1,3};
    TotalPgrid=EnergyTotCell{1,4};
    TotalArrayMismatchLoss=EnergyTotCell{1,5};
    TotalShadingLoss=EnergyTotCell{1,6};
    TotalLIDLoss=EnergyTotCell{1,7};
    TotalOhmicLoss=EnergyTotCell{1,8};
    TotalInverterLoss=EnergyTotCell{1,9};
    TotalTrackerLoss=EnergyTotCell{1,10};
    TotalTransformerLoss=EnergyTotCell{1,11};
    
    % Monthly Energy For Given Simulation Period
   
    MonthPVout=EnergyMonthWiseTotCell{1,1};
    MonthINVpin=EnergyMonthWiseTotCell{1,2};
    MonthINVpout=EnergyMonthWiseTotCell{1,3};
    MonthPgrid=EnergyMonthWiseTotCell{1,4};
    MonthArrayMismatchLoss=EnergyMonthWiseTotCell{1,5};
    MonthShadingLoss=EnergyMonthWiseTotCell{1,6};
    MonthLIDLoss=EnergyMonthWiseTotCell{1,7};
    MonthOhmicLoss=EnergyMonthWiseTotCell{1,8};
    MonthInverterLoss=EnergyMonthWiseTotCell{1,9};
    MonthTrackerLoss=EnergyMonthWiseTotCell{1,10};  
    MonthTransformerLoss=EnergyMonthWiseTotCell{1,11}; 
    
    %% Plant Performance Analysis
    
    % Creating Inputs for plant performance analysis
    
    EArrayMod=EnergyModTotCell{1,1};
    
    EPgridMod=EnergyModTotCell{1,4};
    
    EArray=TotalPVout;
    
    EPgrid=TotalPgrid;
    
    % Computing Plant Performance using external function
           
  [ PlantPerfVector,ModulePerfMatrix ] = PvPlantPerformance( EArrayMod,EPgridMod,EArray,EPgrid,TotPlaneInso,ModuleTemperature,DayNum,EnergyConverter,ModTemCF,PlantCapacity,Pmod,ModNum );

  % Creating Excel File for Plant Performance Analysis
  
  VerticalExcelPPAnalysis={'Module Level Performance Analysis';'Final Yeild Module (Yf)';'Reference Yield Module (Yr)';'Array Yeild Module (Ya)';'Temperature Corrected Reference Yeild Module (Yt)';'Thermal Capture Loss Module (Lct)';'Array Capture Loss Module (Lc)';'Miscelleneous Capture Losses Module (Lcm)';'System Losses Module (Ls)';'PR Module';'CUF Module';'Temperature Corrected PR Module';'';'Plant Performance Analysis';'Final Yeild (Yf)';'Reference Yield (Yr)';'Array Yeild (Ya)';'Temperature Corrected Reference Yeild (Yt)';'Thermal Capture Loss (Lct)';'Array Capture Loss (Lc)';'Miscelleneous Capture Losses (Lcm)';'System Losses (Ls)';'PR';'CUF';'Temperature Corrected PR'};
  
       filename = 'PVPlantEnergy_PerformanceAnalysis_File.xlsx';
       
       sheet = 1;

       xlRange = 'A1';

       xlswrite(filename,VerticalExcelPPAnalysis,sheet,xlRange);       

       sheet = 1;

       xlRange = 'B2';

       xlswrite(filename,ModulePerfMatrix,sheet,xlRange); 
       
       sheet = 1;

       xlRange = 'B15';

       xlswrite(filename,PlantPerfVector,sheet,xlRange);       
  
%% Excel File Creation
    HorizontalExcelIntraDay={'Day','Month','Year','Time','PVoutEnergy','INVpinEnergy','INVpoutEnergy','PgridEnergy','ArrayMismatchLossEnergy','ShadingLossEnergy','LIDLossEnergy','OhmicLossPEnergy','InverterLossEnergy','TrackerLossEnergy','TransformerLossPEnergy'};
    
    HorizontalExcelDay={'Day','Month','Year','PVoutEnergy','INVpinEnergy','INVpoutEnergy','PgridEnergy','ArrayMismatchLossEnergy','ShadingLossEnergy','LIDLossEnergy','OhmicLossPEnergy','InverterLossEnergy','TrackerLossEnergy','TransformerLossPEnergy'};

    HorizontalExcelMonth={'Month','Year','PVoutEnergy','INVpinEnergy','INVpoutEnergy','PgridEnergy','ArrayMismatchLossEnergy','ShadingLossEnergy','LIDLossEnergy','OhmicLossPEnergy','InverterLossEnergy','TrackerLossEnergy','TransformerLossPEnergy'};

    
    % Creating Excel Files from EnergyMATRIX Intra-Day Values
    
    for m=1:len1
        
       filename = 'PVPlantEnergy_IntraDay_File.xlsx';
       
       sheet = m;

       xlRange = 'A1';

       xlswrite(filename,HorizontalExcelIntraDay,sheet,xlRange);       

       sheet = m;

       xlRange = 'A2';

       xlswrite(filename,EnergyMATRIX(:,:,m),sheet,xlRange); 
        
    end
    
    
    % Converting Intra-Day Files to Daily Files & Daily Files to Monthly Files
    
       for n=1:len1
           
           [ ProcessedData1 ] = MINToDayDataCoverterApp( EnergyMATRIX(:,:,n),11,HHres,ones(1,11) );
        
           filename = 'PVPlantEnergy_Daily_File.xlsx';
           
           sheet = n;

           xlRange = 'A1';

           xlswrite(filename,HorizontalExcelDay,sheet,xlRange); 

           sheet = n;

           xlRange = 'A2';

           xlswrite(filename,ProcessedData1,sheet,xlRange); 
           
           [ ProcessedData2 ] = DayToMonthDataCoverterApp( ProcessedData1,11,ones(1,11) );
           
           filename = 'PVPlantEnergy_Monthly_File.xlsx';
           
           sheet = n;

           xlRange = 'A1';

           xlswrite(filename,HorizontalExcelMonth,sheet,xlRange);             

           sheet = n;

           xlRange = 'A2';

           xlswrite(filename,ProcessedData2,sheet,xlRange);  
           
       end
    
%% Creating Master Excel Sheets    



%% Creating Standard DateTime Stamp Files



end
