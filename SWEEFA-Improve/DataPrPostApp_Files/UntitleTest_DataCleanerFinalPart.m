%% Filling  Missing Data in COMPLETELY EMPTY DAYS & DAYS with NaN VALUES

% Res=5;
% TotDays=363;
% len1=4;
% DataCols=5;
% Lat=23.275;
  
DayDataPoints=24*(60/Res);

% Computing Year Vector for use in the ClearnessIndexDataCleaner Function inside SolarPVEnergySimulationPointWiseSim1 Function

  NumYear=EndYear-StartYear; % Computing Number of Years of Data
  
  OneVector=ones(1,(NumYear+1)); % Creating One Vector
  
  x=find(OneVector); % Creating Incrementing Index for the FOR LOOP
  
  for ii=x % FOR LOOP for creating the Year Vector
      
      if ii==1
          
        Years(1,ii)=StartYear;
        
      end
      
      Years(1,ii)=StartYear+(ii-1);
      
      if Years(1,ii)==EndYear
          
         break; 
          
      end
      
      
  end

% FOR LOOP for Days



for i=1:TotDays
    
    % Finding Julian Day for the Given Day
    
    RowForDate=(DayDataPoints*(i-1))+1; % Row Number for Starting of New Day
    
    Month=ProcessedData(RowForDate,2);

    Day=ProcessedData(RowForDate,1);

    Year=ProcessedData(RowForDate,3);
    
    [n]=JulianDay(Day,Month,Year); % Actual Call to the Pre-defined Function
    
    
    % FOR LOOP for Data Columns
    
    for k=1:DataCols
        
        % Checking for ALL ZEROS and NaN Values (i.e Data Points that day are EMPTY or UNFILLED)
        
        ZeroCheck=find(Z(:,i,k));
        
        NaNCheck=find(N(:,i,k));
        
        PercentNaNValues=(length(NaNCheck)/DayDataPoints)*100;
        
        if length(ZeroCheck)==DayDataPoints % Use PV Energy Evaluation Model to fill missing DATA
            
            Index=ZeroCheck;
            
            [ ProcessedData,PgridEnergy,Irradiance] = SolarPVEnergySimulationPointWiseSim1(ProcessedData,GenIrrad,WeatherFileHourlyOrRes,n,Index,i,k,Lat,Pmod,PVTech,ModNum,ModTemCF,SF,LID,LS,Arraymismat,OhmicLoss,rho,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,Years,RainSnowMonths,yr,mr,YearRain,MonthRain,HHres) ;
            
                        
        elseif PercentNaNValues>30 % Use PV Energy Evaluation Model to fill missing DATA
            
            Index=NaNCheck;
            
            [ProcessedData, PgridEnergy,Irradiance] = SolarPVEnergySimulationPointWiseSim1(ProcessedData,GenIrrad,WeatherFileHourlyOrRes,n,Index,i,k,Lat,Pmod,PVTech,ModNum,ModTemCF,SF,LID,LS,Arraymismat,OhmicLoss,rho,INVeff,TransLoss,Uo,U1,Shading,bo,Temp,WS,OrientationType,OrientationParameters,Years,RainSnowMonths,yr,mr,YearRain,MonthRain,HHres) ;
            
        elseif PercentNaNValues<=30 % Use CurveFitting Method by Gauss1
            
            % Using Pre-defined Function for CurveFitting
            
            [ ProcessedData ] = PVGenerationCurveFitting( ProcessedData,i,k,Res,Lat,n,NaNCheck );
            
%         elseif (length(ZeroCheck)~=DayDataPoints)&&(length(NaNCheck)==0) % Optimal Data is present in the given DAY
%             
%             break                       
              
        end
        
        i % For Debugging
        
    end
    
    
end