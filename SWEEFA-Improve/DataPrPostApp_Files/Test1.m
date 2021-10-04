
% % File Selection
% [Filename,Pathname]=uigetfile({'*.*'},'Raw Data File Selector');
% 
% Fullpathname=strcat(Pathname,Filename);
% 
% [a ,~,DataFile]=xlsread(Fullpathname,1);
% 
% i=1;
%             % Reading Data from the Current Row of DataFile into DataCapture Vector
%             for k=2:(DataCols+1)
%                 
%                 DataCapture(1,k-1)=DataFile{i+1,k};
%                 
%                 if DataCapture(1,k-1)<0 % Converting NEGATIVE Values to ZEROS
%                     
%                   DataCapture(1,k-1)=0;  
%                     
%                 end
%                 
%             end
% 
% % Finding Start and End Days of the Data Set

% SD=29;
% LP=1;
% SM=2;
% 
% if((SD==28)&&(LP==0)&&(SM==2))||((SD==29)&&(LP==1)&&(SM==2))
% 
%     SD=1;
%     
% end
% 

% SD
% SD=29;
% SM=11
% ;
% a=((SD~=30)&&(SM~=4||SM~=6||SM~=9||SM~=11))



% SD=28;
% SM=2;
% LP=0;
% a=(((SD~=28)&&(LP==0)&&(SM==2))||((SD~=29)&&(LP==1)&&(SM==2)))

% i=2;
% SD=31;
% SM=1;
% LP=1;
% counter=(i~=1)
% Thirtyone=(SD~=31)&&(SM==1||SM==3||SM==5||SM==7||SM==8||SM==10||SM==12)
% Thirty=((SD~=30)&&(SM==4||SM==6||SM==9||SM==11))
% February=(((SD~=28)&&(LP==0)&&(SM==2))||((SD~=29)&&(LP==1)&&(SM==2)))
% DayIncrement=(i~=1)&&(((SD~=31)&&(SM==1||SM==3||SM==5||SM==7||SM==8||SM==10||SM==12))||((SD~=30)&&(SM==4||SM==6||SM==9||SM==11))||(((SD~=28)&&(LP==0)&&(SM==2))||((SD~=29)&&(LP==1)&&(SM==2))))


% % Within the Day Time Index Finder
% TimeDeci=1.5;
% Res=5;
% 
% DayPoints=24*(60/Res);
% 
% TimeT=0:Res/60:(24-(Res/60));
% 
% len=length(TimeT);
% 
% for j=1:len
%     
%     diffrence(1,j)=abs(TimeDeci-TimeT(1,j));
%     
% end
% 
% [M,I]=min(diffrence)
% 
% T=TimeT(1,I)


% % Dynamic FOR LOOP
% tic;
% 
% u=1;
% len=500;
% a=zeros(1,1000);
% b=zeros(1,1000);
% 
% for i=1:len
%    
%     for j=u:len
%         
%        a(i,j)=i;
%        b(i,j)=i;
% 
%       
%     end
%     
%      u=u+1;
%     
% end

% toc;


% FOR LOOp TEST
% 
% i=10;
% 
% for j=1:i
%     
%     a(1,j)=1;
%     
% end
% 
% j

% % Rigth Index and Data Storing into ProcessedData Matrix
% Day=1;
% Month=8;
% Year=2015;
% T=1.5;
% Up=1;
% [r,c]=size(DateTimeMatrix);
% len1=r;
% for j=Up:len1
%                 
%                 if (Day==DateTimeMatrix(j,1))&&(Month==DateTimeMatrix(j,2))&&(Year==DateTimeMatrix(j,3))&&(T==DateTimeMatrix(j,4))
%                     
%                   break; 
%                     
%                 end
%                 
%             end
% j
% 
% DataCols=5;
% DataCapture=[100,250,400,500,600];
% 
%             for m=1:DataCols
%                 
%                 DateTimeMatrix(j,m+4)=DataCapture(1,m);                
%                 
%             end

% Converting Cumulative to

% Testing for Years Vector Creation

StartYear=2012;

EndYear=2015;

NumYear=EndYear-StartYear; % Computing Number of Years of Data
  
  OneVector=ones(1,NumYear+1); % Creating One Vector
  
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
  
  Years