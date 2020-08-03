% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% marking id - 88693

function [] = plotrandstem(text_file,n)
%plotrandstem function takes 2 input parameters a file name & number n
%It then randomly picks n number of coordinates and creates a stem plot.

% Get the coordinates for ploting
i = readtable(text_file);

% Get X coordinates
x1=i(:,2);
% Get Y coordinates
y1=i(:,4);

%Error message if it exceeds the number of points in text file
if n > height(y1)
    error('Number higher than available data points, please try a number lower than 102')
end

% Random selection of n no. of X coordinates 
x2 = datasample(x1,n);
% Random selection of n no. of Y coordinates
y2 = datasample(y1,n);
    
% Converting X & Y coordinates into an array
x3=table2array(x2);
y3=table2array(y2);

% Ploting
stem(x3,y3)    
xlabel('x axis');
ylabel('y axis');
title(strcat(string(n),' random data points'))
grid on;
end