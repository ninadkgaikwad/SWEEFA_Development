function [DateTime_Array,TrainingDataSeries_Duration_Corrected,TrainingDataSeries_WindowLengths,ForecastedDataSeries_Duration_Corrected,ForecastedDataSeries_WindowLengths,ForecastedDataSeries_DateTime_Array_Cell] = ARIMA_AnalysisMode_TrainForecastDuration_Generator(TrainingDataSeries_Duration,ForecastedDataSeries_Duration,Start_DateTime,End_DateTime,Res);

%% Function Details:

% TrainingDataSeries_Duration = 
% ForecastedDataSeries_Duration = 
% Start_DateTime = 
% End_DateTime = 
% Res = 

%% Creating Forecast Duration Dates and Indices 

% Creating Date-Time Array between Start and End Date-Time

TimeDuration_Res = duration(0,Res,0); % Creating Resolution Duration

DateTime_Temp=Start_DateTime;

LoopCounter=0; % Initialization

while (DateTime_Temp<End_DateTime)
    
    % Incrementing the Loop Counter
    
    LoopCounter=LoopCounter+1;
    
    % Filling the DateTime_Array
    
    if (LoopCounter==1) % For the First Iteration
        
        DateTime_Array(LoopCounter,1)=Start_DateTime;
        
    else
        
        DateTime_Temp=DateTime_Temp+TimeDuration_Res;
        
        DateTime_Array(LoopCounter,1)=DateTime_Temp;
        
    end
    
end  

% Computing End Indices and WindowLengths for Training Duration and Correcting Training Duration Values

for i=1:length(TrainingDataSeries_Duration) % For Each training Duration Value
    
    % Correcting TrainingDataSeries_Duration Values to be exact multiples of Res    
    
    TrainingDuration_Val=TrainingDataSeries_Duration(1,i);
    
    TrainingDuration_Division=round((TrainingDuration_Val/Res));
    
    TrainingDuration_Val_Corrected=TrainingDuration_Division*Res;
    
    TrainingDataSeries_Duration_Corrected(1,i)=TrainingDuration_Val_Corrected;
    
    % Getting the TrainingDataSeries_Duration Window Lengths
    
    TimeDuration_Training = duration(0,TrainingDuration_Val_Corrected,0);
    
    End_DateTime_Training=DateTime_Array(1,1)+TimeDuration_Training;
    
    End_Indices_Training=find(DateTime_Array==End_DateTime_Training);
    
    TrainingDataSeries_WindowLengths(1,i)=End_Indices_Training-1; % -1 is Correction from Debugging
    
end

% Computing End Indices and WindowLengths for Forecasted Duration and Correcting Forecasted Duration Values

for i=1:length(ForecastedDataSeries_Duration) % For Each Forecasted Duration Value

    % Correcting ForecastedDataSeries_Duration Values to be exact multiples of Res    

    ForecastedDuration_Val=ForecastedDataSeries_Duration(1,i);

    ForecastedDuration_Division=round((ForecastedDuration_Val/Res));

    ForecastedDuration_Val_Corrected=ForecastedDuration_Division*Res;

    ForecastedDataSeries_Duration_Corrected(1,i)=ForecastedDuration_Val_Corrected;

    % Getting the ForecastedDataSeries_Duration Window Lengths

    TimeDuration_Forecasted = duration(0,ForecastedDuration_Val_Corrected,0);

    End_DateTime_Forecasted=DateTime_Array(1,1)+TimeDuration_Forecasted;

    End_Indices_Forecasted=find(DateTime_Array==End_DateTime_Forecasted);

    ForecastedDataSeries_WindowLengths(1,i)=End_Indices_Forecasted-1; % -1 is Correction from Debugging        

end 

% Getting Forecast Duration Start-End Date-Time and Corresponing Indices

for i=1:length(TrainingDataSeries_Duration) % For Each training Duration Value
    
    End_Index_Training=TrainingDataSeries_WindowLengths(1,i);
    
    Start_Index_Forecasted=End_Index_Training+1;
    
    for j=1:length(ForecastedDataSeries_Duration) % For Each Forecasted Duration Value
    
       Forecasted_WindowLength=ForecastedDataSeries_WindowLengths(1,j);
       
       ForecastedDataSeries_Duration_Corrected_Value=ForecastedDataSeries_Duration_Corrected(1,j);
       
       Duration_Forecasted=duration(0,ForecastedDataSeries_Duration_Corrected_Value,0);
       
       End_Index_Forecasted=Start_Index_Forecasted+(Forecasted_WindowLength-1);
       
       DateTime_Temp1=DateTime_Array(Start_Index_Forecasted,1);
       
       LoopCounter1=0; % Initialization
       
       Forecasted_DateTime_Array=[DateTime_Temp1,DateTime_Temp1]; % Initialization with [] is from Debugging
       
       Forecasted_DateTime_Array1=[DateTime_Temp1]; % Initialization with [] is from Debugging
       
       Forecasted_DateTime_Array2=[DateTime_Temp1]; % Initialization with [] is from Debugging
       
        while (DateTime_Temp1<End_DateTime)

            % Incrementing the Loop Counter

            LoopCounter1=LoopCounter1+1;

            % Filling the DateTime_Array

            if (LoopCounter1==1) % For the First Iteration
                
                Forecasted_Start_DateTime=DateTime_Temp1;
                
                Forecasted_End_DateTime=DateTime_Temp1+Duration_Forecasted;

                Forecasted_DateTime_Array1(LoopCounter1,1)=Forecasted_Start_DateTime;

                Forecasted_DateTime_Array2(LoopCounter1,1)=Forecasted_End_DateTime;
                
            else

                DateTime_Temp1=Forecasted_DateTime_Array2((LoopCounter1-1),1)+TimeDuration_Res;
                
                Forecasted_Start_DateTime=DateTime_Temp1;
                
                Forecasted_End_DateTime=DateTime_Temp1+Duration_Forecasted;
                
                if (Forecasted_End_DateTime>End_DateTime)
                    
                   break; 
                    
                end

                Forecasted_DateTime_Array1(LoopCounter1,1)=Forecasted_Start_DateTime;   
                
                Forecasted_DateTime_Array2(LoopCounter1,1)=Forecasted_End_DateTime;

            end

        end
        
        Forecasted_DateTime_Array=horzcat(Forecasted_DateTime_Array1,Forecasted_DateTime_Array2);
        
        ForecastedDataSeries_DateTime_Array_Cell(i,j)={Forecasted_DateTime_Array};        

    end  
            
end

end

