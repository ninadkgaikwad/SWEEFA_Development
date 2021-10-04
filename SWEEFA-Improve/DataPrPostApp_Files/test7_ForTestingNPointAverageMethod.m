% Script for Testing 5 point average Weather Data Filling method (Run this after test6 and do not clear the workspace after test6 is executed)
DayDataPoints=24*(60/Res); % Total Data Points in ONE DAY

DayPointCounter=0; % Initializing DayPointCounter

DayCounter=0; % Initializing DayCounter

N=5;

%% N Point Average Method for Filling missing Data in TEMPERATURE, WIND, RELATIVE HUMIDITY

RaN=zeros(N,DataCols); % Initializing the Running Value Storage used in NaN Value Filling 

NPointAverageN=sum(RaN)/N; % Calculating the Running Average

RaZ=zeros(N,DataCols,TotDays); % Initializing the Running Value Storage (Last N Values of a Day)for Filling Days with all Zeros

RaLastNValuesOfEachDay=zeros(N,TotDays,DataCols); % Initializing Matrix for storing Last N Values of Each Day

% FOR LOOP for Point-Wise Filling of NaN Values

for i=1:Rows
    
    DayPointCounter=DayPointCounter+1; % Incrementing DayPointCounter
    
    RaCounter=rem(i,N); % For using Running Value Storage Vector to cyclically update its N Values with the next value
    
    if RaCounter==0
        
        RaCounter=N;
        
    end
    
    % FOR LOOP for Each Data Column
    
    for k=1:DataCols
        
        if isnan(ProcessedData(i,k+4))
            
            NPointAverageN=sum(RaN(:,k))/N; % Calculating the Running Average
            
            ProcessedData(i,k+4)=NPointAverageN; % Updating NaN Value with Running Average Value
        
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        else
            
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        end
        
        % Storing Last N Values of EACH DAY
        
        if DayPointCounter==DayDataPoints
                        
            DayCounter=DayCounter+1; % Incrementing DayCounter
            
            RaLastNValuesOfEachDay(:,DayCounter,k)=RaN(:,k); % Storing Last N Values
            
            DayPointCounter=0; % Reinitializing DayPointCounter
            
        end
        
        
    end
    
    
    
end
        
        
        