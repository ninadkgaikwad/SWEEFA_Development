function [ GHIirrFile, DHIirrFile ] = InsolationToGHIConverter( lpy, StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res, Lat, Distribution )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%% Getting the Raw Data File in the MATLAB WorkSpace

% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[ProcessedData]=xlsread(Fullpathname,1);

GhiInsoFile=ProcessedData;

%% Computing Julian Days Vector and

% Leap Year Information from User
LeapYear=lpy;

if LeapYear==1
yeardays=366;
elseif LeapYear==0
yeardays=365;
end

% Computing Total Number of Days to be simulated from user input
[StartD,EndD]=DaysToCompute( LeapYear,StartDay,StartMonth,EndDay,EndMonth );

n=StartD:EndD; % Day Number Vector for Simulation

DayNum=length(n);

TotDays=length(n); % Computing Total Simulation Days

% Latitude Information from the User
L=Lat;

% Simulation temporal Resolution Information from the User
HHres=Res;

% Data Points in a Day

DayDataPoints=24*(60/Res);

%% Computing Date-Time Matrix

[ DateTimeMatrix,TimeT ] = CreateDateTimeMatrix( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,1,4  );

TimeVector=DateTimeMatrix(1:DayDataPoints,4);

[R,C]=size(DateTimeMatrix);

GHIirrFile=zeros(R,C);

DHIirrFile=zeros(R,C);

GHIirrFile(:,1:4)=DateTimeMatrix(:,1:4);

DHIirrFile(:,1:4)=DateTimeMatrix(:,1:4);

GHIVector=zeros(DayDataPoints,1);

DHIVector=zeros(DayDataPoints,1);

DayCounter=0;

% debug=0;

%% Computation of GHI
 for j=n
            DHI=0;     
     
            DayCounter=DayCounter+1; % Incrementing Day Counter

            [hp,ha,beta,phi,Sr,Ss,Indi] = Sun1(j,L,HHres); % The Sun1 function internally utilizes Declination, SunRiseSet, HourAngle and AltiAzi Functions

            TimeDifference=abs(Sr-TimeVector);
            
            [MinTime,Istart]=min(TimeDifference);
            
            % hp = Vector of Solar Time (in Decimal Time) for which Simulation will occur on the n^(th)day
            % ha = Vector of Hour Angles (in Degrees) corresponding to the Vector hp on the n^(th)day
            % beta = Vector of Solar Elevation Angles (in Degrees) corresponding to the Vector ha on the n^(th)day
            % phi = Vector of Solar Azimuth Angles (in Degrees) corresponding to the Vector ha on the n^(th)day
            % Sr = Sunrise in Solar Time (in Decimal Time) for the n^(th)day
            % Sr = Sunset in Solar Time (in Decimal Time) for the n^(th)day

            DayLen=length(hp); % For Computing PV Energy within the n^(th) day
            
            % Computing GHI (W/m^(2)) from Daily Insolation (Wh/m^(2)) accordance with the User-Defined Preference in
            
            if Distribution==1
                
                [ GHI] = GHIGaussianDistri( GhiInsoFile(j,1),Sr,Ss,Indi,HHres );
                
            elseif Distribution==2
                
                [ GHI] = GHISinusoidalDistri(GhiInsoFile(j,1),Sr,Ss,Indi,HHres);
                
            elseif Distribution==3
                
                [GHI] = GHIGauSinAvg( GhiInsoFile(j,1),Sr,Ss,Indi,HHres );
                
            end
            
            for k=1:DayLen
                
               % Incrementing TotDataPointsCounter 
                
               % TotDataPointsCounter=TotDataPointsCounter+1;

                [ DHI(k,1), Id] = BeamDiffGHI(j, GHI(1,k),beta(1,k) ); % Computing Beam & Diffused Irradiance at given moment in the specified day
                
            end
            
            % debug=debug+1
            
            GHI=GHI';
            
            GHIVector(Istart:(Istart+DayLen-1),1)=GHI;
            
            DHIVector(Istart:(Istart+DayLen-1),1)=DHI;
                         
            StartIndex=((DayCounter-1)*DayDataPoints)+1;

            EndIndex=(DayCounter)*DayDataPoints;
                
            
            
            GHIirrFile(StartIndex:EndIndex,C)=GHIVector(:,1);
            
            DHIirrFile(StartIndex:EndIndex,C)=DHIVector(:,1);


 end

 %% Writing the ProcessedData Matrix to an Excel File

 % GHI FIle
 
filename = [Filename,'_Converted_File_Irradiance.xlsx'];

sheet = 1;

xlRange = 'A2';

xlswrite(filename,GHIirrFile,sheet,xlRange);

% DHI File

filename = [Filename,'_Converted_File_DHI.xlsx'];

sheet = 1;

xlRange = 'A2';

xlswrite(filename,DHIirrFile,sheet,xlRange);

