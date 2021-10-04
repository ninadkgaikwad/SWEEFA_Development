function [ Header ] = DataCleaner_HeaderString_Parser(Headers, DataFile,DataCols)

%% Function Details:


%% Input File Header String Parsing

if (Headers==1)

    % Getting the Header Text

    Header1 = DataFile(1,5:(DataCols+4));    

    Header = {'Day', 'Month', 'Year', 'Time'};

    % Concatenating Headers derived frome the Original File

    Header = [Header, Header1];    

elseif (Headers==0)

    Header = {'Day', 'Month', 'Year', 'Time'};

end

end

