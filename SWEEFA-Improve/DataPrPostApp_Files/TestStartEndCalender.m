function [ DateMatrix ] = TestStartEndCalender( StartYear,StartMonth,StartDay,EndYear,EndMonth,EndDay,TotDays )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

% Initializing DateMatrix to Zeros
DateMatrix=zeros(TotDays,3);

% Initializing Start: Day, Month and Year
SD=StartDay;
SM=StartMonth;
SY=StartYear;

% Initializing End: Day, Month and Year
% ED=EndDay;
% EM=EndMonth;
% EY=EndYear;

% Creating DateMatrix using FOR LOOP
for i=1:TotDays
    
    % Computing Current value of Start Year: SY
    if i==1
        
        SY=SY;
        SM=SM;
        SD=SD;
        
        % Finding if current Year is a Leap Year using a Pre-defined Function
        LP=LeapYearFinder(SY);
        
    elseif (SD==31)&&(SM==12)
        
        SY=SY+1;
        SM=1;
        SD=1;
        
        % Finding if current Year is a Leap Year using a Pre-defined Function
        LP=LeapYearFinder(SY);
        
    else
        
        % Finding if current Year is a Leap Year using a Pre-defined Function
        LP=LeapYearFinder(SY);
        
        DayIncrement=(i~=1)&&(((SD~=31)&&(SM==1||SM==3||SM==5||SM==7||SM==8||SM==10||SM==12))||((SD~=30)&&(SM==4||SM==6||SM==9||SM==11))||(((SD~=28)&&(LP==0)&&(SM==2))||((SD~=29)&&(LP==1)&&(SM==2))));

        if DayIncrement

            SD=SD+1;
            
        end 
    
        
        
        % Finding if current Year is a Leap Year using a Pre-defined Function
        LP=LeapYearFinder(SY);

        % Resetting Start Day and Start Month: SD, SM 1
        if SD==31

            SD=1;
            SM=SM+1; 

        elseif SD==30

            for j=[4,6,9,11]

                if SM==j

                    SD=1;
                    SM=SM+1; 

                    break;

                end
            end

        elseif ((SD==28)&&(LP==0)&&(SM==2))||((SD==29)&&(LP==1)&&(SM==2))

            SD=1;
            SM=SM+1; 

        end

%         DayIncrement=(i~=1)&&(((SD~=31)&&(SM==1||SM==3||SM==5||SM==7||SM==8||SM==10||SM==12))||((SD~=30)&&(SM==4||SM==6||SM==9||SM==11))||(((SD~=28)&&(LP==0)&&(SM==2))||((SD~=29)&&(LP==1)&&(SM==2))));
% 
%         if DayIncrement
% 
%             SD=SD+1;
% 
%         end    

% Updating DateMatrix for each Day
        DateMatrix(i,:)=[SD,SM,SY];
        
    end       
   
    
    
        
      
                    
       
   

    
end



