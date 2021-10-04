function [ EnergyTotCell,EnergyMonthWiseTotCell ] = WTGEnergyCalculator( EnergyParametersAll,LenWTG,yeardays )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Disintegrating Cell EnergyParametersAll
EnergyParameters_T1=EnergyParametersAll{1,1};
EnergyParameters_T2=EnergyParametersAll{1,2};
EnergyParameters_T3=EnergyParametersAll{1,3};
EnergyParameters_T4=EnergyParametersAll{1,4};

% Disintegrating Cell EnergyParameters_T1
WTGOutEnergy_T1=EnergyParameters_T1{1,1};
WTGPowerGridEnergy_T1=EnergyParameters_T1{1,2};
WTGOhmicLossEnergy_T1=EnergyParameters_T1{1,3};
WTGTransLossEnergy_T1=EnergyParameters_T1{1,4};

% Disintegrating Cell EnergyParameters_T2
WTGOutEnergy_T2=EnergyParameters_T2{1,1};
WTGPowerGridEnergy_T2=EnergyParameters_T2{1,2};
WTGOhmicLossEnergy_T2=EnergyParameters_T2{1,3};
WTGTransLossEnergy_T2=EnergyParameters_T2{1,4};

% Disintegrating Cell EnergyParameters_T3
WTGOutEnergy_T3=EnergyParameters_T3{1,1};
WTGPowerGridEnergy_T3=EnergyParameters_T3{1,2};
WTGOhmicLossEnergy_T3=EnergyParameters_T3{1,3};
WTGTransLossEnergy_T3=EnergyParameters_T3{1,4};

% Disintegrating Cell EnergyParameters_T4
WTGOutEnergy_T4=EnergyParameters_T4{1,1};
WTGPowerGridEnergy_T4=EnergyParameters_T4{1,2};
WTGOhmicLossEnergy_T4=EnergyParameters_T4{1,3};
WTGTransLossEnergy_T4=EnergyParameters_T4{1,4};

% Disintegrating LenWTG
Len_T1=LenWTG(1,1);
Len_T2=LenWTG(1,2);
Len_T3=LenWTG(1,3);
Len_T4=LenWTG(1,4);

len=length(EnergyParameters_T1);

% Creating Cells for Various Energy Summations

% WTG1
EnergyModTotCell_T1=cell(1,len);
EnergyDayWiseTotCell_T1=cell(1,len);
EnergyTotCell_T1=cell(1,len);
EnergyMonthWiseTotCell_T1=cell(1,len);

% WTG2
EnergyModTotCell_T2=cell(1,len);
EnergyDayWiseTotCell_T2=cell(1,len);
EnergyTotCell_T2=cell(1,len);
EnergyMonthWiseTotCell_T2=cell(1,len);

% WTG3
EnergyModTotCell_T3=cell(1,len);
EnergyDayWiseTotCell_T3=cell(1,len);
EnergyTotCell_T3=cell(1,len);
EnergyMonthWiseTotCell_T3=cell(1,len);

% WTG4
EnergyModTotCell_T4=cell(1,len);
EnergyDayWiseTotCell_T4=cell(1,len);
EnergyTotCell_T4=cell(1,len);
EnergyMonthWiseTotCell_T4=cell(1,len);

% Total of WTG1, WTG2, WTG3 & WTG4
% EnergyModTotCell=cell(1,len);
% EnergyDayWiseTotCell=cell(1,len);
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

%% Computing Energy Portions for every SubModel of WTG Technology for the complete Time Period

% WTG1
for i=1:len
    
    E=EnergyParameters_T1{1,i};
    
    EnergyModTot=zeros(Len_T1,1);
    
    for j=1:Len_T1
        
        for k=1:yeardays
            
            EnergyModTot(j,1)=EnergyModTot(j,1)+E(j,k);
            
        end
          
        
    end
    
  EnergyModTotCell_T1(1,i)={EnergyModTot}; % Individual Sub-Model Contribution in Energy for year
    
end

% WTG2
for i=1:len
    
    E=EnergyParameters_T2{1,i};
    
    EnergyModTot=zeros(Len_T2,1);
    
    for j=1:Len_T2
        
        for k=1:yeardays
            
            EnergyModTot(j,1)=EnergyModTot(j,1)+E(j,k);
            
        end
          
        
    end
    
  EnergyModTotCell_T2(1,i)={EnergyModTot}; % Individual Sub-Model Contribution in Energy for year
    
end

% WTG3
for i=1:len
    
    E=EnergyParameters_T3{1,i};
    
    EnergyModTot=zeros(Len_T3,1);
    
    for j=1:Len_T3
        
        for k=1:yeardays
            
            EnergyModTot(j,1)=EnergyModTot(j,1)+E(j,k);
            
        end
          
        
    end
    
  EnergyModTotCell_T3(1,i)={EnergyModTot}; % Individual Sub-Model Contribution in Energy for year
    
end

% WTG4
for i=1:len
    
    E=EnergyParameters_T4{1,i};
    
    EnergyModTot=zeros(Len_T4,1);
    
    for j=1:Len_T4
        
        for k=1:yeardays
            
            EnergyModTot(j,1)=EnergyModTot(j,1)+E(j,k);
            
        end
          
        
    end
    
  EnergyModTotCell_T4(1,i)={EnergyModTot}; % Individual Sub-Model Contribution in Energy for year
    
end


%%  Computing Energy Total Energy for Each Day for Each SubModel of WTG Technolgy

% WTG1

for i=1:len
    
    E=EnergyParameters_T1{1,i};
    
    EnergyDayWiseTot=zeros(1,yeardays);
    
    for k=1:yeardays
        
        for j=1:Len_T1
            
            EnergyDayWiseTot(1,k)=EnergyDayWiseTot(1,k)+E(j,k);
            
        end
          
        
    end
    
  EnergyDayWiseTotCell_T1(1,i)={EnergyDayWiseTot}; % Total Energy of PV System for a specific Day
    
end

% WTG2
for i=1:len
    
    E=EnergyParameters_T2{1,i};
    
    EnergyDayWiseTot=zeros(1,yeardays);
    
    for k=1:yeardays
        
        for j=1:Len_T2
            
            EnergyDayWiseTot(1,k)=EnergyDayWiseTot(1,k)+E(j,k);
            
        end
          
        
    end
    
  EnergyDayWiseTotCell_T2(1,i)={EnergyDayWiseTot}; % Total Energy of PV System for a specific Day
    
end


% WTG3
for i=1:len
    
    E=EnergyParameters_T3{1,i};
    
    EnergyDayWiseTot=zeros(1,yeardays);
    
    for k=1:yeardays
        
        for j=1:Len_T3
            
            EnergyDayWiseTot(1,k)=EnergyDayWiseTot(1,k)+E(j,k);
            
        end
          
        
    end
    
  EnergyDayWiseTotCell_T3(1,i)={EnergyDayWiseTot}; % Total Energy of PV System for a specific Day
    
end


% WTG4
for i=1:len
    
    E=EnergyParameters_T4{1,i};
    
    EnergyDayWiseTot=zeros(1,yeardays);
    
    for k=1:yeardays
        
        for j=1:Len_T4
            
            EnergyDayWiseTot(1,k)=EnergyDayWiseTot(1,k)+E(j,k);
            
        end
          
        
    end
    
  EnergyDayWiseTotCell_T4(1,i)={EnergyDayWiseTot}; % Total Energy of PV System for a specific Day
    
end


%% Computing Energy Total Energy of Entire WTG Technology for the given period of simulation

% WTG1
for i=1:len
    
    E=EnergyModTotCell_T1{1,i}; 
    
    EnergyTot=0;
           
        for j=1:Len_T1
            
            EnergyTot=EnergyTot+E(j,1);
            
        end                
    
    
  EnergyTotCell_T1(1,i)={EnergyTot}; % Total Energy of the PV System for entire Simulation Period
    
end

% WTG2
for i=1:len
    
    E=EnergyModTotCell_T2{1,i}; 
    
    EnergyTot=0;
           
        for j=1:Len_T2
            
            EnergyTot=EnergyTot+E(j,1);
            
        end                
    
    
  EnergyTotCell_T2(1,i)={EnergyTot}; % Total Energy of the PV System for entire Simulation Period
    
end

% WTG3
for i=1:len
    
    E=EnergyModTotCell_T3{1,i}; 
    
    EnergyTot=0;
           
        for j=1:Len_T3
            
            EnergyTot=EnergyTot+E(j,1);
            
        end                
    
    
  EnergyTotCell_T3(1,i)={EnergyTot}; % Total Energy of the PV System for entire Simulation Period
    
end

% WTG4
for i=1:len
    
    E=EnergyModTotCell_T4{1,i}; 
    
    EnergyTot=0;
           
        for j=1:Len_T4
            
            EnergyTot=EnergyTot+E(j,1);
            
        end                
    
    
  EnergyTotCell_T4(1,i)={EnergyTot}; % Total Energy of the PV System for entire Simulation Period
    
end

%% Computing Total Energy Month-Wise for each WTG Technology

% WTG1
for i=1:len
    
    E=EnergyDayWiseTotCell_T1{1,i};
    
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
    
    EnergyMonthWiseTotCell_T1(1,i)={EnergyMonthWiseTot} ;% Total Energy of PV System for a specific Day    
     
end

% WTG2
for i=1:len
    
    E=EnergyDayWiseTotCell_T2{1,i};
    
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
    
    EnergyMonthWiseTotCell_T2(1,i)={EnergyMonthWiseTot} ;% Total Energy of PV System for a specific Day    
     
end

% WTG3
for i=1:len
    
    E=EnergyDayWiseTotCell_T3{1,i};
    
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
    
    EnergyMonthWiseTotCell_T3(1,i)={EnergyMonthWiseTot} ;% Total Energy of PV System for a specific Day    
     
end

% WTG4
for i=1:len
    
    E=EnergyDayWiseTotCell_T4{1,i};
    
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
    
    EnergyMonthWiseTotCell_T4(1,i)={EnergyMonthWiseTot} ;% Total Energy of PV System for a specific Day    
     
end

%% Total Energy for all the WTG Technologies

% Energy Total for entire Simulation Period
EnergyTotCell{1,1}=EnergyTotCell_T1{1,1}+EnergyTotCell_T2{1,1}+EnergyTotCell_T3{1,1}+EnergyTotCell_T4{1,1};
EnergyTotCell{1,2}=EnergyTotCell_T1{1,2}+EnergyTotCell_T2{1,2}+EnergyTotCell_T3{1,2}+EnergyTotCell_T4{1,2};
EnergyTotCell{1,3}=EnergyTotCell_T1{1,3}+EnergyTotCell_T2{1,3}+EnergyTotCell_T3{1,3}+EnergyTotCell_T4{1,3};
EnergyTotCell{1,4}=EnergyTotCell_T1{1,4}+EnergyTotCell_T2{1,4}+EnergyTotCell_T3{1,4}+EnergyTotCell_T4{1,4};

% Energy Total for entire Simulation Period Month-Wise
EnergyMonthWiseTotCell{1,1}=EnergyMonthWiseTotCell_T1{1,1}+EnergyMonthWiseTotCell_T2{1,1}+EnergyMonthWiseTotCell_T3{1,1}+EnergyMonthWiseTotCell_T4{1,1};
EnergyMonthWiseTotCell{1,2}=EnergyMonthWiseTotCell_T1{1,2}+EnergyMonthWiseTotCell_T2{1,2}+EnergyMonthWiseTotCell_T3{1,2}+EnergyMonthWiseTotCell_T4{1,2};
EnergyMonthWiseTotCell{1,3}=EnergyMonthWiseTotCell_T1{1,3}+EnergyMonthWiseTotCell_T2{1,3}+EnergyMonthWiseTotCell_T3{1,3}+EnergyMonthWiseTotCell_T4{1,3};
EnergyMonthWiseTotCell{1,4}=EnergyMonthWiseTotCell_T1{1,4}+EnergyMonthWiseTotCell_T2{1,4}+EnergyMonthWiseTotCell_T3{1,4}+EnergyMonthWiseTotCell_T4{1,4};

end

