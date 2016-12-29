function [J, grad] = costFun(theta, X, y)
%   Compute cost and gradient for logistic regression
%   J = COSTFUN(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost

m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

g = sigmoid(X*theta);
J = (-1/m)*(y'* log(g) + (1 - y)'* log(1-g));
grad = (1/m)*X'*(g - y);

end
