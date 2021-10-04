function [IRR]=IRR_Finance_Calculator(CashFlow,ProjectLife)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%% Computing IRR

% Initializing Rate of Interest

IRR=-0.1;

% Initializing Step Change in Rate of Interest

h=0.1;

% Initializing While condition

Condition=1;

% Debugger=0; % For Debugging

% Computing IRR using NPV==0 Condition in a while Loop

while (Condition>0.01)
    
    % Incrementing Rate of Interest
    
    IRR=IRR+h;
    
    % Computing NPV using external function
    
    [NPV]=NPV_Finance_Calculator(CashFlow,IRR,ProjectLife);
    
    % Updating While Loop Condition
    
    Condition=NPV;
    
   % Debugger=Debugger+1;
end


end

