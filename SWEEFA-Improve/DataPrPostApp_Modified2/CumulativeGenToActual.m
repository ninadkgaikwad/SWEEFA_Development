function [ActualData,len1]=CumulativeGenToActual(ProcessedData,Res,GenCapacity,rrnum,DataCols,TotDays,len,Lat)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Initializing ActualData Matrix to the Date & Time Values of ProcessedData matrix and remaining Data Columns as Zeros

ActualData=zeros(rrnum,(4+DataCols));

ActualData=ProcessedData(:,1:4);

Zero=zeros(rrnum,DataCols);

len1=DataCols-1;

ActualData(:,5:(5+len1))=Zero;

% Computation of Data Points in ONE HOUR

HourPoints=60/Res;

% FOR LOOP for Point-Wise Conversion of Cumulative Data to Distributed Data (Actual)

for i=1:(rrnum-1)
    
    %% Computation of Theoretical Maximum Time Step Generation
    
    % Computing Day Number (n) using Pre-defined Function
    
    [n]=JulianDay(ProcessedData(i,1),ProcessedData(i,2),ProcessedData(i,3));    
    
    % Computing Declination (dec) using Pre-defined Function
    
    [ dec ] = Declination( n );
    
    % Computing Sunset (Ss) and Sunrise (Sr) Times using Pre-dfined Function
    
    [ Sr,Ss,Indi ] = SunRiseSet(Lat,dec );
    
    if Indi==0
        
        D=Ss-Sr;
        
        TheoreticalMax=(D/(D*HourPoints))*GenCapacity;
        
    elseif Indi==1
        
        D=24;
        
        TheoreticalMax=(D/(D*HourPoints))*GenCapacity;
        
    elseif Indi==-1
        
        TheoreticalMax=0*GenCapacity;
        
    end
    
    
   %% FOR LOOP for Computation of Each Data Column
    
    for j=5:(len1+5)
        
        a=ProcessedData(i+1,j)-ProcessedData(i,j);
        
        if (a<=TheoreticalMax(1,j-4))&&(a>=0) % No Need For Correction
            
            ActualData(i+1,j)=a;
            
        elseif a>TheoreticalMax(1,j-4) % Counter has Reset to Higher Value
            
            ActualData(i+1,j)=NaN;
            
        elseif a<0 % Counter has Reset to Lower Value
            
            ActualData(i+1,j)=NaN;
            
        elseif isnan(a) % There is a Missing Value in the Data
            
            ActualData(i+1,j)=NaN;
            
        end
        
    end
    
end      
        
    


        
        
        





end

