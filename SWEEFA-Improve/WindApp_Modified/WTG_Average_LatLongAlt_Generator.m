function [Avg_LatLongAlt_T1,Avg_LatLongAlt_T2,Avg_LatLongAlt_T3,Avg_LatLongAlt_T4,Avg_LatLongAlt_Plant]=WTG_Average_LatLongAlt_Generator(LatLongAlt_T1,LatLongAlt_T2,LatLongAlt_T3,LatLongAlt_T4, WG_TurbineType)

%% Function Details

% LatLongAlt_T1,LatLongAlt_T2,LatLongAlt_T3,LatLongAlt_T4 = Latitude, Longitude and Altitude containing Matrices of the 4 WTG Types
% WG_TurbineType = Vector containing information of presence of each WTG Type; If WG_TurbineType(i)==1 , Then ith WTG Type is Present ; If WG_TurbineType(i)==0 , Then ith WTG Type is Absent

%% Computing the Averages - Latitude, Longitude and Altitude

% Computing Average Lat-Long-Alt for WTG1

if (WG_TurbineType(1,1)==1) % WTG1 Present
    
    Avg_LatLongAlt_T1=mean(LatLongAlt_T1);
    
elseif (WG_TurbineType(1,1)==0)% WTG1 Absent
    
    Avg_LatLongAlt_T1=[];
    
end

% Computing Average Lat-Long-Alt for WTG2

if (WG_TurbineType(1,2)==1) % WTG2 Present
    
    Avg_LatLongAlt_T2=mean(LatLongAlt_T2);
    
elseif (WG_TurbineType(1,2)==0)% WTG2 Absent
    
    Avg_LatLongAlt_T2=[];
    
end

% Computing Average Lat-Long-Alt for WTG3

if (WG_TurbineType(1,3)==1) % WTG3 Present
    
    Avg_LatLongAlt_T3=mean(LatLongAlt_T3);
    
elseif (WG_TurbineType(1,3)==0)% WTG3 Absent
    
    Avg_LatLongAlt_T3=[];
    
end

% Computing Average Lat-Long-Alt for WTG4

if (WG_TurbineType(1,4)==1) % WTG4 Present
    
    Avg_LatLongAlt_T4=mean(LatLongAlt_T4);
    
elseif (WG_TurbineType(1,4)==0)% WTG4 Absent
    
    Avg_LatLongAlt_T4=[];
    
end

%% Computing Average Lat-Long-Alt for the entire Plant

% Creating Cell Avg_LatLongAlt_WTG

Avg_LatLongAlt_WTG_Cell={Avg_LatLongAlt_T1,Avg_LatLongAlt_T2,Avg_LatLongAlt_T3,Avg_LatLongAlt_T4};

% Computing length of Len_Avg_LatLongAlt_WTG_Cell

Len_Avg_LatLongAlt_WTG_Cell=length(Avg_LatLongAlt_WTG_Cell);

% Initializing Avg_LatLongAlt_WTG_Plant

Avg_LatLongAlt_WTG_Plant=0;

Counter=0; % Initializing Counter

for i=1:Len_Avg_LatLongAlt_WTG_Cell % For each Avg_LatLongAlt_T
    
    if (isempty(Len_Avg_LatLongAlt_WTG_Cell{1,i}))
        
       continue; % Continue to the next Iteration 
        
    end
    
    Counter=Counter+1; % Incrementing Counter
    
    Avg_LatLongAlt_WTG_Plant=Avg_LatLongAlt_WTG_Plant+Len_Avg_LatLongAlt_WTG_Cell{1,i};
    
end

% Averaging Avg_LatLongAlt_WTG_Plant Column-Wise according to Counter

Avg_LatLongAlt_Plant = Avg_LatLongAlt_WTG_Plant/Counter;

end

