%% Initialization
clear ; close all; clc

%% Load Data
%  The first two columns contains the exam scores and the third column
%  contains the label.

% load all CSV into matrix data
data = load('example_data1.txt');
% copy first two columns fo matrix X
X = data(:, [1, 2]); 
% copy third column to matrix y
y = data(:, 3);

%% Step 1: Plotting ====================

fprintf(['Plotting data' ...
         'from example file.\n']);

warning ("off")
plotData(X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;
warning ("on")

%% Step 2: Gradient descent for logistic regresion =================
[m, n] = size(X);

% normalize X before adding column width x0=1
[Xnorm, mu, sigma] = featureNormalize(X);

% add column with 1s as x0
X = [ones(m,1) X];
Xnorm = [ones(m,1) Xnorm];

theta = zeros(n+1, 1);

alpha = 20; % learning spead
num_iters = 1000; % number of iterations for gradient descent
[theta, J_hist] = lor_gradient_descent(Xnorm, y, theta, alpha, num_iters);
realTheta = calculateRealTheta(theta, Xnorm, mu, sigma);
theta = realTheta;

% compute cost after gradient descent
[cost, grad] = costFun(theta, X, y);
fprintf('Cost after gradient descent: %f\n', cost);
fprintf('Optimal theta : \n');
fprintf(' %f \n', theta);
warning ("off")
plotDecisionBoundary(theta, X, y);
warning ("on")

%ploting data
warning ("off")
figure;
plot(1:numel(J_hist), J_hist, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
warning ("on")
