function [WRFNetcdf_MetaData_Cell] = WRFNetcdf_Metadata_Parser(WRFNetcdf_AllVariables, Len_WRFNetcdf_AllVariables)

%% Function Details

% WRFNetcdf_AllVariables = It is Cell of all the Variable Names to be Extracted from the WRF-NETCDF File
% Len_WRFNetcdf_AllVariables = Length of WRFNetcdf_AllVariables

%% Parsing the FileCompleteDetails into a Cell Structure

% Open File to get its Handle

fid = fopen('FileCompleteDetails');

% Reading Text File Line By Line

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

%% Parsing Metadata from the FileCompleteDetails for each WRFNetcdf Variable

WRFNetcdf_MetaData_Cell=cell(1,3); % Initializing WRFNetcdf_MetaData_Cell

for k=1:Len_WRFNetcdf_AllVariables  % For each Variable Name in the WRFNetcdf_AllVariables
    
    % Finding Text Row number in Text_Cell

    Text = ['\s', WRFNetcdf_AllVariables{1,k} ,'\s'];

    for i=1:r

       Index = i;

       Text_at_i = Text_Cell{i,1};

       MatchedText = regexp(Text_at_i,Text,'match'); % Finding String Pattern in the Current Line

       if (length(MatchedText)>0)

          break; 

       end

    end  
    
    % Finding Size Metadata
    Size_Text = Text_Cell{(Index+1),1}; 
    
    % Dealing with the Size_Text
    Size_Text1 = strsplit(Size_Text,':');
    Size_Text2 = strsplit(Size_Text1{1,2},'x');

    for i=1:length(Size_Text2)

       Var_Size(1,i) = str2num(Size_Text2{1,i});

    end    
    
    Len_Size=length(Var_Size);
    
    % Finding Dimensions and Coordinates Metadata according to length of Size Metadata
    if (Len_Size==2) % Variable is 2-D
        
        % Finding Dimensions Metadata
        Dimensions_Text = Text_Cell{(Index+2),1};
        
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
        
        % Finding Coordinates Metadata
        Var_Coordinates={0};
        
    elseif ((Len_Size==3) || (Len_Size==4)) % Variable is eithr 3-D or 4-D
        
        % Finding Dimensions Metadata
        Dimensions_Text = Text_Cell{(Index+2),1};
        
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
        
        % Finding Coordinates Metadata
        Coordinates_Text = Text_Cell{(Index+10),1};

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
        
       
    end
    
    % Filling the WRFNetcdf_MetaData_Cell

    WRFNetcdf_MetaData_Cell(k,:)={Var_Size, Var_Dimensions, Var_Coordinates};
    
end

end

