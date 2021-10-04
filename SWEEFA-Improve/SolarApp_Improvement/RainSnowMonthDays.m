function [ RainDays,n ] = RainSnowMonthDays( RainSnowMonths,LeapYear )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
n={0,0,0,0,0,0,0,0,0,0,0,0};
if LeapYear==0
   
  %n{i}  
            for i=1:12

                if RainSnowMonths(1,i)==1

                    switch i

                           case 1
                               n{i}=1:31;

                           case 2
                              n{i}=32:59;

                           case 3
                               n{i}=60:90;

                           case 4
                               n{i}=91:120;

                           case 5
                               n{i}=121:151;

                           case 6
                               n{i}=152:181;

                           case 7
                               n{i}=182:212;

                           case 8
                              n{i}=213:243;

                           case 9
                               n{i}=244:273;

                           case 10
                              n{i}=274:304;

                           case 11
                               n{i}=305:334;

                           case 12
                              n{i}=335:365;


                    end

              elseif RainSnowMonths(1,i)==0

                  n{i}=0;

                end
            end
    
elseif LeapYear==1
    
            for i=1:12

                if RainSnowMonths(1,i)==1

                    switch i

                           case 1
                               n{i}=1:31;

                           case 2
                               n{i}=32:60;

                           case 3
                               n{i}=61:91;

                           case 4
                               n{i}=92:121;

                           case 5
                               n{i}=122:152;

                           case 6
                               n{i}=153:182;

                           case 7
                               n{i}=183:213;

                           case 8
                               n{i}=214:244;

                           case 9
                               n{i}=245:274;

                           case 10
                               n{i}=275:305;

                           case 11
                               n{i}=306:335;

                           case 12
                               n{i}=336:366;

                      end

              elseif RainSnowMonths(1,i)==0

                  n{i}=0;

                end
            end



end
            
RainDays=[n{1},n{2},n{3},n{4},n{5},n{6},n{7},n{8},n{9},n{10},n{11},n{12} ];

end




