% Insert your code below

function pD = projectData(Xmu,U,k)
%projectData function receives 3 arguments i.e. a dataset, set of
%eigenvectors and integer k. function outputs only one argument i.e. a
%dataset which is obtained from projecting input dataset onto k
%eigenvectors.
pD = Xmu * U(:,1:k); %projecting k eigenvectors onto input data
end
