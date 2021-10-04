% % Finding Start and End Days of the Data Set
% 
% DateTimeStampStartday=strread(DataFile{2,1},'%s','delimiter',' ');
% 
% % Start day Information
% 
% StartDate=strread(DateTimeStampStartday{1,1},'%f','delimiter','/');
% 
% StartMonth=StartDate(1,1)
% 
% StartDay=StartDate(2,1)
% 
% StartYear=StartDate(3,1)
% 
% StartTime=strread(DateTimeStampStartday{2,1},'%f','delimiter',':');
% 
% StartHour=StartTime(1,1)
% 
% StartMin=StartTime(2,1)
% 
% StartSec=StartTime(3,1)
% 
% StartDayAmPm=strread(DateTimeStampStartday{3,1},'%s')
% 
% [ StartTimeDeci ] = HMToDeci( StartHour,StartMin,StartSec )
% 
% AmPm=strcmp(StartDayAmPm,'AM')
% 
% if AmPm==1
%     
%     [ StartTimeDeci ] = HMToDeci( StartHour,StartMin,StartSec )
%     
% elseif AmPm==0
%     
%     [ StartTimeDeci ] = HMToDeci( StartHour,StartMin,StartSec )+12
%     
% end
% 
% % End Day Information
% 
% [rnum,colnum]=size(DataFile)
% 
% DateTimeStampEndday=strread(DataFile{rnum,1},'%s','delimiter',' ');
% 
% EndDate=strread(DateTimeStampEndday{1,1},'%f','delimiter','/');
% 
% EndMonth=EndDate(1,1)
% 
% EndDay=EndDate(2,1)
% 
% EndYear=EndDate(3,1)
% 
% EndTime=strread(DateTimeStampEndday{2,1},'%f','delimiter',':');
% 
% EndHour=EndTime(1,1)
% 
% EndMin=EndTime(2,1)
% 
% EndSec=EndTime(3,1)
% 
% EnddayAmPm=strread(DateTimeStampEndday{3,1},'%s')
% 
% [ EndTimeDeci ] = HMToDeci( EndHour,EndMin,EndSec )
% 
% AmPm=strcmp(EnddayAmPm,'AM')
% 
% if AmPm==1
%     
%     [ EndTimeDeci ] = HMToDeci( EndHour,EndMin,EndSec )
%     
% elseif AmPm==0
%     
%     [ EndTimeDeci ] = HMToDeci( EndHour,EndMin,EndSec )+12
%     
% end

% SD=28;
% SM=1;
% if SD==31
%         
%         SD=1;
%         
%     elseif SD==30
%         
%         for j=[4,6,9,11]
%             
%             if SM==j
%                 
%                 SD=1;
%                 
%                 break;
%                 
%             end
%         end
%         
%     elseif ((SD==28)||(SD==29))&&(SM==2)
%         
%         SD=1;
%         
% end
% SD

% Fitting Generation Curve to Gaussian Curve

% y=[0;0;0;0;0;0;0;0;0.00195312500000000;0.00390625000000000;0.0390625000000000;0.0898437500000000;0.0605468750000000;0.230468750000000;0.230468750000000;0.279296875000000;0.417968750000000;0.503906250000000;0.562500000000000;0.615234375000000;0.865234375000000;0.908203125000000;0.978515625000000;1.11718750000000;1.25000000000000;1.50000000000000;1.16210937500000;2.14648437500000;1.51171875000000;2.11914062500000;1.84960937500000;2.42187500000000;2.06640625000000;2.06250000000000;2.63671875000000;2.65234375000000;2.56835937500000;2.75390625000000;3.57031250000000;2.15820312500000;3.51562500000000;3.01757812500000;3.07617187500000;3.77148437500000;3.38867187500000;3.93750000000000;3.36523437500000;4.12304687500000;2.93359375000000;5.24804687500000;2.85546875000000;4.58007812500000;3.77734375000000;4.54687500000000;4.22656250000000;4.58593750000000;4.29687500000000;4.58007812500000;4.72070312500000;4.30859375000000;4.92578125000000;4.70117187500000;4.61328125000000;4.44335937500000;5.70898437500000;4.43359375000000;4.97070312500000;5.09375000000000;4.88281250000000;5.25000000000000;5.12695312500000;4.83984375000000;5.34179687500000;4.62695312500000;5.80078125000000;4.99609375000000;5.18945312500000;3.95117187500000;5.83984375000000;4.60742187500000;5.18945312500000;4.62890625000000;5.88867187500000;5.50000000000000;3.41210937500000;5.07812500000000;6.07617187500000;3.33593750000000;4.53320312500000;6.08007812500000;3.71484375000000;4.33593750000000;5.58007812500000;2.97460937500000;4.95703125000000;3.78515625000000;4.07031250000000;4.42578125000000;4.89843750000000;2.64453125000000;4.88281250000000;2.68164062500000;4.74609375000000;2.34179687500000;4.51757812500000;3.30859375000000;3.10742187500000;2.68554687500000;3.83203125000000;2.35546875000000;2.71289062500000;3.18945312500000;1.95312500000000;2.75585937500000;2.54492187500000;2.47265625000000;1.59960937500000;2.32812500000000;1.32421875000000;2.01757812500000;1.38867187500000;1.65625000000000;1.25000000000000;1.16796875000000;0.945312500000000;1.04687500000000;0.556640625000000;1.00195312500000;0.546875000000000;0.529296875000000;0.511718750000000;0.345703125000000;0.193359375000000;0.224609375000000;0.125000000000000;0.0859375000000000;0.0468750000000000;0.0234375000000000;0.00390625000000000;0;NaN;0;0;0;0];
% y=y(25:100,1)
% y(6:145,1)=NaN(140,1)
% for i=1:length(y)
%     
%     if isnan(y(i,1))
%         
%         y(i,1)=0;
%         
%     end
%     
% end
% 
% x=[6;6.08333333333333;6.16666666666667;6.25000000000000;6.33333333333333;6.41666666666667;6.50000000000000;6.58333333333333;6.66666666666667;6.75000000000000;6.83333333333333;6.91666666666667;7;7.08333333333333;7.16666666666667;7.25000000000000;7.33333333333333;7.41666666666667;7.50000000000000;7.58333333333333;7.66666666666667;7.75000000000000;7.83333333333333;7.91666666666667;8;8.08333333333333;8.16666666666667;8.25000000000000;8.33333333333333;8.41666666666667;8.50000000000000;8.58333333333333;8.66666666666667;8.75000000000000;8.83333333333333;8.91666666666667;9;9.08333333333333;9.16666666666667;9.25000000000000;9.33333333333333;9.41666666666667;9.50000000000000;9.58333333333333;9.66666666666667;9.75000000000000;9.83333333333333;9.91666666666667;10;10.0833333333333;10.1666666666667;10.2500000000000;10.3333333333333;10.4166666666667;10.5000000000000;10.5833333333333;10.6666666666667;10.7500000000000;10.8333333333333;10.9166666666667;11;11.0833333333333;11.1666666666667;11.2500000000000;11.3333333333333;11.4166666666667;11.5000000000000;11.5833333333333;11.6666666666667;11.7500000000000;11.8333333333333;11.9166666666667;12.0000000000000;12.0833333333333;12.1666666666667;12.2500000000000;12.3333333333333;12.4166666666667;12.5000000000000;12.5833333333333;12.6666666666667;12.7500000000000;12.8333333333333;12.9166666666667;13.0000000000000;13.0833333333333;13.1666666666667;13.2500000000000;13.3333333333333;13.4166666666667;13.5000000000000;13.5833333333333;13.6666666666667;13.7500000000000;13.8333333333333;13.9166666666667;14.0000000000000;14.0833333333333;14.1666666666667;14.2500000000000;14.3333333333333;14.4166666666667;14.5000000000000;14.5833333333333;14.6666666666667;14.7500000000000;14.8333333333333;14.9166666666667;15.0000000000000;15.0833333333333;15.1666666666667;15.2500000000000;15.3333333333333;15.4166666666667;15.5000000000000;15.5833333333333;15.6666666666667;15.7500000000000;15.8333333333333;15.9166666666667;16;16.0833333333333;16.1666666666667;16.2500000000000;16.3333333333333;16.4166666666667;16.5000000000000;16.5833333333333;16.6666666666667;16.7500000000000;16.8333333333333;16.9166666666667;17;17.0833333333333;17.1666666666667;17.2500000000000;17.3333333333333;17.4166666666667;17.5000000000000;17.5833333333333;17.6666666666667;17.7500000000000;17.8333333333333;17.9166666666667;18];
% x1=x'
% 
%  x=x(25:100,1)
% x=x(1:100,1)
% 
% 
% a=fit(x,y,'gauss1')
% 
% coeff=coeffvalues(a);
% a1=coeff(1,1)
% b1=coeff(1,2)
% b1=(x1(1,1)+x1(1,length(x1)))/2
% c1=coeff(1,3)
% 
% yy =  a1*exp(-((x'-b1)/c1).^2)
% yy=(coeff(1,1))*exp(-((x1-coeff(1,2))/(coeff(1,3))).^2);
% yy=(coeff(1,1))*exp(-((x1-b1)/(coeff(1,3))).^2);
% 
% 
% 
% hold on;
% 
% plot(x1,yy)
% plot(x',y')
% 
% figure;
% plot(a)

StartYear=2014;
EndYear=2015;

NumYear=EndYear-StartYear; % Computing Number of Years of Data
  
  OneVector=ones(1,(NumYear+1)); % Creating One Vector
  
  x=find(OneVector); % Creating Incrementing Index for the FOR LOOP
  
  for ii=x % FOR LOOP for creating the Year Vector
      
      if ii==1
          
        Years(1,ii)=StartYear;
        
      end
      
      Years(1,ii)=StartYear+(ii-1);
      
      if Years(1,ii)==EndYear
          
         break; 
          
      end

  end
  
     