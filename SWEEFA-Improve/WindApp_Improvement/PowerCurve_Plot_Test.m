% Getting Data from Wind_GUI_1 GUI Window

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

subnum_T1=Parameters_T1{1,2} ;

Power_T1=Parameters_T1{1,4} ;


% Disintegrating Parameters_T2

subnum_T2=Parameters_T2{1,2} ;

Power_T2=Parameters_T2{1,4} ;


% Disintegrating Parameters_T3

subnum_T3=Parameters_T3{1,2} ;

Power_T3=Parameters_T3{1,4} ;


% Disintegrating Parameters_T4

subnum_T4=Parameters_T4{1,2} ;

Power_T4=Parameters_T4{1,4} ;


% All Possible Cases

if (T1 == 0) && (T2 == 0) && (T3 == 0) && (T4 == 1)
    
    subnum=[0,0,0,subnum_T4];  
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;   
    
    
   
    
elseif (T1 == 0) && (T2 == 0) && (T3 == 1) && (T4 == 0)

    subnum=[0,0,subnum_T3,0];   
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;   
    
   
        
    
    
elseif (T1 == 0) && (T2 == 0) && (T3 == 1) && (T4 == 1)
        
    subnum=[0,0,subnum_T3,subnum_T4];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;   
    
    
       
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 0) && (T4 == 0)
        
    subnum=[0,subnum_T2,0,0];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;    
    
    
       
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 0) && (T4 == 1)
        
    subnum=[0,subnum_T2,0,subnum_T4]; 
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;    
    
    
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 1) && (T4 == 0)
        
    subnum=[0,subnum_T2,subnum_T3,0];  
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;   
    
   
       
    
elseif (T1 == 0) && (T2 == 1) && (T3 == 1) && (T4 == 1)
        
    subnum=[0,subnum_T2,subnum_T3,subnum_T4];
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
    
        
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 0) && (T4 == 0)
        
    subnum=[subnum_T1,0,0,0];  
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;    
   
       
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 0) && (T4 == 1)
        
    subnum=[subnum_T1,0,0,subnum_T4];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;
        
   
        
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 1) && (T4 == 0)
        
    subnum=[subnum_T1,0,subnum_T3,0];
        
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;   
    
    
        
    
elseif (T1 == 1) && (T2 == 0) && (T3 == 1) && (T4 == 1)
        
    subnum=[subnum_T1,0,subnum_T3,subnum_T4];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;   
    
    
       
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 0) && (T4 == 0)
        
    subnum=[subnum_T1,subnum_T2,0,0];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;   
    
   
        
    
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 0) && (T4 == 1)
        
    subnum=[subnum_T1,subnum_T2,0,subnum_T4];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;   
    
    
      
    
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 1) && (T4 == 0)
        
    subnum=[subnum_T1,subnum_T2,subnum_T3,0];    
    
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4; 
    
    
           
    
elseif (T1 == 1) && (T2 == 1) && (T3 == 1) && (T4 == 1)
        
    subnum=[subnum_T1,subnum_T2,subnum_T3,subnum_T4];
      
    subnum_Total=subnum_T1+subnum_T2+subnum_T3+subnum_T4;  
    
   
        
    
    
end