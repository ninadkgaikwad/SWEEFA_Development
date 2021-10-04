function [ DHIirrFile ] = ComputeDHIFromGHI( lpy, StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res, Lat )
%UNTITLED4 Summary of this function goes here
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

if (StartMonth~=1)&&(n(1,1)~=1)
    
    % Initializing Indicator for getting Correct Index for the T, WS, GhiInsoFile
    
    IndexIndi=1;
    
else
    
    % Initializing Indicator for getting Correct Index for the T, WS, GhiInsoFile
    
    IndexIndi=0;
    
end

%% Computing Date-Time Matrix

[ DateTimeMatrix,TimeT ] = CreateDateTimeMatrix( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,Res,1,4  );

TimeVector=DateTimeMatrix(1:DayDataPoints,4);

[R,C]=size(DateTimeMatrix);

DHIirrFile=zeros(R,C);

DHIirrFile(:,1:4)=DateTimeMatrix(:,1:4);

DHIVector=zeros(DayDataPoints,1);

DayCounter=0;

count1=0;

% debug=0;

for j=n

    DHI=0;
    
    count1=count1+1 % For Debugging

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

    k=0; % Loop Counter initialization for Time-Step Level Simulation

    % User Defined Time-Step Level Simulation

    count2=0 % For Debugging

    for k=1:DayLen

        % Incrementing TotDataPointsCounter 

%         TotDataPointsCounter=TotDataPointsCounter+1;

        count2=count2+1 % For Debugging

        if IndexIndi==0

            [ GHIIndex] = GHIHHresIndex( j,hp(1,k),HHres ); % Computing correct index for GHI File 

        elseif IndexIndi==1

%                     [ GHIIndexx] = GHIHHresIndex( j,hp(1,k),HHres ); % Computing correct index for GHI File 
% 
%                      GHIIndex=LenGhiInsoFilereq-(LenYearlyResFile-GHIIndexx);     

            [ GHIIndex] = GHIHHresIndex( DayCounter,hp(1,k),HHres ); % For Weather Files which are not of complete one year


        end


        [ DHI(k,1), Id] = BeamDiffGHI(j, GhiInsoFile(GHIIndex,1),beta(1,k) ); % Computing Beam & Diffused Irradiance at given moment in the specified day

    end              

    DHIVector(Istart:(Istart+DayLen-1),1)=DHI;

    StartIndex=((DayCounter-1)*DayDataPoints)+1;

    EndIndex=(DayCounter)*DayDataPoints;

    DHIirrFile(StartIndex:EndIndex,C)=DHIVector(:,1);

    
end

% DHI File

filename = [Filename,'_Converted_File_DHI.xlsx'];

sheet = 1;

xlRange = 'A2';

xlswrite(filename,DHIirrFile,sheet,xlRange);

