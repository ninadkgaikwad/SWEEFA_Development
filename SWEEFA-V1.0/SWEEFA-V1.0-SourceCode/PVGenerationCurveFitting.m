function [ ProcessedData ] = PVGenerationCurveFitting( ProcessedData,Day,Col,Res,Lat,n,NaNCheck )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Computing the DayDataPoints

DayDataPoints=24*(60/Res);

% Finding the SunRise and SunSet for the particular Day using Pre-defined Function

[~,~,~,~,Sr,Ss,~] = Sun1(n,Lat,Res);

% Computing the MID-POINT of the Gaussian Curve

MP=(Sr+Ss)/2;

% Computing the STARTING & ENDING ROW INDEX for the given DAY

Rstart=(DayDataPoints*(Day-1))+1;

Rend=Rstart+(DayDataPoints-1);

% Creating TIME & DATA COLUMN VECTORS between Sr and Ss as an INPUT to FITTING Function

TimeColumn=ProcessedData(Rstart:Rend,4); % Getting Complete Time Vector from ProcessedData Matrix

T1=find(TimeColumn>=Sr); % Getting Indices Greater Than Sr

T2=find(TimeColumn<=Ss); % Getting Indices Lesser Than Ss

T=intersect(T1,T2); % Getting Indices Between Sr and Ss

TT=T+(DayDataPoints*(Day-1)); % Correcting the Indices according to the Current Day

Time=ProcessedData(TT,4);

Data=ProcessedData(TT,(Col+4));

% Computing the Time Signatures/Correct Rows Asociated with the NaN Values in the Current Day

CorrectionRows=NaNCheck+(DayDataPoints*(Day-1));

% Curve Fitting with Gauss1

for i=1:length(Data) % Replacing NaN Values with Zeros for Easing Curve Fitting
    
    if isnan(Data(i,1))
        
        Data(i,1)=0;
        
    end
    
end

a=fit(Time,Data,'gauss1'); % Call to CURVE FITTING FUNCTION

coeff=coeffvalues(a); % Getting Co-Efficients of the Fitted Gauss Curve

a1=coeff(1,1);
b1=MP; % For reducing Error in fit
c1=coeff(1,3);


for i=CorrectionRows'
    
ProcessedData(i,Col+4)=(coeff(1,1))*exp(-((ProcessedData(i,4)-b1)/(coeff(1,3))).^2);

end


end

