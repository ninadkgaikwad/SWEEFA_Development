function [ ClearIndex,DiffIndex,ClearIndexx,m] = ClearnessIndex( RainSnowMonths,yr,mr,YearRain,MonthRain,LeapYear )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% Month Days for Non-Leap Year
jannl=1:31;
febnl=32:59;
marnl=60:90;
aprnl=91:120;
maynl=121:151;
junnl=152:181;
julnl=182:212;
augnl=213:243;
sepnl=244:273;
octnl=274:304;
novnl=305:334;
decnl=335:365;

% Month Days for Leap Year
janlp=1:31;
feblp=32:60;
marlp=61:91;
aprlp=92:121;
maylp=122:152;
junlp=153:182;
jullp=183:213;
auglp=214:244;
seplp=245:274;
octlp=275:305;
novlp=306:335;
declp=336:366;


if LeapYear==0
    
    Year=1:365;
    
    [ RainDays ] = RainSnowMonthDays( RainSnowMonths,LeapYear ); % Gives Raindays and Cell Structure for Raindays
    
    if yr==1
       NumRainMonth=length(find(RainSnowMonths)); % Total Number of Rainy Months
 
       Rain=YearRain/NumRainMonth; 
       
       a1 =   1.527e+13 ; %(-2.669e+17, 2.669e+17)
       b1 =       -5082  ;%(-2.863e+06, 2.853e+06)
       c1 =         909  ;%(-2.563e+05, 2.581e+05)
       a2 =      0.6984  ;%(0.06669, 1.33)
       b2 =       327.5  ;%(-2132, 2787)
       c2 =       809.3  ;%(-3740, 5359)
                   
       ClearIndexx =  a1*exp(-((Rain-b1)/c1)^2) + a2*exp(-((Rain-b2)/c2)^2);
       
       for i=Year
           
          if ismember(i,RainDays) 
              
              ClearIndex(1,i)=ClearIndexx;
              
          else
              
              ClearIndex(1,i)=1;
           
          end
          
       end
       
       DiffIndex=1-ClearIndex; % As Beam Radiation scatters more Diffuse Radiation increases in more clouds
       
   elseif mr==1
        
       Rain=MonthRain;
       
       a1 =   1.527e+13 ; %(-2.669e+17, 2.669e+17)
       b1 =       -5082  ;%(-2.863e+06, 2.853e+06)
       c1 =         909  ;%(-2.563e+05, 2.581e+05)
       a2 =      0.6984  ;%(0.06669, 1.33)
       b2 =       327.5  ;%(-2132, 2787)
       c2 =       809.3  ;%(-3740, 5359)    
       
       for i=1:12         
                  
       ClearIndexx(1,i) =  a1*exp(-((Rain(i,1)-b1)/c1)^2) + a2*exp(-((Rain(i,1)-b2)/c2)^2); 
       
       if ClearIndexx(1,i)>0.999
           
           ClearIndexx(1,i)=1;
           
       end
           
       end
       
       
       
      % m=0; % Debugger
       
       for k=Year
                                             

           if (ismember(k,jannl))
               ClearIndex(1,k)=ClearIndexx(1,1);
           elseif (ismember(k,febnl))
               ClearIndex(1,k)=ClearIndexx(1,2);
           elseif (ismember(k,marnl))
               ClearIndex(1,k)=ClearIndexx(1,3);               
           elseif (ismember(k,aprnl))
               ClearIndex(1,k)=ClearIndexx(1,4);
           elseif (ismember(k,maynl))
               ClearIndex(1,k)=ClearIndexx(1,5);  
           elseif (ismember(k,junnl))
               ClearIndex(1,k)=ClearIndexx(1,6);
           elseif (ismember(k,julnl))
               ClearIndex(1,k)=ClearIndexx(1,7); 
           elseif (ismember(k,augnl))
               ClearIndex(1,k)=ClearIndexx(1,8);
           elseif (ismember(k,sepnl))
               ClearIndex(1,k)=ClearIndexx(1,9);   
           elseif (ismember(k,octnl))
               ClearIndex(1,k)=ClearIndexx(1,10);
           elseif (ismember(k,novnl))
               ClearIndex(1,k)=ClearIndexx(1,11);
           elseif (ismember(k,decnl))
               ClearIndex(1,k)=ClearIndexx(1,12);               
       end
        
        
       end
       
       DiffIndex=1-ClearIndex; % As Beam Radiation scatters more Diffuse Radiation increases in more clouds
    end

elseif LeapYear==1
    Year=1:366;
    
    [ RainDays ] = RainSnowMonthDays( RainSnowMonths,LeapYear ); % Gives Raindays and Cell Structure for Raindays

    if yr==1
        NumRainMonth=length(find(RainSnowMonths)); % Total Number of Rainy Months

        
       Rain=YearRain/NumRainMonth; 
       
       a1 =   1.527e+13 ; %(-2.669e+17, 2.669e+17)
       b1 =       -5082  ;%(-2.863e+06, 2.853e+06)
       c1 =         909  ;%(-2.563e+05, 2.581e+05)
       a2 =      0.6984  ;%(0.06669, 1.33)
       b2 =       327.5  ;%(-2132, 2787)
       c2 =       809.3  ;%(-3740, 5359)
                   
       ClearIndexx =  a1*exp(-((Rain-b1)/c1)^2) + a2*exp(-((Rain-b2)/c2)^2);
       
       for i=Year
           
          if ismember(i,RainDays) 
              
              ClearIndex(1,i)=ClearIndexx;
              
          else
              
              ClearIndex(1,i)=1;
           
          end
          
       end 
       
       DiffIndex=1-ClearIndex; % As Beam Radiation scatters more Diffuse Radiation increases in more clouds
        
        
    elseif mr==1
       Rain=MonthRain;
       
       a1 =   1.527e+13 ; %(-2.669e+17, 2.669e+17)
       b1 =       -5082  ;%(-2.863e+06, 2.853e+06)
       c1 =         909  ;%(-2.563e+05, 2.581e+05)
       a2 =      0.6984  ;%(0.06669, 1.33)
       b2 =       327.5  ;%(-2132, 2787)
       c2 =       809.3  ;%(-3740, 5359)    
       
       for i=1:12         
                  
       ClearIndexx(1,i) =  a1*exp(-((Rain(1,i)-b1)/c1)^2) + a2*exp(-((Rain(1,i)-b2)/c2)^2);   
       
       if ClearIndexx(1,i)>0.999
           
          ClearIndexx(1,i)=1;
           
       end
       
       end
       m=0; % Debugger
       for k=Year
            
           m=m+1;
           
     

           if (ismember(k,janlp))
               ClearIndex(1,k)=ClearIndexx(1,1);
           elseif (ismember(k,feblp))
               ClearIndex(1,k)=ClearIndexx(1,2);
           elseif (ismember(k,marlp))
               ClearIndex(1,k)=ClearIndexx(1,3);               
           elseif (ismember(k,aprlp))
               ClearIndex(1,k)=ClearIndexx(1,4);
           elseif (ismember(k,maylp))
               ClearIndex(1,k)=ClearIndexx(1,5);  
           elseif (ismember(k,junlp))
               ClearIndex(1,k)=ClearIndexx(1,6);
           elseif (ismember(k,jullp))
               ClearIndex(1,k)=ClearIndexx(1,7); 
           elseif (ismember(k,auglp))
               ClearIndex(1,k)=ClearIndexx(1,8);
           elseif (ismember(k,seplp))
               ClearIndex(1,k)=ClearIndexx(1,9);   
           elseif (ismember(k,octlp))
               ClearIndex(1,k)=ClearIndexx(1,10);
           elseif (ismember(k,novlp))
               ClearIndex(1,k)=ClearIndexx(1,11);
           elseif (ismember(k,declp))
               ClearIndex(1,k)=ClearIndexx(1,12);               
       end        
        
       
        
        
       end    
    
    DiffIndex=1-ClearIndex; % As Beam Radiation scatters more Diffuse Radiation increases in more clouds
       
    end

    end



end

