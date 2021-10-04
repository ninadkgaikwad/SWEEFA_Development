function [ Var_MetaData ] = Read_WRFNetcdf_Metadata_Test(  )


%% Open File to get its Handle

fid = fopen('FileCompleteDetails');

%% Reading Text File Line By Line

tline = fgetl(fid);
i=0;
while ischar(tline)
    i=i+1;
   % disp(tline)
    Text_Cell(i,1)={tline};
    tline = fgetl(fid);
end
fclose(fid);


% Getting Size of Text_Cell
[r, c] = size(Text_Cell);

% Finding Text Row number in Text_Cell

Text = '\sDZS\s';

for i=1:r
    
   Index = i
   
   Text_at_i = Text_Cell{i,1};
   
   MatchedText = regexp(Text_at_i,Text,'match'); % Finding String Pattern in the Current Line
   
   if (length(MatchedText)>0)
       
      break; 
       
   end
    
end

%% Finding the Size, Units and Coordinates Text

Size_Text = Text_Cell{(Index+1),1};
Dimensions_Text = Text_Cell{(Index+2),1};
Units_Text = Text_Cell{(Index+8),1};
Coordinates_Text = Text_Cell{(Index+10),1};

%% Getting Size, Units and Coordinates Useful Text

% Dealing with the Size_Text
Size_Text1 = strsplit(Size_Text,':');
Size_Text2 = strsplit(Size_Text1{1,2},'x');

for i=1:length(Size_Text2)
    
   Var_Size(1,i) = str2num(Size_Text2{1,i});
    
end

% Dealing with the Dimensions_Text
Dimensions_Text1 = strsplit(Dimensions_Text,':');
Dimensions_Text2 = strsplit(Dimensions_Text1{1,2},',');

for i=1:length(Dimensions_Text2)
    
   Var_Dimensions_TextCell1(1,i) = {regexp(Dimensions_Text2{1,i},'[\w*]','match')}; 
    
end

for i=1:length(Var_Dimensions_TextCell1)
    
    Var_Dimensions_TextCell = Var_Dimensions_TextCell1{1,i};
    
    Var_Dimensions1 = '';
    
    for j=1:length(Var_Dimensions_TextCell)
        
       Var_Dimensions1(1,j) = Var_Dimensions_TextCell{1,j};  
        
    end
    
    Var_Dimensions(1,i) = {Var_Dimensions1};
    
end

%Var_Dimensions = Dimensions_Text2;


% Dealing with the Units_Text
Units_Text1 = strsplit(Units_Text,'=');
Units_Text2 = regexp(Units_Text1{1,2},'[\w*]','match');

for i=1:length(Units_Text2)
    
   Var_Units(1,i) = Units_Text2{1,i};
    
end

% Dealing with the Coordinates_Text
Coordinates_Text1 = strsplit(Coordinates_Text,'=');
Coordinates_Text2 = strsplit(Coordinates_Text1{1,2},' ');

for i=2:length(Coordinates_Text2)
    
   Var_Coordinates_TextCell1(1,i) = {regexp(Coordinates_Text2{1,i},'[\w*]','match')}; 
    
end

for i=2:length(Var_Coordinates_TextCell1)
    
    Var_Coordinates_TextCell = Var_Coordinates_TextCell1{1,i};
    
    Var_Coordinates1 = '';
    
    for j=1:length(Var_Coordinates_TextCell)
        
       Var_Coordinates1(1,j) = Var_Coordinates_TextCell{1,j};  
        
    end
    
    Var_Coordinates(1,i-1) = {Var_Coordinates1};
    
end

Var_MetaData={Var_Size,Var_Dimensions,Var_Units, Var_Coordinates };

end

