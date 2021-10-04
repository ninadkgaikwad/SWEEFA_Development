function [ EnergyModTotCell,EnergyDayWiseTotCell,EnergyTotCell,EnergyMonthWiseTotCell ] = PVEnergyCalculator( EnergyParameters,LenPVmod,yeardays )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

% Initializations

len=length(EnergyParameters);

% EnergyModTot=zeros(LenPVmod,1);
% 
%  EnergyDayWiseTot=zeros(1,yeardays);
%  
%  EnergyTot=0;
%  
%  EnergyMonthWiseTot=zeros(1,12);

EnergyModTotCell=cell(1,len);

EnergyDayWiseTotCell=cell(1,len);

EnergyTotCell=cell(1,len);

EnergyMonthWiseTotCell=cell(1,len);

% For Monthly Energy Computations

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

% Computing Energy Portions for every PV Cell Technology for the complete Time Period


for i=1:len
    
    E=EnergyParameters{1,i};
    
    EnergyModTot=zeros(LenPVmod,1);
    
    for j=1:LenPVmod
        
        for k=1:yeardays
            
            EnergyModTot(j,1)=EnergyModTot(j,1)+E(j,k);
            
        end
          
        
    end
    
  EnergyModTotCell(1,i)={EnergyModTot}; % Individual Cell Technology Contribution in Energy for year
    
end

% Computing Energy Total Energy for Each Day


for i=1:len
    
    E=EnergyParameters{1,i};
    
    EnergyDayWiseTot=zeros(1,yeardays);
    
    for k=1:yeardays
        
        for j=1:LenPVmod
            
            EnergyDayWiseTot(1,k)=EnergyDayWiseTot(1,k)+E(j,k);
            
        end
          
        
    end
    
  EnergyDayWiseTotCell(1,i)={EnergyDayWiseTot}; % Total Energy of PV System for a specific Day
    
end

% Computing Energy Total Energy of Entire PV System for the given period of simulation

for i=1:len
    
    E=EnergyModTotCell{1,i}; 
    
    EnergyTot=0;
           
        for j=1:LenPVmod
            
            EnergyTot=EnergyTot+E(j,1);
            
        end                
    
    
  EnergyTotCell(1,i)={EnergyTot}; % Total Energy of the PV System for entire Simulation Period
    
end

% Computing Total Energy Month-Wise


for i=1:len
    
    E=EnergyDayWiseTotCell{1,i};
    
    EnergyMonthWiseTot=zeros(1,12);
    
    for k=1:yeardays
        
        if yeardays==365
            
           if (ismember(k,jannl))
               EnergyMonthWiseTot(1,1)=EnergyMonthWiseTot(1,1)+E(1,k);
           elseif (ismember(k,febnl))
               EnergyMonthWiseTot(1,2)=EnergyMonthWiseTot(1,2)+E(1,k);
           elseif (ismember(k,marnl))
               EnergyMonthWiseTot(1,3)=EnergyMonthWiseTot(1,3)+E(1,k);               
           elseif (ismember(k,aprnl))
               EnergyMonthWiseTot(1,4)=EnergyMonthWiseTot(1,4)+E(1,k);
           elseif (ismember(k,maynl))
               EnergyMonthWiseTot(1,5)=EnergyMonthWiseTot(1,5)+E(1,k);  
           elseif (ismember(k,junnl))
               EnergyMonthWiseTot(1,6)=EnergyMonthWiseTot(1,6)+E(1,k);
           elseif (ismember(k,julnl))
               EnergyMonthWiseTot(1,7)=EnergyMonthWiseTot(1,7)+E(1,k); 
           elseif (ismember(k,augnl))
               EnergyMonthWiseTot(1,8)=EnergyMonthWiseTot(1,8)+E(1,k);
           elseif (ismember(k,sepnl))
               EnergyMonthWiseTot(1,9)=EnergyMonthWiseTot(1,9)+E(1,k);  
           elseif (ismember(k,octnl))
               EnergyMonthWiseTot(1,10)=EnergyMonthWiseTot(1,10)+E(1,k);
           elseif (ismember(k,novnl))
               EnergyMonthWiseTot(1,11)=EnergyMonthWiseTot(1,11)+E(1,k);
           elseif (ismember(k,decnl))
               EnergyMonthWiseTot(1,12)=EnergyMonthWiseTot(1,12)+E(1,k);               
           end
            
       
       
        elseif yeardays==366
            
           if (ismember(k,janlp))
               EnergyMonthWiseTot(1,1)=EnergyMonthWiseTot(1,1)+E(1,k);
           elseif (ismember(k,feblp))
               EnergyMonthWiseTot(1,2)=EnergyMonthWiseTot(1,2)+E(1,k);
           elseif (ismember(k,marlp))
               EnergyMonthWiseTot(1,3)=EnergyMonthWiseTot(1,3)+E(1,k);               
           elseif (ismember(k,aprlp))
               EnergyMonthWiseTot(1,4)=EnergyMonthWiseTot(1,4)+E(1,k);
           elseif (ismember(k,maylp))
               EnergyMonthWiseTot(1,5)=EnergyMonthWiseTot(1,5)+E(1,k);   
           elseif (ismember(k,junlp))
               EnergyMonthWiseTot(1,6)=EnergyMonthWiseTot(1,6)+E(1,k);
           elseif (ismember(k,jullp))
               EnergyMonthWiseTot(1,7)=EnergyMonthWiseTot(1,7)+E(1,k); 
           elseif (ismember(k,auglp))
               EnergyMonthWiseTot(1,8)=EnergyMonthWiseTot(1,8)+E(1,k);
           elseif (ismember(k,seplp))
               EnergyMonthWiseTot(1,9)=EnergyMonthWiseTot(1,9)+E(1,k);   
           elseif (ismember(k,octlp))
               EnergyMonthWiseTot(1,10)=EnergyMonthWiseTot(1,10)+E(1,k);
           elseif (ismember(k,novlp))
               EnergyMonthWiseTot(1,11)=EnergyMonthWiseTot(1,11)+E(1,k);
           elseif (ismember(k,declp))
               EnergyMonthWiseTot(1,12)=EnergyMonthWiseTot(1,12)+E(1,k);              
          end        
            
            
        end      
                 
           
        
          
        
    end
    
    EnergyMonthWiseTotCell(1,i)={EnergyMonthWiseTot} ;% Total Energy of PV System for a specific Day
    
      
end

end

