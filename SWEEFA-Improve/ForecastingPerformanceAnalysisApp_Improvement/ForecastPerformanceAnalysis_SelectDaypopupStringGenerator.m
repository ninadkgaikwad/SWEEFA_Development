function [SelectDay_Popup_String] = ForecastPerformanceAnalysis_SelectDaypopupStringGenerator(SelectMonth_Popup_Value,SelectMonth_Popup_String,SelectMonth_Popup_Vector,YearVector,SelectYear_Popup_Value)

%% Function Details:

% SelectMonth_Popup_Value = A Scalar of the Select Month PopUp Value
% SelectMonth_Popup_String = A Cell of Strings of the Select Month PopUp
% SelectMonth_Popup_Vector = A Vector of Month Numbers of the Select Month PopUp
% YearVector = A Vector of Year Numbers
% SelectYear_Popup_Value = A Scalar of the Select Year PopUp Value 

%% Computing String for SelectDay_Popup

% Computing Leap / Non-Leap Year using External Function

Year=YearVector(1,(SelectYear_Popup_Value-1));

[ LeapYear_Index ] = LeapYearFinder( Year );

% Creating SelectDay_Popup_String

Month=SelectMonth_Popup_Vector(1,(SelectMonth_Popup_Value-1));

if (Month==1) % January
    
    % Creating Month Vector
    
    MonthVector=1:31;
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];
    
elseif (Month==2) % February

    if (LeapYear_Index==1) % Leap Year
        
        % Creating Month Vector

        MonthVector=1:29;        
        
    elseif (LeapYear_Index==0) % Non-Leap Year
        
        % Creating Month Vector

        MonthVector=1:28;        
      
        
    end
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    

elseif (Month==3) % March

    % Creating Month Vector
    
    MonthVector=1:31;
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    

elseif (Month==4) % April

    % Creating Month Vector
    
    MonthVector=1:30;
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    

elseif (Month==5) % May
    
    % Creating Month Vector
    
    MonthVector=1:31;   
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    
    
elseif (Month==6) % June

    % Creating Month Vector
    
    MonthVector=1:30;
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    

elseif (Month==7) % July

    % Creating Month Vector
    
    MonthVector=1:31;
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    

elseif (Month==8) % August

    % Creating Month Vector
    
    MonthVector=1:31;
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    

elseif (Month==9) % September   
    
    % Creating Month Vector
    
    MonthVector=1:30;    
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    
    
elseif (Month==10) % October

    % Creating Month Vector
    
    MonthVector=1:31;
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    

elseif (Month==11) % November

    % Creating Month Vector
    
    MonthVector=1:30;
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    

elseif (Month==12) % December
    
     % Creating Month Vector
    
    MonthVector=1:31; 
    
    % Creating SelectDay_Popup_String
    
    for i=1:length(MonthVector)
        
        SelectDay_Popup_String1(1,i)={num2str(MonthVector(1,i))};
        
    end
    
    SelectDay_Popup_String=['Day',SelectDay_Popup_String1];    
    
end

end

