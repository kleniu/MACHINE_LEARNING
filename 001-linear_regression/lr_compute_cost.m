function [J,grad] = lr_compute_cost(theta, X, y)
%   Compute cost J and gradient for linear regression 
%   computes the cost - theta is the parameter for linear regression to fit into data points in X and y

m = length(y); % number of training points

J = 0;
grad = zeros(size(theta));

% X - is the matrix, where
%   rows - are the training examples
%   columns - are the features

% theta - is the column vector

%fprintf('DEBUG: before H = X * theta\n');
%X
%theta
H = X * theta;
% H is the column vector with the hypothesis

DIF = H - y;
J = ( DIF' * DIF ); 
J = J / ( 2*m );

grad = ( 1/m ) * X' * ( X*theta - y );

end
