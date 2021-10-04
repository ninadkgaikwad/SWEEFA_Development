%% Reading Multiple Excel Files

% Reference Code

% source_dir = 'C:\Users\xuf\Desktop\Excel Saved PointScans'

[Filename,Pathname]=uigetfile({'*.*'},'Energy File Selector');

FileTypeNum= 1; % 1=='xlsx', 2=='xls'


%% Reference Code 2
if (FileTypeNum==1)
    
    filetype='*.xlsx';  % or xls
    
elseif (FileTypeNum==2)
    
       filetype='*.xls';  % or xlsx
       
end

f=fullfile(Pathname,filetype);

d=dir(f);

Len_d=length(d);

% Getting Names of the Excel Files in the given Folder

for i=1:Len_d
    
    ExcelName{1,i}=d(i).name;
    
end

%% Assigning Type (1==Intra-Day,2==Daily,3==Monthly)to the Excel Files

TypeVector=zeros(1,Len_d); % Initialization

i=0; % Initialization

for i=1:Len_d
   
    % For Type 1
    
   Indicator1=findstr(ExcelName{1,i},'Intra'); 
   
   Len_Indicator1=length(Indicator1);
   
   if (Len_Indicator1>0)
       
      TypeVector(1,i)=1; 
       
      continue; 
       
   end
   
   Indicator1=findstr(ExcelName{1,i},'intra');
   
   Len_Indicator1=length(Indicator1);
   
   if (Len_Indicator1>0)
       
      TypeVector(1,i)=1; 
       
      continue; 
       
   end   
   
   % For Type 2
   
   Indicator2=findstr(ExcelName{1,i},'daily');
   
   Len_Indicator2=length(Indicator2);
   
   if (Len_Indicator2>0)
       
      TypeVector(1,i)=2; 
       
      continue; 
       
   end   
   
   Indicator2=findstr(ExcelName{1,i},'Daily');
   
   Len_Indicator2=length(Indicator2);
   
   if (Len_Indicator2>0)
       
      TypeVector(1,i)=2; 
       
      continue; 
       
   end     
   
   Indicator2=findstr(ExcelName{1,i},'day'); 
   
   Len_Indicator2=length(Indicator2);
   
   if (Len_Indicator2>0)
       
      TypeVector(1,i)=2; 
       
      continue; 
       
   end     
   
   Indicator2=findstr(ExcelName{1,i},'Day');
   
   Len_Indicator2=length(Indicator2);
   
   if (Len_Indicator2>0)
       
      TypeVector(1,i)=2; 
       
      continue; 
       
   end     
   
   % For Type 3
   
   Indicator3=findstr(ExcelName{1,i},'month');
   
   Len_Indicator3=length(Indicator3);
   
   if (Len_Indicator3>0)
       
      TypeVector(1,i)=3; 
       
      continue; 
       
   end     
   
   Indicator3=findstr(ExcelName{1,i},'Month');  
   
      Len_Indicator3=length(Indicator3);
   
   if (Len_Indicator3>0)
       
      TypeVector(1,i)=3; 
       
      continue; 
       
   end  
   
   
end

% Computing Excel Files to be Read using TypeVector

ExcelFileRead=find(TypeVector);



%% Reading the Excel Files

% Getting Number of Sheets for all Excel Files

i=0; % Initialization

for i=ExcelFileRead;
    
  Filename=ExcelName{1,i};
  
  Fullpathname=strcat(Pathname,Filename);

    [~,sheets] = xlsfinfo(Fullpathname);
    numOfSheets(1,i) = numel(sheets);
  
end

% Reading Each Excel File with all the Sheets

i=0; % Initializations

j=0; % Initializations

for i=ExcelFileRead;
    
    Filename=ExcelName{1,i};

    Fullpathname=strcat(Pathname,Filename);
          
    for j=1:numOfSheets(1,i)

    [DataAcquired(:,:,j)]=xlsread(Fullpathname,j);

    end       
    
    ExcelFileData{1,i}=DataAcquired;
    
    clear DataAcquired
 
end 


