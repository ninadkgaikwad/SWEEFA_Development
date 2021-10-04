function [MSE_Matrix] = ForecastPerformanceAnalysis_MSE(ForecastMatrix, ActualMatrix)

%% Function Details:

% Forecast_Matrix =  Matrix Containing Columns of Forecasted Variables
% Actual_Matrix = Matrix Containing Columns of Actual Variables

% Note: Both the Forecaste_Matrix and the Actual_Matrix are ordered and arranged in an equivalent way

%% Computing MAE (Mean Squared Error)

% Getting Size of Data Matrix

[Row,Col]=size(ActualMatrix);

N=Row; % Number of Data Points in each Column

% Computing MSE_Matrix

MSE_Matrix=(1/N) * (sum((ForecastMatrix-ActualMatrix).^(2)));

end


