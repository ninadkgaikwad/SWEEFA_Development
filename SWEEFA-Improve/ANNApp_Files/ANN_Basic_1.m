% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by NFTOOL
%
% This script assumes these variables are defined:
%
%   houseInputs - input data.
%   houseTargets - target data.


%% Loading House Dataset from MATLAB Path

% The targets and inputs should be ROW Vectors

load house_dataset;
 
inputs = houseInputs;
targets = houseTargets;

% net = feedforwardnet([Vector of Hiddent Layer Neurons], 'TrainingFunction'); % fitnet(); feedforwardnet() ; Cascadedforwardnet()
% net = init(net); % Initializing Weigths and Biases
% net = configure(net,houseInputs,houseTargets); % Configuring network (initialize and making network ready for training)
% [net,tr] = train(net,inputs,targets); % Traing the network as per net object parameters and the inputs and targets arrays


% Training Function	 Algorithm
% 
% 'trainlm'	         Levenberg-Marquardt
% 
% 'trainbr'	         Bayesian Regularization
% 
% 'trainbfg'	     BFGS Quasi-Newton
% 
% 'trainrp'	         Resilient Backpropagation
% 
% 'trainscg'	     Scaled Conjugate Gradient
% 
% 'traincgb'	     Conjugate Gradient with Powell/Beale Restarts
% 
% 'traincgf'	     Fletcher-Powell Conjugate Gradient
% 
% 'traincgp'	     Polak-Ribi�re Conjugate Gradient
% 
% 'trainoss'	     One Step Secant
% 
% 'traingdx'	     Variable Learning Rate Gradient Descent 
% 
% 'traingdm'	     Gradient Descent with Momentum
% 
% 'traingd'	         Gradient Descent

% There are several algorithm characteristics that can be deduced from the 
% experiments described. In general, on function approximation problems, 
% for networks that contain up to a few hundred weights, the 
%     Levenberg-Marquardt algorithm will have the fastest convergence. 
%     This advantage is especially noticeable if very accurate training is 
%     required. In many cases, trainlm is able to obtain lower mean square
%     errors than any of the other algorithms tested. However, as the number
%     of weights in the network increases, the advantage of trainlm
%     decreases. In addition, trainlm performance is relatively poor on 
%     pattern recognition problems. The storage requirements of trainlm 
%     are larger than the other algorithms tested. By adjusting the mem_reduc
%     parameter, discussed earlier, the storage requirements can be reduced,
%     but at the cost of increased execution time.
% 
% The trainrp function is the fastest algorithm on pattern recognition
% problems. However, it does not perform well on function approximation 
% problems. Its performance also degrades as the error goal is reduced.
% The memory requirements for this algorithm are relatively small in
% comparison to the other algorithms considered.
% 
% The conjugate gradient algorithms, in particular trainscg, seem to perform
% well over a wide variety of problems, particularly for networks with a 
% large number of weights. The SCG algorithm is almost as fast as the LM
% algorithm on function approximation problems (faster for large networks) 
% and is almost as fast as trainrp on pattern recognition problems. 
% Its performance does not degrade as quickly as trainrp performance 
% does when the error is reduced. The conjugate gradient algorithms have 
% relatively modest memory requirements.
% 
% The performance of trainbfg is similar to that of trainlm. It does not
% require as much storage as trainlm, but the computation required does 
% increase geometrically with the size of the network, because the equivalent
% of a matrix inverse must be computed at each iteration.
% 
% The variable learning rate algorithm traingdx is usually much slower than 
% the other methods, and has about the same storage requirements as trainrp
% , but it can still be useful for some problems. There are certain
% situations in which it is better to converge more slowly. For example, 
% when using early stopping you can have inconsistent results if you use
% an algorithm that converges too quickly. You might overshoot the point at 
% which the error on the validation set is minimized.

 
%% Create a Fitting Network
trainFcn='trainlm';

hiddenLayerSize = 10;

net = fitnet(hiddenLayerSize,trainFcn);

% net = feedforwardnet(hiddenLayerSize,trainFcn);
% 
% net = cascadeforwardnet(hiddenLayerSize,trainFcn)

% Set up Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
 
%% Train the Network
[net,tr] = train(net,inputs,targets); % Trains the network according to the pre selected algorithm and the input data
                                      % tr=[epoch,perf]
%% Test the Network
outputs = net(inputs);
errorsAll = gsubtract(outputs,targets);
performance = perform(net,targets,outputs) % Gives the Mean-Squared Error
perfs = mse(net,targets,outputs); % Gives the Mean-Squared Error
 
%% View the Network
view(net)

%% Analyzing Multilayer Neural Networks

% tr = 
% 
%         trainFcn: 'trainlm'
%       trainParam: [1x1 struct]
%       performFcn: 'mse'
%     performParam: [1x1 struct]
%         derivFcn: 'defaultderiv'
%        divideFcn: 'dividerand'
%       divideMode: 'sample'
%      divideParam: [1x1 struct]
%         trainInd: [1x354 double]
%           valInd: [1x76 double]
%          testInd: [1x76 double]
%             stop: 'Validation stop.'
%       num_epochs: 12
%        trainMask: {[1x506 double]}
%          valMask: {[1x506 double]}
%         testMask: {[1x506 double]}
%       best_epoch: 6
%             goal: 0
%           states: {1x8 cell}
%            epoch: [0 1 2 3 4 5 6 7 8 9 10 11 12]
%             time: [1x13 double]
%             perf: [1x13 double]
%            vperf: [1x13 double]
%            tperf: [1x13 double]
%               mu: [1x13 double]
%         gradient: [1x13 double]
%         val_fail: [0 0 0 0 0 1 0 1 2 3 4 5 6]
%        best_perf: 7.0111
%       best_vperf: 10.3333
%       best_tperf: 10.6567

houseOutputs = net(houseInputs);

% Getting Neural Net Inputs for Training, Validation and Test Set
inputTrain=tr.trainInd ; % Input for Training Set
inputVal=tr.valInd ; % Input for Training Set
inputTest=tr.testInd ; % Input for Training Set

% Getting Neural Net Outputs for Training, Validation and Test Set
trOut = houseOutputs(tr.trainInd); % Output for Training Set
vOut = houseOutputs(tr.valInd); % Output for Validation Set
tsOut = houseOutputs(tr.testInd);% Output for Testing Set

% Getting Neural Net Targets for Training, Validation and Test Set
trTarg = houseTargets(tr.trainInd); % Targets for Training Set
vTarg = houseTargets(tr.valInd); % Targets for Validation Set
tsTarg = houseTargets(tr.testInd); % Targets for Testing Set

% Calculating Errors
errorsTrain = gsubtract(trOut,trTarg);
errorsVal = gsubtract(vOut,vTarg);
errorsTest = gsubtract(tsOut,tsTarg);

% Plotting Performance of the Neural Net
figure;
plotperform(tr)

% Plotting Training State
figure;
plottrainstate(tr)

% % Plotting Fit
% figure;
% plotfit(trTarg,inputTrain,'Train',vTarg,inputVal,'Validation',...
% tsTarg,inputTest,'Testing',targets,inputs,'All')
figure;
plotfit(net,trTarg,trOut,'Train')
% plotfit(net,inputTrain,trTarg,'Train')

figure;
plotfit(net,vTarg,vOut,'Validation')
% plotfit(net,inputVal,vTarg,'Validation')

figure;
plotfit(net,tsTarg,tsOut, 'Test')
% plotfit(net,inputTest,tsTarg, 'Test')

figure;
 plotfit(net,targets,outputs,'All')
% plotfit(net,inputs,targets,'All')

% Plotting Regression
figure;
plotregression(trTarg,trOut,'Train',vTarg,vOut,'Validation',...
tsTarg,tsOut,'Testing',targets,outputs,'All')

% Plotting Errors
figure;
ploterrhist(errorsTrain,'Train',errorsVal,'Validation',...
errorsTest,'Testing')
 
%% Plots
%  Uncomment these lines to enable various plots.
%  figure, plotperform(tr)
%  figure, plottrainstate(tr)
 figure, plotfit(net,targets,outputs) % plotfit(targets1,inputs1,'name1',...)
%  figure, plotregression(targets,outputs) % plotregression(targs1,outs1,'name1',targs2,outs2,'name2',...)
%  figure, ploterrhist(errorsAll) % ploterrhist(e1,'name1',e2,'name2',...)