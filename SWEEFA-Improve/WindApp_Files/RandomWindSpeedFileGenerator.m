%% Creating Randomly Distributed Wind Speed Values in m/s

% Setting Random Number Setting
s = rng;

% Getting uniform disribution of random Wind Speed Values in range [a,b]

a=[1];
b=[25];

Res=[60];
TotDays=[365];
TotDataPoints=TotDays*(24*(60/Res));

r = a + (b-a).*rand(TotDataPoints,1);

WindSpeed=r;

% Creating Excel File

filename = 'Random_WindSpeedFile.xlsx';

sheet = 1;

xlRange = 'A2';

xlswrite(filename,WindSpeed,sheet,xlRange);
