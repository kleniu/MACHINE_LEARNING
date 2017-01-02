function [ theta_real, J_hist, theta_tmp ] = function_gradient_descent(X, y, lambda, alpha, iterations)
% function calculate gradient descent with features normalisation and regularization

% m = number of test cases; n = number of features
% X - matrix before adding 1s as x0
[m,n] = size(X);

% normalize X - MUST be run BEFORE adding 1s a x0
[Xnorm, mu, sigma] = lr_featureNormalize(X);

% debuging
% Xnorm
% mu
% sigma

% num_iters add 1's as x0
Xnorm = [ ones(m,1) Xnorm ];

%debuging
% Xnorm

% init theta_tmp - number of rows is equal of number of input data + 1 (x0=1) in the single test
theta_tmp = zeros(n+1, 1);
[theta_tmp, J_hist] = lr_gradient_descent(Xnorm, y, theta_tmp, alpha, iterations, lambda);

% debuging
%printf("theta_tmp - theta calculated on normalized values\n");
%theta_tmp
%printf("cost_tmp - cost calculated on theta_tmp\n");
%cost_tmp = lr_compute_cost(theta_tmp, Xnorm, y, lambda);
%cost_tmp

% calculate "denormalized" theta
% mu and sigma must be calculated by featureNormalize(X) BEFORE adding 1s as x0
theta_real = lr_calculateRealTheta(theta_tmp, Xnorm, mu, sigma);

% debug
%X = [ ones(m,1) X ];
%printf("theta_real - real theta \n");
%theta_real
%printf("cost_real - cost calculated on theta_real\n");
%cost_real = lr_compute_cost(theta_real, X, y, lambda);
%cost_real

end
