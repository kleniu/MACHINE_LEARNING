function [ theta, cost ]  = function_normal_equation(X, y, lambda)
% fucntion calculates optimal theta using normal equation

% adding 1s for x0
X = [ ones(rows(X),1) X];

% building magic matrix - eye(size) creates identity matrix
L = eye(columns(X));
L(1,1) = 0;

% calculating theta using normal_equation

warning("off")
theta = inv( X'*X + lambda*L ) * X' * y;
warning("on")

[ cost, grad ] = lr_compute_cost(theta, X, y, lambda);

end
