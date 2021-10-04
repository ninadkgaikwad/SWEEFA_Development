%% Getting Data from Wind_GUI_1 GUI Window

Wind_GUI_1=getappdata(0,'Wind_GUI_1');
AllParameters=getappdata(Wind_GUI_1,'AllParameters');

% Disintegrating Cell AllParameters

WG_TurbineType=AllParameters{1,1} ;
Parameters_T1=AllParameters{1,2} ;
Parameters_T2=AllParameters{1,3} ;
Parameters_T3=AllParameters{1,4} ;
Parameters_T4=AllParameters{1,5} ;

% Disintegrating WG_TurbineType

T1=WG_TurbineType(1,1) ;
T2=WG_TurbineType(1,2) ;
T3=WG_TurbineType(1,3) ;
T4=WG_TurbineType(1,4) ;

% Disintegrating Parameters_T1

sub_T1=Parameters_T1{1,1} ;
subnum_T1=Parameters_T1{1,2} ;
hub_T1=Parameters_T1{1,3} ;
Power_T1=Parameters_T1{1,4} ;
cutin_T1=Parameters_T1{1,5} ;
rated_T1=Parameters_T1{1,6} ;
cutout_T1=Parameters_T1{1,7} ;
rotrad_T1=Parameters_T1{1,8} ;

% Disintegrating Parameters_T2

sub_T2=Parameters_T2{1,1} ;
subnum_T2=Parameters_T2{1,2} ;
hub_T2=Parameters_T2{1,3} ;
Power_T2=Parameters_T2{1,4} ;
cutin_T2=Parameters_T2{1,5} ;
rated_T2=Parameters_T2{1,6} ;
cutout_T2=Parameters_T2{1,7} ;
rotrad_T2=Parameters_T2{1,8} ;

% Disintegrating Parameters_T3

sub_T3=Parameters_T3{1,1} ;
subnum_T3=Parameters_T3{1,2} ;
hub_T3=Parameters_T3{1,3} ;
Power_T3=Parameters_T3{1,4} ;
cutin_T3=Parameters_T3{1,5} ;
rated_T3=Parameters_T3{1,6} ;
cutout_T3=Parameters_T3{1,7} ;
rotrad_T3=Parameters_T3{1,8} ;

% Disintegrating Parameters_T4

sub_T4=Parameters_T4{1,1} ;
subnum_T4=Parameters_T4{1,2} ;
hub_T4=Parameters_T4{1,3} ;
Power_T4=Parameters_T4{1,4} ;
cutin_T4=Parameters_T4{1,5} ;
rated_T4=Parameters_T4{1,6} ;
cutout_T4=Parameters_T4{1,7} ;
rotrad_T4=Parameters_T4{1,8} ;
