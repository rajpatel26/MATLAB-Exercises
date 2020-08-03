% Insert your code below

function [Xmu,mu] = subtractMean(X)
%subtractMeans function receives a dataset as an input argument and returns
%two arguments dataset obtained after subtracting its mean and the mean of
%input dataset
mu = mean(X);
Xmu = X - mu;
end
