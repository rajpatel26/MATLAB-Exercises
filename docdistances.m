 % Insert your code below


% Let's start by extracting all the content from all 6 documents
%RedRidingHood
RRH = importdata('RedRidingHood.txt');
RRH = lower(RRH);
RRH = strsplit(RRH{:});
contentRRH = string(RRH);

%PrincessPea
PPea = importdata('PrincessPea.txt');
PPea = lower(PPea);
PPea = strsplit(PPea{:});
contentPPea = string(PPea);

%Cinderella
Cinde = importdata('Cinderella.txt');
Cinde = lower(Cinde);
Cinde = strsplit(Cinde{:});
contentCinde = string(Cinde);

%CAFA1
CAFA1 = importdata('CAFA1.txt');
CAFA1 = lower(CAFA1);
CAFA1 = strsplit(CAFA1{:});
contentCAFA1 = string(CAFA1);

%CAFA2
CAFA2 = importdata('CAFA2.txt');
CAFA2 = lower(CAFA2);
CAFA2 = strsplit(CAFA2{:});
contentCAFA2 = string(CAFA2);

%CAFA3
CAFA3 = importdata('CAFA3.txt');
CAFA3 = lower(CAFA3);
CAFA3 = strsplit(CAFA3{:});
contentCAFA3 = string(CAFA3);

%Let's define corpus - entire set of 6 documents
corpus = [contentRRH, contentPPea, contentCinde, contentCAFA1, contentCAFA2, contentCAFA3];

%to get unique words
corpus = unique(corpus);

%initialization of tf, idf, cosine, cosinedist
tf = zeros(length(corpus),6);
idf = zeros(length(corpus),1);
cosine = zeros(6);
cosinedist = zeros(6);

%calculate tf
%looping through all words 
%we get occurances of each term in a document using nnz
%strcmp returns 1 if term is present else 0 
for i = 1:length(corpus)
    tf(i,1) = nnz(strcmp(corpus(i),RRH));
    tf(i,2) = nnz(strcmp(corpus(i),PPea));
    tf(i,3) = nnz(strcmp(corpus(i),Cinde));
    tf(i,4) = nnz(strcmp(corpus(i),CAFA1));
    tf(i,5) = nnz(strcmp(corpus(i),CAFA2));
    tf(i,6) = nnz(strcmp(corpus(i),CAFA3));
end

%calculate idf
for i = 1:length(corpus)
    idf(i) = log10(6/nnz(tf(i,:)));
end

%calculate tf-idf & storing in a 6*6 matrix
tfidf = idf.*tf;
for i = 1:6
    for j = 1:6
        cosine(i,j) = dot(tfidf(:,i),tfidf(:,j))/((dot(tfidf(:,i),tfidf(:,i))^0.5)*(dot(tfidf(:,j),tfidf(:,j))^0.5)); %cosine of 2 vectors
        cosinedist(i,j) = 1 - cosine(i,j);  %cosine distance
    end
end

%figure
imagesc(cosinedist);

%setting colormap to gray
colormap(gray);

%to include colorbar in figure
colorbar;

%labels
labels = {'RRH','PPea','Cinde','CAFA1','CAFA2','CAFA3'};
set(gca, 'XTicklabels',labels);
set(gca, 'YTicklabels',labels);

%title
title('Cosine Distance');
