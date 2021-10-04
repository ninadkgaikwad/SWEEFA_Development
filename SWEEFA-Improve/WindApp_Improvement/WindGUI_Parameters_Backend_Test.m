%% Data Acquisition App Cell
WG_TurbineType = [T1 T2 T3 T4];

Parameters_T1 = {sub_T1, subnum_T1, hub_T1, Power_T1, cutin_T1, rated_T1, cutout_T1, rotrad_T1};

Parameters_T2 = {sub_T2, subnum_T2, hub_T2, Power_T2, cutin_T2, rated_T2, cutout_T2, rotrad_T2};

Parameters_T3 = {sub_T3, subnum_T3, hub_T3, Power_T3, cutin_T3, rated_T3, cutout_T3, rotrad_T3};

Parameters_T4 = {sub_T4, subnum_T4, hub_T4, Power_T4, cutin_T4, rated_T4, cutout_T4, rotrad_T4};
      
AllParameters = {WG_TurbineType, Parameters_T1, Parameters_T2, Parameters_T3, Parameters_T4};
   
%% Loss Parameters Cell

% Jensen
WakeModelParameters = {Jensen,Frandsen,a_J, k_J, x_J, a_F, k_F, x_F, alpha};
   
% Frandsen
WakeModelParameters = {Jensen,Frandsen,a_J, k_J, x_J, a_F, k_F, x_F, alpha};
   
WindLossParameters={Wake1,Wake2,DenSTC,OhmicLoss,TransLoss,WakeLoss,WakeModelParameters,Perf_Rat,Turbine_File,PR,ActiveTurbines,Terrain,HeightAnemometer};

%% Weibull Parameters Cell

months=[jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,decc];

Weibull_Parameters={WRes, k, YrWs, YrTemp, MrWs, MrTemp, months, yr, mr};
