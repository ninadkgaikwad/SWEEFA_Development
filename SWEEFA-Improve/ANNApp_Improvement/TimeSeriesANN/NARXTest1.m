%% NARX - Test

% Getting the Data Set
[X,T] = maglev_dataset;

% Creating the NARX Net
net = narxnet(1:2,1:2,10);

% Preparing the Input Data for Training
[x,xi,ai,t] = preparets(net,X,{},T);

% Traaining the Network with Prepared Data
net = train(net,x,t,xi,ai);

% Simulating the Network
y = net(x,xi,ai);

y1 = net(x(2,1),xi,ai);

% Viewing the Network
view(net)