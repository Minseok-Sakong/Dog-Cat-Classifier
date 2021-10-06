%For PCA-reduced data with dimension k = 50, linear discriminant analysis training error rate is 7.7%.
%For PCA-reduced data with dimension k = 50, linear discriminant test error rate is 7.3%.
%For PCA-reduced data with dimension k = 50, perceptron training error rate is 8%.
%For PCA-reduced data with dimension k = 50, perceptron test error rate is 8.5%.
%For PCA-reduced data with dimension k = 100, linear discriminant analysis training error rate is 5.9%.
%For PCA-reduced data with dimension k = 100, linear discriminant test error rate is 8.8%.
%For PCA-reduced data with dimension k = 100, perceptron training error rate is 5.6%.
%For PCA-reduced data with dimension k = 100, perceptron test error rate is 8.5%.
%For PCA-reduced data with dimension k = 200, linear discriminant analysis training error rate is 4.4%.
%For PCA-reduced data with dimension k = 200, linear discriminant test error rate is 8.3%.
%For PCA-reduced data with dimension k = 200, perceptron training error rate is 4.4%.
%For PCA-reduced data with dimension k = 200, perceptron test error rate is 9%.
%For PCA-reduced data with dimension k = 400, linear discriminant analysis training error rate is 3.1%.
%For PCA-reduced data with dimension k = 400, linear discriminant test error rate is 9.8%.
%For PCA-reduced data with dimension k = 400, perceptron training error rate is 3.4%.
%For PCA-reduced data with dimension k = 400, perceptron test error rate is 9.5%.

%This function takes in a training data matrix Xtrain and uses
%it to compute the PCA basis and a sample mean vector. 
%It also takes in a test data matrix Xtest and a dimension k. 
%It first centers the data matrices Xtrain and Xtest by subtracting the
%Xtrain sample mean vector from each of their rows. It then uses the 
%top-k vectors in the PCA basis to project the centered Xtrain and Xtest
%data matrices into a k-dimensional space, and outputs
%the resulting data matrices as Xtrain_reduced and Xtest_reduced.
function [Xtrain_reduced Xtest_reduced] = reduce_data(Xtrain,Xtest,k)
[row, col] = size(Xtrain);
muTrain = zeros(col,1);
oneVec = ones(col,1);

V = pca(Xtrain);
Vk = V(:,1:k);

for j = 1:col
    for i = 1:row
        muTrain(j,1) = muTrain(j,1) + Xtrain(i,j);
    end
end
muTrain = (muTrain/col).';
Xcentered_train = Xtrain - (ones * muTrain);
Xcentered_test = Xtest - (ones * muTrain);

Xtrain_reduced = Xcentered_train *Vk;
Xtest_reduced = Xcentered_test * Vk;
end




