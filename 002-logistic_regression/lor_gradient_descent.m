function [theta, J_hist] = lor_gradient_descent(X, y, theta, alpha, num_iters)
%   Implement logical regresion gradient descent to calculate theta
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training points
J_hist = zeros(num_iters, 1);

for iter = 1:num_iters
    % X - is the matrix, where
    %   rows - are the training examples
    %   columns - are the features
    % printf("iter = %d; cost = %d\n", iter, lr_compute_cost(X, y, theta))

    % theta - is the column vector
    % cost - is a scalar function
    % grad - is the column vector
    [cost, grad] = costFun(theta, X, y);
    %cost
    %grad
    theta = theta - alpha * grad;

    % Save the cost J in every iteration
    J_hist(iter) = cost;

end

end

