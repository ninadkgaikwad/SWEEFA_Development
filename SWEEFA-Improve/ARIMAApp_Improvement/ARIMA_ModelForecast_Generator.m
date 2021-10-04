function [ARIMA_ForecastData_Matrix,MAE_MSE_RMSE_Matrix]=ARIMA_ModelForecast_Generator(ARIMA_Estimated_Model_Cell,TrainingDataset_Current,TestDataset_Current)

%% Function Details:

% ARIMA_Estimated_Model_Cell = 
% TrainingDataset_Current = 
% TestDataset_Current =

%% Performing ARIMA Model Forecast

% Dividing the Training Dataset

TrainingDataset_DateTime_Matrix=TrainingDataset_Current(:,1:4);

TrainingDataset_Data_Matrix=TrainingDataset_Current(:,5:end);

% Dividing the Test Dataset

TestDataset_DateTime_Matrix=TestDataset_Current(:,1:4);

TestDataset_Data_Matrix=TestDataset_Current(:,5:end);

% Getting Size of TestDataset_Data_Matrix

[R,C]=size(TestDataset_Data_Matrix);

ForecastPoints=R;

% Initializing ARIMA_ForecastData_Matrix

ARIMA_ForecastData_Matrix=horzcat(TestDataset_DateTime_Matrix,zeros(R,C));

% ARIMA Model Forecast

for i=1:length(ARIMA_Estimated_Model_Cell) % For Each Estimated ARIMA Model for each Data Column
           
    ARIMA_Estimated_Model=ARIMA_Estimated_Model_Cell{1,i};
    
    % Getting Corresponding Training Data Column
    
    TrainingData_Col=TrainingDataset_Data_Matrix(:,i);
    
    ForecastData_Col=forecast(ARIMA_Estimated_Model,ForecastPoints,'Y0',TrainingData_Col);
    
    % Getting Corresponding Test Data Column
    
    TestData_Col=TestDataset_Data_Matrix(:,i);
    
    % Computing MAE_MSE_RMSE_Matrix
    
    [MAE] = ForecastPerformanceAnalysis_MAE(ForecastData_Col, TestData_Col);
    
    [MSE] = ForecastPerformanceAnalysis_MSE(ForecastData_Col, TestData_Col);
    
    [RMSE] = ForecastPerformanceAnalysis_RMSE(ForecastData_Col, TestData_Col);
    
    % Filling the ARIMA_ForecastData_Matrix
    
    ARIMA_ForecastData_Matrix(:,(i+4))=ForecastData_Col;
    
    % Filling the MAE_MSE_RMSE_Matrix
    
    MAE_MSE_RMSE_Matrix(i,:)=[MAE,MSE,RMSE];
    
end

end

