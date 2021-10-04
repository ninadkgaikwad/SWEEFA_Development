function [ ProcessedData ] = PVSyst_Hourly_Year_Data( NameOfVariable )
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here

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


Count=3; % Index for Hourly Values (i.e the Rows)

Count1=2; % Index for Hourly Values (i.e the Columns)

% Converting the Columnar Data Into a Matrix Style Data
for k=3:8762 
    
    if Count==27
        
        Count=3;
        
        Count1=Count1+1;
        
    end
    
    ProcessedData{Count,Count1}=DataFile{k,2};
    
    Count=Count+1;  
   
    
    
        
end
  


filename = 'Procesed_File.xlsx';

xlswrite(filename,ProcessedData);


end

