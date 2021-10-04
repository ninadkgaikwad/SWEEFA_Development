function [ hours, Vmean, Tmean ] = Month_Hours_MeanTemp_MeanWs( months,MrWs,MrTemp,LpYear,NLpYear )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
n={0,0,0,0,0,0,0,0,0,0,0,0};
if NLpYear==1
   
  %n{i}  
            for i=1:12

                if months(1,i)==1

                    switch i

                           case 1
                               n{i}=31;

                           case 2
                              n{i}=28;

                           case 3
                               n{i}=31;

                           case 4
                               n{i}=30;

                           case 5
                               n{i}=31;

                           case 6
                               n{i}=30;

                           case 7
                               n{i}=31;

                           case 8
                              n{i}=31;

                           case 9
                               n{i}=30;

                           case 10
                              n{i}=31;

                           case 11
                               n{i}=30;

                           case 12
                              n{i}=31;


                    end

              elseif months(1,i)==0

                  n{i}=0;

                end
            end
    
elseif LpYear==1
    
            for i=1:12

                if months(1,i)==1

                    switch i

                           case 1
                               n{i}=31;

                           case 2
                               n{i}=29;

                           case 3
                               n{i}=31;

                           case 4
                               n{i}=30;

                           case 5
                               n{i}=31;

                           case 6
                               n{i}=30;

                           case 7
                               n{i}=31;

                           case 8
                               n{i}=31;

                           case 9
                               n{i}=30;

                           case 10
                               n{i}=31;

                           case 11
                               n{i}=30;

                           case 12
                               n{i}=31;

                     end

              elseif months(1,i)==0

                  n{i}=0;

                end
            end



end
            
Days=[n{1},n{2},n{3},n{4},n{5},n{6},n{7},n{8},n{9},n{10},n{11},n{12} ];

% Computing Total Number of Hours 

hours=sum(Days)*24;

% Computing Ws and Temp Mean Values

months_Num=length(find(months));

Ws_Num=length(MrWs);

Temp_Num=length(MrTemp);

if ((months_Num==Ws_Num)&&(Ws_Num==Temp_Num)&&(Temp_Num==months_Num))
    
    Vmean=(sum(MrWs))/months_Num;
    
    Tmean=(sum(MrTemp))/months_Num;
    
elseif ((months_Num~=Ws_Num)||(Ws_Num~=Temp_Num)||(Temp_Num~=months_Num))
    
    error('Number of values of months, monthly mean wind speed and monthly mean temperature are unequal');
    
end


end

