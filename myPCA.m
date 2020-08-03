% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% marking id - 88693

function [U,S] = myPCA(X)
%myPCA function receives a dataset as an input argument and returns two
%arguments i.e. matrix which contains principal components & set of
%corresponding eigenvalues.
covX = cov(X); %covariance of input matrix
[A,B] = eig(covX); %calculating eigenvectors & eigenvalues
[~,index] = sort(diag(B),'descend'); %sorting in descending order of eigenvalues
U = A(:,index); %storing principal components
S = B(index,index); %storing eigenvalues
end
