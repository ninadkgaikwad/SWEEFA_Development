function [ DateTimeMatrix,TimeT ] = CreateDateTimeMatrix( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,DataCols,DateTimeCols  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[ Rows,Cols,TotDays ] = RowsColsToComputeDataCleaning( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,DataCols,DateTimeCols );

[ DateTimeMatrix,TimeT ] = StartEndCalender( StartYear,StartMonth,StartDay,TotDays,Res,DataCols );



end

