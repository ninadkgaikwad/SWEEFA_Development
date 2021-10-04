% Rayleigh Distribution of Wind Speed

%% Initializations

Vmean=[6.35];

k=2;

c=(2/(sqrt(pi)))*Vmean;

% c=10;

DenSTC=1.225;

dv=1;

v=0:dv:50;

lenV=length(v);

%% Weibull Distribution

H=(k/c)*((v/c).^(k-1)).*(exp(-(v/c).^(k)));
figure(1);
hold on
plot(v,H*8760);
HH=H*8760*dv;

%% Rayleigh Distribution Equation

h=((2*v/c.^(2)).*exp(-(v/c).^(2)));

figure(2);
hold on
plot(v,h);

%% Root Mean Cube Speed

% For Weibull Distribution

VrmcWeibull=(sum((H.*(v.^(3)))*dv))^(1/3);

% For Rayleigh Distribution

VrmcRayleigh=(sum((h.*(v.^(3)))*dv))^(1/3);

%% Energy Density based on Rayleigh Distribution (GilBert Masters)

Vrmc=(6/pi)*(Vmean)^(3);

% Wind Power/Energy Density of Site

Prmc=((1/2)*(DenSTC)*(Vrmc)); % W/m^(2)

Ermc=8760*(Prmc); % Wh/m^(2)

% Wind Turbine Power/Energy Density at Site

Ptur=(0.5)*((1/2)*(DenSTC)*(Vrmc)); % W/m^(2)

Etur=8760*(Ptur); % Wh/m^(2)

%% Energy Density Curve

% Wind Power/Energy Density Curve of Site

Ecurve=((1/2)*(DenSTC)*((v).^(3).*(h))); % Wh/m^(2)

figure(1);
hold on
plot(v,Ecurve/1000*8760);


