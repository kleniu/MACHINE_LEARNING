function [X_norm, mu, sigma] = lr_featureNormalize(X)
%   featureNormalize -  Normalizes the features in X
%   returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. 

X_norm = X;
% mu is the row vector with mean values all features on training set
mu = zeros(1, size(X, 2));
% like before but with standard dev
sigma = zeros(1, size(X, 2));

% Description : For each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the
%               standard deviation of each feature and divide
%               each feature by its standard deviation, storing
%               the standard deviation in sigma.
%
%               Note that X is a matrix where each column is a
%               feature and each row is an example. 
%

for column_feature = 1:columns(X)
    mu(1,column_feature) = mean(X(:,column_feature));
    sigma(1,column_feature) = std(X(:,column_feature));
    for row_testitem = 1:rows(X)
        X_norm(row_testitem,column_feature) = ( X(row_testitem,column_feature) - mu(1,column_feature) ) / sigma(1,column_feature);
    endfor
endfor

end

