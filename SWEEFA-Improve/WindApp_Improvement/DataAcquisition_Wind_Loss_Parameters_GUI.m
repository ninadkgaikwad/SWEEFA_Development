%% Getting Data from Wind_Loss_Parameters_GUI Window

Wind_Loss_Parameters_GUI=getappdata(0,'Wind_Loss_Parameters_GUI');
WindLossParameters=getappdata(Wind_Loss_Parameters_GU,'WindLossParameters');

% Disintegrating Cell SimParameters

Wake1=WindLossParameters{1,1} ;
Wake2=WindLossParameters{1,2} ;
DenSTC=WindLossParameters{1,3} ;
OhmicLoss=WindLossParameters{1,4} ;
TransLoss=WindLossParameters{1,5} ;
WakeLoss=WindLossParameters{1,6} ;
WakeModelParameters=WindLossParameters{1,7} ;
Perf_Rat=WindLossParameters{1,8} ;
Turbine_File=WindLossParameters{1,9} ;
PR=WindLossParameters{1,10} ;
ActiveTurbines=WindLossParameters{1,11} ;
Terrain=WindLossParameters{1,12} ;
HeightAnemometer=WindLossParameters{1,13} ;

% Disintegrating Cell WakeModelParameters

Jensen=WakeModelParameters{1,1} ; 
Frandsen=WakeModelParameters{1,2} ; 
a_J=WakeModelParameters{1,3} ; 
k_J=WakeModelParameters{1,4} ; 
x_J=WakeModelParameters{1,5} ; 
a_F=WakeModelParameters{1,6} ; 
k_F=WakeModelParameters{1,7} ; 
x_F=WakeModelParameters{1,8} ; 
Jensealpha=WakeModelParameters{1,9} ; 

% Disintegrating Cell ActiveTurbines

ActiveTurbines_T1=ActiveTurbines{1,1};
ActiveTurbines_T2=ActiveTurbines{1,2};
ActiveTurbines_T3=ActiveTurbines{1,3};
ActiveTurbines_T4=ActiveTurbines{1,4};


