%% Methods for increasing Generalizations and Overfitting Problems in ANN


% One of the problems that occur during neural network training is called overfitting. 
% The error on the training set is driven to a very small value, but when 
% new data is presented to the network the error is large. The network has
% memorized the training examples,
% but it has not learned to generalize to new situations.

%% Loading Training DataSet

% Loading House Dataset from MATLAB Path
load house_dataset;

%% Retraining Neural Networks

% Dividing Data Set for Designing and Training
[x,t] = house_dataset;
Q = size(x,2);
Q1 = floor(Q*0.90);
Q2 = Q-Q1;
ind = randperm(Q);
ind1 = ind(1:Q1);
ind2 = ind(Q1+(1:Q2));
x1 = x(:,ind1);
t1 = t(:,ind1);
x2 = x(:,ind2);
t2 = t(:,ind2);

% Next a network architecture is chosen and trained ten times on the first
% part of the dataset, with each network's mean square error on the second
% part of the dataset.

net = feedforwardnet(10);
numNN = 10;
NN = cell(1,numNN);
NM = cell(1,numNN);
perfs = zeros(1,numNN);
for i=1:numNN
  disp(['Training ' num2str(i) '/' num2str(numNN)])
  [NN{i},NM{i}] = train(net,x1,t1);
  y2 = NN{i}(x2);
  perfs(i) = mse(net,t2,y2);
end

%% Multiple Neural Networks

% Another simple way to improve generalization, especially when caused by 
% noisy data or a small dataset, is to train multiple neural networks and 
% average their outputs.For instance, here 10 neural networks are trained 
% on a small problem and their mean squared errors compared to the means 
% squared error of their average.

% First, the dataset is loaded and divided into a design and test set.
[x,t] = house_dataset;
Q = size(x,2);
Q1 = floor(Q*0.90);
Q2 = Q-Q1;
ind = randperm(Q);
ind1 = ind(1:Q1);
ind2 = ind(Q1+(1:Q2));
x1 = x(:,ind1);
t1 = t(:,ind1);
x2 = x(:,ind2);
t2 = t(:,ind2);

% Then, ten neural networks are trained.
net = feedforwardnet(10);
numNN = 10;
nets = cell(1,numNN);
for i=1:numNN
  disp(['Training ' num2str(i) '/' num2str(numNN)])
  nets{i} = train(net,x1,t1);
end

% 
perfs = zeros(1,numNN);
y2Total = 0;
for i=1:numNN
  neti = nets{i};
  y2 = neti(x2);
  perfs(i) = mse(neti,t2,y2);
  y2Total = y2Total + y2;
end
perfs
y2AverageOutput = y2Total / numNN;
perfAveragedOutputs = mse(nets{1},t2,y2AverageOutput) 
% 
% The mean squared error for the average output is likely to be lower than
% most of the individual performances, perhaps not all. It is likely to
% generalize better to additional new data.For some very difficult problems,
% a hundred networks can be trained and the average of their outputs taken
% for any input. This is especially helpful for a small, noisy dataset in 
%     conjunction with the Bayesian Regularization training function trainbr