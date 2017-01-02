clear ; close all; clc

% testing regularisation for linear regresion
lambda = 10      % regularization parameter used for normal equation and gradient descent calculations
alpha  = 0.3     % learning rate used for gradient descent calculations
iterations = 4000 % number of iterations in gradient descent
plot_min = 1
plot_max = 30


% STEP 1 - let's gen or load test data
[x,y] = function_load_data("ex1data1.txt");


% STEP 2 - let's plot test data
warning ('off');
figure; 
plot( x, y, 'rx', 'MarkerSize', 10);
ylabel('y');
xlabel('x'); 
warning ('on');

% STEP 3 - map polynomial features
[X, Xcoldesc] = function_map_feature(x);

% STEP 4 - calculate optimal theta using normal equation
theta_normal = function_normal_equation(X, y, lambda)

Xtmp = zeros(plot_max,1);
Ytmp = zeros(plot_max,1);
for i = plot_min:plot_max
	Xtmp(i,1) = i;
        Ytmp(i,1) = function_calculate_y(i,theta_normal); 
endfor
warning ('off');
hold on; % keep previousely generated plot visible
plot(Xtmp, Ytmp, '-b');
hold off
warning ('on');

% STEP 5 - calculate optimal theta using gradient descent
[ theta_gd, J_hist, theta_tmp ] = function_gradient_descent(X, y, lambda, alpha, iterations);
theta_gd
theta_tmp
% theta_tmp - is theta values on normalized data

Xtmp = zeros(plot_max,1);
Ytmp = zeros(plot_max,1);
for i = plot_min:plot_max
	Xtmp(i,1) = i;
        Ytmp(i,1) = function_calculate_y(i,theta_gd); 
endfor
warning ('off');
hold on; % keep previousely generated plot visible
plot(Xtmp, Ytmp, '-r');
hold off
warning ('on');

% STEP 6 - using built-in function (fminunc) to find optimal theta
[ theta_fminunc, cost_fminunc ] = function_fminunc(X, y, iterations, lambda);

fprintf('Cost at theta found by fminunc: %f\n', cost_fminunc);
fprintf('theta_fminunc: \n');
fprintf(' %f \n', theta_fminunc);

Xtmp = zeros(plot_max,1);
Ytmp = zeros(plot_max,1);
for i = plot_min:plot_max
	Xtmp(i,1) = i;
        Ytmp(i,1) = function_calculate_y(i,theta_fminunc); 
endfor
warning ('off');
hold on; % keep previousely generated plot visible
plot(Xtmp, Ytmp, '-y');
hold off
warning ('on');

