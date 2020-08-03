% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% marking id - 88693

function [C,V] = mykmeans(n,k)
%mykmeans takes two input arguments i.e. data and no. of clusters to be formed
%Results into a scatter plot that shows the clusters with the centroids.
%mykmeans outputs two arguments i.e. C which is final position of centroids & V specifying the
%cluster to which each point belongs.
    
centroid = datasample(n,k); %randomly selected k centroids
m = zeros(length(n),1); %initialized to zero for comparision
n = [n,ones(length(n),1)]; %adding a row of ones for comparision

%looping & comparing each element
while(any(m~=n(:,3)))
    m = n(:,3);
    [~,index] = min(pdist2(centroid,n(:,1:2))); %euclidean distance
    n(:,3) = index; %storing calculated distances
    % taking mean of all points & comparing each point to each centroid to
    % find which point is closest to which centroid
    for i = 1:k
        centroid(i,:) = mean(n(n(:,3)==i,1:2));
    end
end
C = (centroid); %storing centroid
V = n(:,3); %storing vector specifying which point belongs to which cluster
col = ['y','b','m','g','c','r','k']; %colors
% Ploting
for i = 1:k
    scatter(n(V==i,1),n(V==i,2),col(i),'marker','x') %scatter plot
    hold on;
end
%Adding centroids to the same plot
plot(C(:,1),C(:,2),'dk','markersize',10,'markerfacecolor','r')
grid on;
title('K-means clustering');
hold off;
end