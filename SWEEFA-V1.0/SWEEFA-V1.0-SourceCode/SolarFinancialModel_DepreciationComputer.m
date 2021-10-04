function [Depreciation_Computed]=SolarFinancialModel_DepreciationComputer(SL,AD,PlantCapacity,UnitEPCCost,FirstYearSegment,FirstYearSegment_ROI_Percent,NextYearSegment,NextYearSegment_ROI_Percent,AD_ROI_Percent,AD_Years,ProjectLife);

% Year Variable Computation

Year=0:ProjectLife;

Unit=zeros(1,(ProjectLife+1));

% Deciding Sl or AD Calculations

if (SL==1)

    %% Creating Arrays for Computed Variables

%     Year=zeros(1,(ProjectLife+1));

    SL_OpenAmt=zeros(1,(ProjectLife+1));

    SL_DepRate=zeros(1,(ProjectLife+1));

    SL_DepAmt=zeros(1,(ProjectLife+1));

    SL_CloseBal=zeros(1,(ProjectLife+1));
    
    %% Computing each Variable
    
    % Computing Initial Opening Balance
    
    Dep_InitBalance=PlantCapacity*UnitEPCCost;
    
    SL_OpenAmt(1,1)=Dep_InitBalance;
    
    SL_OpenAmt(1,2)=Dep_InitBalance;
    
    % Computing SL Depreciation Rates
    
    for i=2:(ProjectLife+1)
        
        if (Year(1,i)<=FirstYearSegment)

            SL_DepRate(1,i)=FirstYearSegment_ROI_Percent;

        elseif ((Year(1,i)>FirstYearSegment)&&(Year(1,i)<=ProjectLife))

            SL_DepRate(1,i)=NextYearSegment_ROI_Percent;

        end
    
    end
    
    % Computing SL - Depreciation, Closing Amounts
    
    for i=2:(ProjectLife+1)
        
        SL_DepAmt(1,i)=Dep_InitBalance*(1/100)*SL_DepRate(1,i);
        
        SL_CloseBal(1,i)=SL_OpenAmt(1,i)-SL_DepAmt(1,i);
        
        if (Year(1,i)<(ProjectLife))
            
           SL_OpenAmt(1,(i+1))=SL_CloseBal(1,i); 
            
        end
        
    end
    
    % Creating Cell Array for All Computed Values
    
    Depreciation_Computed_SL={SL_OpenAmt,SL_DepRate,SL_DepAmt,SL_CloseBal};
    
    Depreciation_Computed_AD={Unit,Unit,Unit,Unit};

elseif (AD==1)
    
    %% Creating Arrays for Computed Variables

    AD_Amt=zeros(1,(ProjectLife+1));

    AD_DepRate=zeros(1,(ProjectLife+1));

    AD_DepAmt=zeros(1,(ProjectLife+1));

    AD_CloseBal=zeros(1,(ProjectLife+1));
    
    %% Computing each Variable

    % Computing Initial Opening Balance
    
    Dep_InitBalance=PlantCapacity*UnitEPCCost;
    
    % Computing Other Variables
    
    AD_Amt(1,1)=Dep_InitBalance;
    
    AD_Amt(1,2)=AD_Amt(1,1);
    
    AD_DepRate(1,2)=AD_ROI_Percent;
    
    AD_DepRate(1,3)=100-AD_ROI_Percent;  
    
    AD_DepAmt(1,2)=AD_Amt(1,2)*(1/100)*AD_DepRate(1,2);   
    
    AD_CloseBal(1,2)=AD_Amt(1,2)-AD_DepAmt(1,2);
    
    AD_Amt(1,3)=AD_CloseBal(1,2);
    
    AD_DepAmt(1,3)=AD_Amt(1,2)*(1/100)*AD_DepRate(1,3);  
    
    AD_CloseBal(1,3)=AD_Amt(1,3)-AD_DepAmt(1,3);
    
    % Creating Cell Array for All Computed Values
    
    Depreciation_Computed_AD={AD_Amt,AD_DepRate,AD_DepAmt,AD_CloseBal};
    
    Depreciation_Computed_SL={Unit,Unit,Unit,Unit};
   
end

Depreciation_Computed={Depreciation_Computed_SL,Depreciation_Computed_AD};


end

