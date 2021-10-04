%% Test

%% Initial Set-Up

clear all;
clc;

%% Loading Data - Power Curve

Power_Struct=load('PowerData');
Ws_Struct=load('WindSpeedData');

%% Converting Structs to Vectors

Power=Power_Struct.Power;
Ws=Ws_Struct.Ws;

%% Creating Power Curves from Algorithms

% Initialization
Ws_Mean=0;    
Power_Mean1=0;    
Power_Mean2=0;    
Power_Mean3=0;    
Power_Mean4=0;    

for i=1:(length(Ws)-15)
    
    Ws1=find((Ws>=Ws(i,1)));
    
    Ws2=find((Ws<Ws((i+15),1)));
    
    Ws3=intersect(Ws1,Ws2);
    
    Ws_Val=Ws(Ws3);
    
    Power_Val=Power(Ws3);
    
    Ws_Mean(i+1,1)=mean(Ws_Val);
    
    Power_Mean1(i+1,1)=(sum(Power_Val))/(length(Ws_Val));
    
    Power_Mean2(i+1,1)=(sum(Power_Val.*(Ws_Val.^3)))/(sum(Ws_Val.^3));
    
    Power_Mean3(i+1,1)=(sum(Power_Val.*Ws_Val))/(sum(Ws_Val));
    
    Power_Mean4(i+1,1)=(Power_Mean1(i+1,1)+Power_Mean2(i+1,1)+Power_Mean3(i+1,1))/3;
    
end

%% Creating Plot -Power Curve

figure(1)

hold on
grid on

title('Power-Curve Comparison - Algorithm 1');
xlabel('WindSpeed (m/s)');
ylabel('Power (kW)');

plot(Ws,Power,'k-^');
plot(Ws_Mean,Power_Mean1,'r-o');

hold off

figure(2)

hold on
grid on

title('Power-Curve Comparison - Algorithm 2');
xlabel('WindSpeed (m/s)');
ylabel('Power (kW)');

plot(Ws,Power,'k-^');
plot(Ws_Mean,Power_Mean2,'g-s');


hold off

figure(3)

hold on
grid on

title('Power-Curve Comparison - Algorithm 3');
xlabel('WindSpeed (m/s)');
ylabel('Power (kW)');

plot(Ws,Power,'k-^');
plot(Ws_Mean,Power_Mean3,'b-d');

hold off

figure(4)

hold on
grid on

title('Power-Curve Comparison Algorithm 4');
xlabel('WindSpeed (m/s)');
ylabel('Power (kW)');

plot(Ws,Power,'k-^');
plot(Ws_Mean,Power_Mean4,'y-*');

hold off




