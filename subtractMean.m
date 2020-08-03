% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% marking id - 88693

function [Xmu,mu] = subtractMean(X)
%subtractMeans function receives a dataset as an input argument and returns
%two arguments dataset obtained after subtracting its mean and the mean of
%input dataset
mu = mean(X);
Xmu = X - mu;
end