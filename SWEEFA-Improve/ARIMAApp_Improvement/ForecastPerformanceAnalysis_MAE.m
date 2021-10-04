function [MAE_Matrix] = ForecastPerformanceAnalysis_MAE(ForecastMatrix, ActualMatrix)

%% Function Details:

% Forecast_Matrix =  Matrix Containing Columns of Forecasted Variables
% Actual_Matrix = Matrix Containing Columns of Actual Variables

% Note: Both the Forecaste_Matrix and the Actual_Matrix are ordered and arranged in an equivalent way

%% Computing MAE (Mean Absolute Error)

% Getting Size of Data Matrix

[Row,Col]=size(ActualMatrix);

N=Row; % Number of Data Points in each Column

% Computing MAE_Matrix

MAE_Matrix=(1/N) * (sum(abs(ForecastMatrix-ActualMatrix)));

end

