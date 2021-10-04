function [ARIMA_Estimated_Model_Cell,AIC_BIC_Matrix]=ARIMA_EstimatedModel_Generator(ARIMA_Model,TrainingDataset_Current)

%% Function Details:

% ARIMA_Model = 
% TrainingDataset_Current = 

%% Performing ARIMA Model Estimation

% Computing number of Data Column

[R,C]=size(TrainingDataset_Current);

DataCols=C-4;

% Model Estimation and AIC-BIC Calculation

ARIMA_Estimated_Model_Cell=cell(1,DataCols); % Initialization

for i=5:DataCols % For Each Data Column in Training Dataset
    
    % Estimating ARIMA Model
    
    SingleDataSeries=TrainingDataset_Current(:,i);
    
    [EstModel,EstParamCov,logL,info] = estimate(ARIMA_Model,SingleDataSeries);
    
    ARIMA_Estimated_Model_Cell(1,i)={EstModel};
    
    % Computing AIC and BIC Values

    numParam=length(info.X);

    numObs=length(SingleDataSeries);

    [aic,bic] = aicbic(logL,numParam,numObs); 
    
    AIC_BIC_Matrix(i,:)=[aic,bic];
    
end


end

