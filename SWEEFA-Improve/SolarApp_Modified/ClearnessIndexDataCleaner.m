function [ ClearIndex,DiffIndex] = ClearnessIndexDataCleaner( Year,Month,Years,RainSnowMonths,yr,mr,YearRain,MonthRain )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% Computing the Index Month Rain or No Rain Condition

  YearIndex=find(Years==Year); 
  
  MonthIndex=Month+(12*(YearIndex-1));
  
  RainNoRainMonth=RainSnowMonths(1,MonthIndex);
  
% Computation of Clearness and Diffuse Indices

    if yr==1 % User has Yearly Rain Values      
       
        if RainNoRainMonth==1
        
            % Computing the Index for Start and End of RainSnowMonths Vector
            
               RainMonthStartIndex=1+(12*(YearIndex-1));

               RainMonthEndIndex=RainMonthStartIndex+11;

               NumRainMonth=length(find(RainSnowMonths(1,RainMonthStartIndex:RainMonthEndIndex))); % Total Number of Rainy Months

               Rain=YearRain(1,YearIndex)/NumRainMonth; 

               % Curve Fitting Result from Gujarat District-Wise Monthly Rain and Generation Data  

               a1 =   1.527e+13 ; %(-2.669e+17, 2.669e+17)
               b1 =       -5082  ;%(-2.863e+06, 2.853e+06)
               c1 =         909  ;%(-2.563e+05, 2.581e+05)
               a2 =      0.6984  ;%(0.06669, 1.33)
               b2 =       327.5  ;%(-2132, 2787)
               c2 =       809.3  ;%(-3740, 5359)

               ClearIndexx =  a1*exp(-((Rain-b1)/c1)^2) + a2*exp(-((Rain-b2)/c2)^2);


               ClearIndex=ClearIndexx;
              
          else
              
              ClearIndex=1;
           
          end
          
       
       
       DiffIndex=1-ClearIndex; % As Beam Radiation scatters more Diffuse Radiation increases in more clouds
       
   elseif mr==1
       
       if RainNoRainMonth==1

        
       Rain=MonthRain(1,MonthIndex);
       
       a1 =   1.527e+13 ; %(-2.669e+17, 2.669e+17)
       b1 =       -5082  ;%(-2.863e+06, 2.853e+06)
       c1 =         909  ;%(-2.563e+05, 2.581e+05)
       a2 =      0.6984  ;%(0.06669, 1.33)
       b2 =       327.5  ;%(-2132, 2787)
       c2 =       809.3  ;%(-3740, 5359)    
       
                
                  
       ClearIndexx =  a1*exp(-((Rain-b1)/c1)^2) + a2*exp(-((Rain-b2)/c2)^2); 
       
       if ClearIndexx>0.999
           
           ClearIndexx=1;
           
       end          
             
       
       else
           
           ClearIndex=1;    
      % m=0; % Debugger     
     
             
        
       end
       
       DiffIndex=1-ClearIndex; % As Beam Radiation scatters more Diffuse Radiation increases in more clouds

    end



end

