function [ActualData]=WTG_CumulativeGenToActual(ProcessedData,AllParameters_Disintegrated_Cell,WindLossParameters,Temp,WS,TurbineStatus,Res,GenIrrad,WTGGenCleanAlgorithm,WTG_Gen_Deviation_Percent)

%% Function Details:

% ProcessedData = A Matrix conataining Day, Month, Year, Time and Generation Columns
% AllParameters_Disintegrated_Cell = A Cell strucuture containing all the relevant Wind Plant Static Info for the given Turbine or Plant Section
% WindLossParameters = A Cell Structure containing Wind Plant Loss Information 
% Temp = A Vector containing Time Series Temperature Values
% WS = A Vector containing Time Series Wind-Speed Values
% TurbineStatus = A Vector containing Time Series Turbine-Status Values
% Res = Time Step of the Data File in Minutes
% GenIrrad = Vector of numbers describing Data Columns to be either Generation Data (if, GenIrrad=1), or Power Data (if, GenIrrad=2), Irradiance Data (if, GenIrrad=0)
% WTGGenCleanAlgorithm = A Scalar containing information for WTG Power/Energy Cleaning Algorithm ; If 1 , Then Use N-Point Average Method ; If 2 , Then Use Standard Power Curve ; If 3 , Then Use Averaged Power Curves per Turbine ; If 4 , Then Use Averaged Power Curve for Plant
% WTG_Gen_Deviation_Percent = A Scalar containing percentage value by which Theoretical Max Generation of Wind Plant is computed

%% Cumulative Data to Actual

% Creating ActualData

ActualData=ProcessedData;

% FOR LOOP for Computation of Each Data Column

for i=1:Row

    a=ProcessedData(i+1,end)-ProcessedData(i,end);
    
    % Computing TheoreticalMax Generation Value using External Function
    
    [WTG_Generation] = WTGEnergySimulation_PointWise_ForecastMode( WS(i+1,1), Temp(i+1,1),TurbineStatus(i+1,1), Res,GenIrrad,AllParameters_Disintegrated_Cell,WindLossParameters,WTGGenCleanAlgorithm);

    TheoreticalMax=(1+(WTG_Gen_Deviation_Percent/100))*WTG_Generation;
    
    % Cumulative to Actual using TheoreticalMax
    
    if ((a<=TheoreticalMax)&&(a>=0)) % No Need For Correction

        ActualData(i+1,end)=a;

    elseif (a>TheoreticalMax) % Counter has Reset to Higher Value

        ActualData(i+1,end)=NaN;

    elseif (a<0) % Counter has Reset to Lower Value

        ActualData(i+1,end)=NaN;

    elseif (isnan(a)) % There is a Missing Value in the Data

        ActualData(i+1,end)=NaN;

    end

end

end

