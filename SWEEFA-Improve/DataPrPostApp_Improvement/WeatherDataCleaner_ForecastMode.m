function [ DTWeather_Cleaned_Cell ] = WeatherDataCleaner_ForecastMode( DTWeather_Cell,N )

%% Function Details:

% DTWeather_Cell = Date-Time and Weather Columns with Headers in a Cell Structure
% N = It is number elements for N-Point Running Average

%% Cleaning Weather Variable Data Columns

%% Preliminary Computations

% Computing DataCols and Rows

[r,c]=size(DTWeather_Cell);

DataCols=c-4;

Rows=r-1;

% Getting ProcessedData

ProcessedData=cell2mat(DTWeather_Cell(2:end,:));

%% N Point Average Method for Filling missing Data in TEMPERATURE, WIND, RELATIVE HUMIDITY

RaN=zeros(N,DataCols); % Initializing the Running Value Storage used in NaN Value Filling 

% NPointAverageN=sum(RaN)/N; % Calculating the Running Average

Second=0; % Debugger

% FOR LOOP for Point-Wise Filling of NaN and Zero Values (Top to Bottom)

for i=1:Rows
    
    Second=Second+1 % Debugger
    
    RaCounter=rem(i,N); % For using Running Value Storage Vector to cyclically update its N Values with the next value
    
    if RaCounter==0
        
        RaCounter=N;
        
    end
    
    % FOR LOOP for Each Data Column
    
    for k=1:DataCols
        
        if (isnan(ProcessedData(i,k+4))) %(isnan(ProcessedData(i,k+4)))||(ProcessedData(i,k+4)==0)[Modification: Fill only Data that is NaN]
            
            NPointAverageN=sum(RaN(:,k))/N; % Calculating the Running Average
            
            ProcessedData(i,k+4)=NPointAverageN; % Updating NaN Value with Running Average Value
        
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        else
            
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        end
        
           

        
        
    end
    
    
    
end

% FOR LOOP for Point-Wise Filling of NaN and Zero Values (Bottom to Top)

Third=0; % Debugger

for i=Rows:-1:1
    
    Third=Third+1 % Debugger
    
    RaCounter=rem(i,N); % For using Running Value Storage Vector to cyclically update its N Values with the next value
    
    if RaCounter==0
        
        RaCounter=N;
        
    end
    
    % FOR LOOP for Each Data Column
    
    for k=1:DataCols
        
        if (isnan(ProcessedData(i,k+4))) %(isnan(ProcessedData(i,k+4)))||(ProcessedData(i,k+4)==0)[Modification: Fill only Data that is NaN]
            
            NPointAverageN=sum(RaN(:,k))/N; % Calculating the Running Average
            
            ProcessedData(i,k+4)=NPointAverageN; % Updating NaN Value with Running Average Value
        
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        else
            
            RaN(RaCounter,k)=ProcessedData(i,k+4);
            
        end
        
           

        
        
    end
    
    
    
end

%% Creating DTWeather_Cleaned_Cell

DTWeather_Cleaned_Cell=vertcat(DTWeather_Cell(1,:),mat2cell(ProcessedData));

end

