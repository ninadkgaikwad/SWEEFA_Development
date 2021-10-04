function [ RowData, ColumnData ] = WRFNetcdf_HorizontalGrid_CellFinder(LongData, LatData, trueLong, trueLat )

%% Function Details

% LongData = XLONG Data
% LatData = XLAT Data
% trueLong = The Location Longitude required by the user
% trueLat = The Location Latitude required by the user

%% Finding the best cell for given trueLat and trueLong

% Setting Long and Lat to be Unstaggered a get corRect Cell

%Long='XLONG';
%Lat='XLAT';

% Getting the Variable orizontal Grid Lat-Long Data

%LongData = ncread(Fullpathname,Long);
%LatData = ncread(Fullpathname,Lat);

% Computing the Size og the Lat-Long Data 

[r,c]=size(LongData);

% Combining the Variables Lat-Long Data

CombinedLatLong=cell(r,c);

for i=1:r

    for j=1:c

       latt=LatData(i,j);
       longg=LongData(i,j);
       CombinedLatLong(i,j)={[latt,longg]};

    end

end

% Computing the Error between true Lat-Long and Lat-Long Data

TotalError=zeros(r,c);

for i=1:r

    for j=1:c

        LatLong=CombinedLatLong{i,j};

        latt=LatLong(1,1);
        longg=LatLong(1,2);

        laterror=abs(latt-trueLat);
        longerror=abs(longg-trueLong);

        TotalError(i,j)=laterror+longerror;       


    end

end

% Computing the Indices of the Cellin the Horizontal Grid based on the Error Matrix

[Min1,Index1]=min(TotalError);

[Min2,Index2]=min(Min1);

ColumnData=Index2;

RowData=Index1(1,Index2) ;  


end

