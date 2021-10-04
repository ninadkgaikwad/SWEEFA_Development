function [Detrending_LagPairs,ARMA_LagPairs_Cell] = ARIMA_AnalysisMode_LagPairGenerator(DetrendingLag_Convoluted,DetrendingLag_NonConvoluted,Single_LagNumber_Vector,Seasonal_LagNumber_Vector,ARIMA_ModelOrder_Convoluted,ARIMA_ModelOrder_NonConvoluted,AR_LagNumber_Vector,MA_LagNumber_Vector)

%% Function Details:

% DetrendingLag_Convoluted = 
% DetrendingLag_NonConvoluted = 
% Single_LagNumber_Vector = 
% Seasonal_LagNumber_Vector = 
% ARIMA_ModelOrder_Convoluted = 
% ARIMA_ModelOrder_NonConvoluted = 
% AR_LagNumber_Vector = 
% MA_LagNumber_Vector = 

%% Creating Lag-Pairs

% For Detrending Lags

    % Getting Lengths of Lag Vectors
    
    SingleLag_Len=length(Single_LagNumber_Vector);
    SeasonalLag_Len=length(Seasonal_LagNumber_Vector);

if (DetrendingLag_NonConvoluted==1) % Non-Convoluted is Selected  
    
    % Creating Lag Pairs for Detrending Lags
    
    if (SingleLag_Len<=SeasonalLag_Len) 
        
        for i=1:SingleLag_Len % For Each Lag in Single Lags            
                      
           Detrending_LagPairs(1,i)=Single_LagNumber_Vector(1,i);
           Detrending_LagPairs(2,i)=Seasonal_LagNumber_Vector(1,i);
            
        end
        
    elseif (SeasonalLag_Len<=SingleLag_Len)
        
        for i=1:SeasonalLag_Len % For Each Lag in Seasonal Lags            
                      
           Detrending_LagPairs(1,i)=Single_LagNumber_Vector(1,i);
           Detrending_LagPairs(2,i)=Seasonal_LagNumber_Vector(1,i);
            
        end        
        
    end
    
elseif (DetrendingLag_Convoluted==1) % Convoluted is Selected
    
    % Creating Lag Pairs for Detrending Lags
    
    k=0; % Loop Counter Intialization
    
    for i=1:SingleLag_Len % For Each Lag in Single Lags
        
        for j=1:SeasonalLag_Len % For Each Lag in Seasonal Lags
            
            % Incrementing the Loop Counter
            
            k=k+1;
            
            Detrending_LagPairs(1,k)=Single_LagNumber_Vector(1,i);
            Detrending_LagPairs(2,k)=Seasonal_LagNumber_Vector(1,j);            
            
        end
        
    end
    
end

% For AR-MA  Lags

    % Getting Lengths of Lag Vectors
    
    AR_Lag_Len=length(AR_LagNumber_Vector);
    MA_Lag_Len=length(MA_LagNumber_Vector);

    % Creating AR_Lag_Cell
    
    for i=1:AR_Lag_Len % For Each AR Lag Value
        
        AR_Lags=AR_LagNumber_Vector(1,(1:i));
        
        AR_Lag_Cell(1,i)={AR_Lags};
        
    end
    
    % Creating MA_Lag_Cell
    
    for i=1:MA_Lag_Len % For Each MA Lag Value
        
        MA_Lags=MA_LagNumber_Vector(1,(1:i));
        
        MA_Lag_Cell(1,i)={MA_Lags};        
        
    end        

if (ARIMA_ModelOrder_NonConvoluted==1) % Non-Convoluted is Selected
    
    % Creating Lag Pairs for AR-MA Lags
    
    if (AR_Lag_Len<=MA_Lag_Len) 
        
        for i=1:AR_Lag_Len % For Each Lag in AR Lag Cell           
                      
           ARMA_LagPairs_Cell(1,i)={AR_Lag_Cell{1,i}};
           ARMA_LagPairs_Cell(2,i)={MA_Lag_Cell{1,i}};
            
        end
        
    elseif (MA_Lag_Len<=AR_Lag_Len)
        
        for i=1:MA_Lag_Len % For Each Lag in MA Lag Cell            
                      
           ARMA_LagPairs_Cell(1,i)={AR_Lag_Cell{1,i}};
           ARMA_LagPairs_Cell(2,i)={MA_Lag_Cell{1,i}};
            
        end        
        
    end    
    
elseif (ARIMA_ModelOrder_Convoluted==1) % Convoluted is Selected
    
    % Creating Lag Pairs for Detrending Lags
    
    k=0; % Loop Counter Intialization
    
    for i=1:AR_Lag_Len % For Each Lag in AR Lag Cell
        
        for j=1:MA_Lag_Len % For Each Lag in MA Lag Cell
            
            % Incrementing the Loop Counter
            
            k=k+1;
            
            ARMA_LagPairs_Cell(1,k)={AR_Lag_Cell{1,i}};
            ARMA_LagPairs_Cell(2,k)={MA_Lag_Cell{1,j}};            
            
        end
        
    end    
    
end

end

