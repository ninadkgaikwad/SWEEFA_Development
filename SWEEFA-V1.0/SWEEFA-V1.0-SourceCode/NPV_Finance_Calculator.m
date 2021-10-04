function [NPV]=NPV_Finance_Calculator(CashFlow,Int,ProjectLife)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Computing NPV

% Computing Summation Part of NPV

NPV_Sum=0;

for i=2:(ProjectLife+1)
    
    n=i-1;
    
    NPV_Sum=NPV_Sum+((CashFlow(1,i))/(1+(Int/100))^(n));

end

% Computing Total NPV

NPV=NPV_Sum+CashFlow(1,1);

