function [J,grad] = lr_compute_cost(theta, X, y, lambda)
%   Compute cost J and gradient for linear regression 
%   computes the cost - theta is the parameter for linear regression to fit into data points in X and y

m = length(y); % number of training points
%m

J = 0;
grad = zeros(size(theta));

% X - is the matrix, where
%   rows - are the training examples
%   columns - are the features

% theta - is the column vector
%theta

h = X*theta;

theta_reg = theta;
theta_reg(1,1) = 0;

J = (1/(2*m))* ( (h-y)'*(h-y) + (lambda)*(theta_reg'*theta_reg) ) ;
%J  

grad = (1/m)*(X'*(h-y)+lambda*theta_reg); 
%grad

end
