%% Getting Data from Wind_GUI_MainPage GUI Window

Wind_GUI_MainPage=getappdata(0,'Wind_GUI_MainPage');
SimParameters=getappdata(Wind_GUI_MainPage,'SimParameters');

% Disintegrating Cell SimParameters

PrjName=SimParameters{1,1} ;
PlantCapacity=SimParameters{1,2} ;
Lat=SimParameters{1,3} ;
Long=SimParameters{1,4} ;
Altitude=SimParameters{1,5} ;
lpy=SimParameters{1,6} ;
nolpy=SimParameters{1,7} ;
StartMonth=SimParameters{1,8} ;
StartDay=SimParameters{1,9} ;
EndMonth=SimParameters{1,10} ;
EndDay=SimParameters{1,11} ;
StartYear=SimParameters{1,12} ;
Res=SimParameters{1,13} ;
Sim1=SimParameters{1,14} ;
Sim2=SimParameters{1,15} ;
Temp=SimParameters{1,16} ;
WS=SimParameters{1,17} ;