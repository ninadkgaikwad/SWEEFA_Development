% Solar PHotovoltaic Power Plant Information for Generation/Irradiance Data Cleaning

%% PV Plant Geographical Information

Lat=[ 23.275];

Long=[ 72.682831];

%% PV Plant Geographical Rain Information for Clearness Index Calculations

RainSnowMonths=[0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0 ]; % Vector of 1's and 0's depicting months with/witout rainfall respectively; indices of the vector indicate the month number; always give 12 month per year data even if the actual data is not of the entire year

yr=[1 ]; % 1 or 0 if rainfall data is in mm/year or not respectively

mr=[0 ]; % 1 or 0 if rainfall data is in mm/month or not respectively

YearRain=[800,700 ]; % Vector for yearly rainfall data; it should have values to each year of data

MonthRain=[ 0 ]; % Vector for monthly rainfall data; it should have length equal to RainSnowMonths Vector; and the values should be filled where the RainSnowMonths Vector has has value 1

%% Plant Technology Information (Fill ordered Info according to the Data File Structure)

Pmod=[95,250,235,107,85 ];

PVTech=[2,1,1,2,2 ];

ModNum=[1056,405,432,924,1170 ];

ModTemCF=[-0.38,-0.47,-0.43,-0.25,-0.25 ];

%% Plant Loss Factors (Following initialized Values are Default Values)

SF=[ 2 ]; % Soiling Factor in percntage

LID=[ 2 ]; % Light Induced Degradation in percentage

LS=[ 3 ]; % Light Soaking in percentage

Arraymismat=[ 2 ]; % Array Mismatch in percentage

OhmicLoss=[ 3 ]; % Wiring Loss in Percentage

rho=[ 0.2 ]; % Albedo Value (0 to 1)

INVeff=[ 98 ]; % Inverter Efficienct in percentage

TransLoss=[ 1 ]; % Transformer Loss in percentage

Uo=[ 25 ]; % Co-efficient of Constant Heat Transfer in W/m^(2)K

U1=[ 6.84 ]; % Co-efficient of Convective Heat Transfer in W/m^(2)K

Shading=[ 2 ]; % Shading Loss in percentage

bo=[ 0.05 ]; % IAM Loss factor

%% PV Plant Orientation Information

OrientationType=[1 ]; % Fixed Tilt=1, Seasonal Tilt=2, Single Axis E-W=3, Single Axis N-S=4, Double Axis=5

OrientationParameters=[24,0,0,0,0,0,0,0 ]; % [ tilt, phic, tiltsummer, tiltwinter, phicmax, phicmin, tiltmax, tiltmin ]


%% Data File Time Step (i.e. Resoluton) in Mins

HHres=[ 5]; % Give Value in Minutes



