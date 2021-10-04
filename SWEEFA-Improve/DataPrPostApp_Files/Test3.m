% File Selection
[Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');

Fullpathname=strcat(Pathname,Filename);

[Num ,~,DataFile]=xlsread(Fullpathname,1);

[rnum,cnum]=size(DataFile);

[r,c]=size(Num);

% Creating Cell Array for storing Formatted Data in Excel
ProcessedData=cell(26,366);

% Formatting ProcessedData Cell Array with Signature Information
ProcessedData{1,1}='Power';
ProcessedData{1,2}='DAY Number';
ProcessedData{2,1}='HOUR';

% Hour Signature
for i=3:26
    
    ProcessedData{i,1}=i-2;
    
end

% Day number Signature
for j=2:366
    
    ProcessedData{2,j}=j-1;
    
end


filename = 'testdata.xlsx';

xlswrite(filename,ProcessedData)

FOR LOOP
u=1;
for i=u:100
    
    a(1,i)=i;
    
    u=u+9;
    
end


%% Filling the Missing Data 
 Res=5;
 TotDays=363;
 len1=4;
 DataCols=5;

% FOR LOOP for Day-Wise filling of Missing Data

DayDataPoints=24*(60/Res); % Total Data Points in ONE DAY

Count=0; % Counter for EXACT ROW NUMBER

Z=zeros(DayDataPoints,TotDays,DataCols); % Initializing 3D-Matrix for Mapping Zeros in ONE DAY
N=zeros(DayDataPoints,TotDays,DataCols); % Initializing 3D-Matrix for Mapping NaN in ONE DAY

for i=1:TotDays
    
     % Checking Total Number of ZERO VALUES in CURRENT DAY
     
     for j=(Count+1):(i*DayDataPoints)
         
         % Checking Total Number of ZERO/NaN VALUES in EACH DATA COLUMN
         
         for k=5:5+len1
             
             if ActualData(j,k)==0
                 
                 Z((j-((i-1)*DayDataPoints)),i,(k-4))=1;
                 
             elseif isnan(ActualData(j,k))
                 
                 N((j-((i-1)*DayDataPoints)),i,(k-4))=1;
                 
             else
                 
                 Z((j-((i-1)*DayDataPoints)),i,(k-4))=0;
                 
                 N((j-((i-1)*DayDataPoints)),i,(k-4))=0;
                 
             end
             
         end
         
     end
     
     % Updating Exact Row Counter
     
     Count=Count+DayDataPoints;       
         
    
end



% %% Filling  Missing Data in COMPLETELY EMPTY DAYS & DAYS with NaN VALUES
% 
% Res=5;
% TotDays=363;
% len1=4;
% DataCols=5;
% Lat=23.275;
%  
% DayDataPoints=24*(60/Res);
% 
% % FOR LOOP for Days
% 
% for i=1:TotDays
%     
%     % Finding Julian Day for the Given Day
%     
%     RowForDate=(DayDataPoints*(i-1))+1; % Row Number for Starting of New Day
%     
%     Month=ProcessedData(RowForDate,2);
% 
%     Day=ProcessedData(RowForDate,1);
% 
%     Year=ProcessedData(RowForDate,3);
%     
%     [n]=JulianDay(Day,Month,Year); % Actual Call to the Pre-defined Function
%     
%     
%     % FOR LOOP for Data Columns
%     
%     for k=1:DataCols
%         
%         % Checking for ALL ZEROS and NaN Values (i.e Data Points that day are EMPTY or UNFILLED)
%         
%         ZeroCheck=find(Z(:,i,k));
%         
%         NaNCheck=find(N(:,i,k));
%         
%         PercentNaNValues=(length(NaNCheck)/DayDataPoints)*100;
%         
%         if length(ZeroCheck)==DayDataPoints % Use PV Energy Evaluation Model to fill missing DATA
%             
%             
%             
%         elseif PercentNaNValues>30 % Use PV Energy Evaluation Model to fill missing DATA
%             
%             
%             
%         elseif PercentNaNValues<=30 % Use CurveFitting Method by Gauss1
%             
%             % Using Pre-defined Function for CurveFitting
%             
%             [ ProcessedData ] = PVGenerationCurveFitting( ProcessedData,i,k,Res,Lat,n,NaNCheck );
%             
% %         elseif (length(ZeroCheck)~=DayDataPoints)&&(length(NaNCheck)==0) % Optimal Data is present in the given DAY
% %             
% %             break                       
%               
%         end
%         
%         
%     end
%     
%     
% end
