% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
% 
%
% 
% Insert BELOW your code 
% marking id - 88693

%Part 1
%loading datapoints from pcadata.mat
X = load('pcadata.mat');

%figure 1
figure;
plot(X.X(:,1),X.X(:,2),'bo'); %blue o
xlim([0,7]); %xmin xmax
ylim([2,8]); %ymin ymax

%calling function subtractMean
[Xmu,mu] = subtractMean(X.X);

%calling function myPCA
[U,S] = myPCA(Xmu); %#ok<ASGLU>

%adding to figure 1
%plot of 2 principal components
line([0 U(1,1)] + mu(1,1), [0 U(2,1)] + mu(1,2), 'color', 'r','LineWidth',2); %largest eigenvalue
line([0 U(1,2)] + mu(1,1), [0 U(2,2)] + mu(1,2), 'color', 'g','LineWidth',2); %second largest eigenvalue
title('Datapoints and their 2 principal components');
fprintf('top eigenvector coordinates are: (%f,%f), (%f,%f)\n',U(1,1)+mu(1),mu(1),U(2,1)+mu(2),mu(2)); %printing coordinates of top eigenvector

%adding mean to the eigenvectors
Umu = U + mu;

%defining k=1
K = 1;

%calling projectData function
Z = projectData(Xmu, U, K);

%printing the projection of first 3 points
fprintf('Projection of the first 3 points: %f, %f, %f\n',Z(1:3, :));

%calling recoverData function
Xrec = recoverData(Z, U, K, mu);

%figure 2
figure;
plot(X.X(:,1),X.X(:,2),'bo'); %blue o
xlim([0,7]); %xmin xmax
ylim([2,8]); %ymin ymax
title('Datapoints and their reconstruction');
hold on
plot(Xrec(:,1),Xrec(:,2),'r*'); %projecting recovered points as red * 


%Part 2
%loading datapoints from pcafaces.mat
X2 = load('pcafaces.mat');

%figure 3
figure;
displayData(X2.X(1:100, :)); %display first 100 images

%Subtract mean
[Xmu, mu] = subtractMean(X2.X);

%projecting first 200 principal components
[U, S] = myPCA(Xmu);
K = 200; %defining k

%Project data
Z = projectData(Xmu, U, K);

%Recover data
recover = recoverData(Z, U, K, mu);

%figure 4
figure;
subplot(1,2,1),displayData(X2.X(1:100, :)); %subplot 1 with original faces
title('Original faces');
subplot(1,2,2),displayData(recover(1:100, :)); %subplot 2 with recovered faces
title('Recovered faces');