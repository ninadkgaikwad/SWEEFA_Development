function [ EnergyModTotCell_T1,EnergyModTotCell_T2,EnergyModTotCell_T3,EnergyModTotCell_T4 ] = WTGEnergyRayCalculator( EnergyParametersAll,LenWTG )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% Disintegrating Cell EnergyParametersAll
EnergyParameters_T1=EnergyParametersAll{1,1};
EnergyParameters_T2=EnergyParametersAll{1,2};
EnergyParameters_T3=EnergyParametersAll{1,3};
EnergyParameters_T4=EnergyParametersAll{1,4};

% Disintegrating LenWTG
Len_T1=LenWTG(1,1);
Len_T2=LenWTG(1,2);
Len_T3=LenWTG(1,3);
Len_T4=LenWTG(1,4);

len=length(EnergyParameters_T1);

% Creating Cells for Various Energy Summations

% WTG1
EnergyModTotCell_T1=cell(1,len);


% WTG2
EnergyModTotCell_T2=cell(1,len);


% WTG3
EnergyModTotCell_T3=cell(1,len);


% WTG4
EnergyModTotCell_T4=cell(1,len);


%% Computing Energy Portions for every SubModel of WTG Technology for the complete Time Period

% WTG1
for i=1:len
    
    E=EnergyParameters_T1{1,i};
    
    EnergyModTot=0;
    
    for j=1:Len_T1       
        
            
            EnergyModTot(1,1)=EnergyModTot(1,1)+E(j,1);          
      
          
       
    end
    
  EnergyModTotCell_T1(1,i)={EnergyModTot}; % Individual Sub-Model Contribution in Energy for year
    
end

% WTG2
for i=1:len
    
    E=EnergyParameters_T2{1,i};
    
    EnergyModTot=0;
    
    for j=1:Len_T2
        
        
            
            EnergyModTot(1,1)=EnergyModTot(1,1)+E(j,1);
            
        
          
        
    end
    
  EnergyModTotCell_T2(1,i)={EnergyModTot}; % Individual Sub-Model Contribution in Energy for year
    
end

% WTG3
for i=1:len
    
    E=EnergyParameters_T3{1,i};
    
    EnergyModTot=0;
    
    for j=1:Len_T3
        
        
            
            EnergyModTot(1,1)=EnergyModTot(1,1)+E(j,1);
            
        
          
        
    end
    
  EnergyModTotCell_T3(1,i)={EnergyModTot}; % Individual Sub-Model Contribution in Energy for year
    
end

% WTG4
for i=1:len
    
    E=EnergyParameters_T4{1,i};
    
    EnergyModTot=0;
    
    for j=1:Len_T4
        
        
            
            EnergyModTot(1,1)=EnergyModTot(1,1)+E(j,1);
            
       
          
        
    end
    
  EnergyModTotCell_T4(1,i)={EnergyModTot}; % Individual Sub-Model Contribution in Energy for year
    
end





end



