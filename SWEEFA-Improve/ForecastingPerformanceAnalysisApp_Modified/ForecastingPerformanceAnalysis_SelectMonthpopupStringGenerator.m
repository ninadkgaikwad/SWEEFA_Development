function [SelectMonth_Popup_String,SelectMonth_Popup_Vector] = ForecastingPerformanceAnalysis_SelectMonthpopupStringGenerator(YearVector,Len_YearVector,StartMonth,EndMonth)

%% Function Details:

% YearVector = A Vector of all the Years between Start and End Years
% Len_YearVector = A Scalar of Total Number of Years
% StartMonth = A Scalar of Starting Month
% EndMonth = A scalar of Ending Month

%% Computing SelectMonth_Popup_String and SelectMonth_Popup_Vector

% Creating Month-String

Month_String={'January','February','March','April','May','June','July','August','September','October','November','December'};

% Computing SelectMonth_Popup_String and SelectMonth_Popup_Vector according to Len_YearVector

if (Len_YearVector==1) % Single Year
    
    % Computing SelectMonth_Popup_Vector
    
    SelectMonth_Popup_Vector=StartMonth:EndMonth;
    
    % Computing SelectMonth_Popup_String
           
    for i=1:length(SelectMonth_Popup_Vector)
        
       SelectMonth_Popup_String1(1,i)={Month_String{1,SelectMonth_Popup_Vector(1,i)}};
        
    end
    
    SelectMonth_Popup_String=['Month',SelectMonth_Popup_String1];      
    
elseif (Len_YearVector==2) % Two Years
    
    % For Year1

    % Computing SelectMonth_Popup_Vector1
    
    SelectMonth_Popup_Vector1=StartMonth:12;

    % Computing SelectMonth_Popup_String11    
    
    for i=1:length(SelectMonth_Popup_Vector1)
        
       SelectMonth_Popup_String11(1,i)={Month_String{1,SelectMonth_Popup_Vector1(1,i)}};
        
    end    
    
    % For Year2
    
    % Computing SelectMonth_Popup_Vector2
    
    SelectMonth_Popup_Vector2=1:EndMonth;
    
    % Computing SelectMonth_Popup_String12    
    
    for i=1:length(SelectMonth_Popup_Vector2)
        
       SelectMonth_Popup_String12(1,i)={Month_String{1,SelectMonth_Popup_Vector2(1,i)}};
        
    end        
    
    % Combining Year1 and Year2
    
    SelectMonth_Popup_Vector_Combined=[SelectMonth_Popup_Vector1,SelectMonth_Popup_Vector2];
    SelectMonth_Popup_String_Combined=[SelectMonth_Popup_String11,SelectMonth_Popup_String12];
    
    % Filtering Combined SelectMonth_Popup Vector/String for Redundancies
    
    SelectMonth_Popup_Vector=unique(SelectMonth_Popup_Vector_Combined);
    
    SelectMonth_Popup_String_1=unique(SelectMonth_Popup_String_Combined);
    
    SelectMonth_Popup_String=['Month',SelectMonth_Popup_String_1];
    
elseif (Len_YearVector>2) % More than Two Years
    
    % Computing SelectMonth_Popup_Vector
    
    SelectMonth_Popup_Vector=1:12;
    
    % Computing SelectMonth_Popup_String
    
    SelectMonth_Popup_String1=Month_String; 
    
    SelectMonth_Popup_String=['Month',SelectMonth_Popup_String1];
    
end

end