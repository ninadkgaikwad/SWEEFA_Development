function [AllParameters_Disintegrated_Cell]=WTG_AllParametersDisintegrator(AllParameters,SheetNum,WTGGenCleanAlgorithm)

%% Function Details:

% AllParameters = A Cell Structure containiing Wind Plant Static Information
% SheetNum = A Scalar containing the Ordered Number of the Sheet
% WTGGenCleanAlgorithm = A Scalar containing information for WTG Power/Energy Cleaning Algorithm ; If 1 , Then Use N-Point Average Method ; If 2 , Then Use Standard Power Curve ; If 3 , Then Use Averaged Power Curves per Turbine ; If 4 , Then Use Averaged Power Curve for Plant

%% Appropriately Disintegrating AllParameters

% Simpe Disintegration of AllParameters

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
    
    WG_TurbineType_Total=T1+T2+T3+T4;

    % Disintegrating Parameters_T1

    sub_T1=Parameters_T1{1,1} ;
    subnum_T1=Parameters_T1{1,2} ;
    LatLongAlt_T1=Parameters_T1{1,9} ;

    % Disintegrating Parameters_T2

    sub_T2=Parameters_T2{1,1} ;
    subnum_T2=Parameters_T2{1,2} ;
    LatLongAlt_T2=Parameters_T2{1,9} ;

    % Disintegrating Parameters_T3

    sub_T3=Parameters_T3{1,1} ;
    subnum_T3=Parameters_T3{1,2} ;
    LatLongAlt_T3=Parameters_T3{1,9} ;

    % Disintegrating Parameters_T4

    sub_T4=Parameters_T4{1,1} ;
    subnum_T4=Parameters_T4{1,2} ;
    LatLongAlt_T4=Parameters_T4{1,9} ;

%% Creating AllParameters_Disintegrated according to WTGGenCleanAlgorithm

if ((WTGGenCleanAlgorithm==2)||(WTGGenCleanAlgorithm==3)) % Using Standard/Avergaed per Turbine Power Curves
    
    % Computing Correct Indices for Computation using External Function
    
    sub_T=[sub_T1,sub_T2,sub_T3,sub_T4];
    subnum_T={subnum_T1,subnum_T2,subnum_T3,subnum_T4};
    
    [WeatherFile_Indices_Cell,SubType_Indices_Corrected_Cell]=WTG_CorrectIndex_CompOpt34_Generator(WG_TurbineType,sub_T,subnum_T);       
  
    % Disintegrating WeatherFile_Indices_Cell
    WeatherFile_Indices_T1=WeatherFile_Indices_Cell{1,1};
    WeatherFile_Indices_T2=WeatherFile_Indices_Cell{1,2};
    WeatherFile_Indices_T3=WeatherFile_Indices_Cell{1,3};
    WeatherFile_Indices_T4=WeatherFile_Indices_Cell{1,4};
    
    % Finding the WTGType (1,2,3,4)
    
    if (~isempty(find(WeatherFile_Indices_T1==SheetNum))) % For WTG-Type==1
        
        WTGType=1;
        
    elseif (~isempty(find(WeatherFile_Indices_T2==SheetNum))) % For WTG-Type==2 
        
        WTGType=2;        
        
    elseif (~isempty(find(WeatherFile_Indices_T3==SheetNum))) % For WTG-Type==3
        
        WTGType=3;
        
    elseif (~isempty(find(WeatherFile_Indices_T4==SheetNum))) % For WTG-Type==4
        
        WTGType=4;
        
    end          
  
   % Getting the Correct Sub-Type Index Using External Function 
   
   WeatherFile_Index=SheetNum;

   SubType_Index=WTG_SubType_Index_Generator(SubType_Indices_Corrected_Cell{1,WTGType},WeatherFile_Index);     
    
   % Creating AllParameters_Disintegrated_Cell according to WTGGenCleanAlgorithm
   
   if (WTGGenCleanAlgorithm==2) % Using Standard Power Curves
       
       % Disintegrating AllParameters
       
       Parameters=AllParameters{1,(WTGType+1)} ;
       
       % Disintegrating Parameters
       
        sub=Parameters{1,1} ;
        subnum=Parameters{1,2} ;
        hub=Parameters{1,3} ;
        Power=Parameters{1,4} ;
        cutin=Parameters{1,5} ;
        rated=Parameters{1,6} ;
        cutout=Parameters{1,7} ;
        rotrad=Parameters{1,8} ;
        LatLongAlt=Parameters{1,9} ;
        
       % Getting the Correct Variables as per the SubType_Index and WeatherFile_Index
       
        HubHeight=hub(1,SubType_Index) ;
        PowerCurve=Power{1,SubType_Index} ;
        CutIn=cutin(1,SubType_Index) ;
        RatedPower=rated(1,SubType_Index) ;
        CutOut=cutout(1,SubType_Index) ;
        RotRad=rotrad(1,SubType_Index) ;
        Altitude=LatLongAlt(find(WeatherFile_Indices_Cell{1,WTGType}==SheetNum),3) ;
        
        % Creating AllParameters_Disintegrated_Cell
        
       AllParameters_Disintegrated_Cell={sub,subnum,HubHeight,PowerCurve,CutIn,RatedPower,CutOut,RotRad,Altitude};
        
   elseif (WTGGenCleanAlgorithm==3) % Using Averaged Power Curves per Turbine
       
       % Disintegrating AllParameters
       
       Parameters=AllParameters{1,(WTGType+1)} ;
       
       % Disintegrating Parameters
       
        sub=Parameters{1,1} ;
        subnum=Parameters{1,2} ;
        hub=Parameters{1,3} ;
        Power=Parameters{1,4} ;
        cutin=Parameters{1,5} ;
        rated=Parameters{1,6} ;
        cutout=Parameters{1,7} ;
        rotrad=Parameters{1,8} ;
        LatLongAlt=Parameters{1,9} ;
        
       % Getting the Correct Variables as per the SubType_Index and WeatherFile_Index
       
        HubHeight=hub(1,SubType_Index) ;
        PowerCurve=Power{1,find(WeatherFile_Indices_Cell{1,WTGType}==SheetNum)} ;
        CutIn=cutin(1,SubType_Index) ;
        RatedPower=rated(1,SubType_Index) ;
        CutOut=cutout(1,SubType_Index) ;
        RotRad=rotrad(1,SubType_Index) ;
        Altitude=LatLongAlt(find(WeatherFile_Indices_Cell{1,WTGType}==SheetNum),3) ;
        
        % Creating AllParameters_Disintegrated_Cell
        
       AllParameters_Disintegrated_Cell={sub,subnum,HubHeight,PowerCurve,CutIn,RatedPower,CutOut,RotRad,Altitude};             
       
   end
   
elseif (WTGGenCleanAlgorithm==4) % Using Averaged Power Curve per Plant
    
    % Finding the WTGType (1,2,3,4)
    
    if (SheetNum==1) % For WTG-Type==1
        
        WTGType=1;
        
    elseif (SheetNum==2) % For WTG-Type==2 
        
        WTGType=2;        
        
    elseif (SheetNum==3) % For WTG-Type==3
        
        WTGType=3;
        
    elseif (SheetNum==4) % For WTG-Type==4
        
        WTGType=4;
        
    end     
    
    % Computing Average Lat-Long-Alt for each WTG Type and entire Plant using External Function
    
    [Avg_LatLongAlt_T1,Avg_LatLongAlt_T2,Avg_LatLongAlt_T3,Avg_LatLongAlt_T4,~]=WTG_Average_LatLongAlt_Generator(LatLongAlt_T1,LatLongAlt_T2,LatLongAlt_T3,LatLongAlt_T4,WG_TurbineType);
    
    Avg_LatLongAlt=[Avg_LatLongAlt_T1,Avg_LatLongAlt_T2,Avg_LatLongAlt_T3,Avg_LatLongAlt_T4];
    
       % Disintegrating AllParameters
       
       Parameters=AllParameters{1,(WTGType+1)} ;
       
       % Disintegrating Parameters
       
        sub=Parameters{1,1} ;
        subnum=Parameters{1,2} ;
        hub=Parameters{1,3} ;
        Power=Parameters{1,4} ;
        cutin=Parameters{1,5} ;
        rated=Parameters{1,6} ;
        cutout=Parameters{1,7} ;
        rotrad=Parameters{1,8} ;
        LatLongAlt=Parameters{1,9} ;
        
        % Computing Total Number of Turbines 
        
        subnum_Total=sum(subnum);
        
       % Computing Average Cut-In Speed of Turbines using External Function 
       
       [CutIn]=WTG_PlantWTGTypeLevel_Averager(subnum,subnum_Total,cutin); 
       
       % Computing Average Cut-Out Speed of Turbines using External Function
       
       [CutOut]=WTG_PlantWTGTypeLevel_Averager(subnum,subnum_Total,cutout);
       
       % Computing Average Hub-Height of Turbines using External Function
    
        [HubHeight]=WTG_PlantWTGTypeLevel_Averager(subnum,subnum_Total,hub);
       
       % Computing Average Rotor-Radius of Turbines using External Function 
       
       [RotRad]=WTG_PlantWTGTypeLevel_Averager(subnum,subnum_Total,rotrad);
       
       % Computing Average Rated-Power of Turbines using External Function 
       
       [RatedPower]=WTG_PlantWTGTypeLevel_Averager(subnum,subnum_Total,rated);       
       
       % Getting Altitude
       
       LatLongAlt_Avg=Avg_LatLongAlt(1,WTGType);
       
       Altitude=LatLongAlt_Avg(1,3);
       
       % Getting PowerCurve
       
       PowerCurve=Power{1,1};
     
       % Creating AllParameters_Disintegrated_Cell
        
       AllParameters_Disintegrated_Cell={sub,subnum,HubHeight,PowerCurve,CutIn,RatedPower,CutOut,RotRad,Altitude};           
       
       
end

end

