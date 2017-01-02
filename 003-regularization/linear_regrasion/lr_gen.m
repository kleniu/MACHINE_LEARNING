clear ; close all; clc

% testing regularisation for linear regresion
lambda = 0.5	 % regularization parameter used for gradient descent calculations
lambda_ne = 0	 % regularization parameter used for normal equation calculations
alpha  = 0.03	 % learning rate used for gradient descent calculations
iterations = 400000 % number of iterations in gradient descent
plot_min = 1
plot_max = 850

printf("\n--==## START ##==--\n")
% STEP 1 - let's gen test data
[x,y] = function_gen_data(0,10,40); % start=10, step=10, iterations=10
for i = 1:size(y)
	y(i) = y(i) + y(i)*(rand - 0.5)/10;
endfor

% STEP 2 - let's plot test data
warning ('off');
figure; 
plot( x, y, 'rx', 'MarkerSize', 3);
ylabel('y');
xlabel('x'); 
warning ('on');

% draw real values
[x_real, y_real] = function_gen_data(plot_min,1,plot_max); % start=1, step=1, iterations=150
warning ('off');
hold on; % keep previousely generated plot visible
plot(x_real, y_real, '-g');
hold off
warning ('on');

% STEP 3 - map polynomial features
[X, Xcoldesc] = function_map_feature(x);


% STEP 4 - calculate optimal theta using normal equation
printf("\n--==## normal equation ##==--\n");
[ theta_normal, cost_normal ]  = function_normal_equation(X, y, lambda_ne);
fprintf('Cost at theta found by normal equation: %9f\n', cost_normal);
fprintf('theta_normal: \n');
fprintf(' %9f \n', theta_normal);

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
printf("\n--==## gradient descent ##==--\n");
[ theta_gd, J_hist, theta_tmp ] = function_gradient_descent(X, y, lambda, alpha, iterations);
% theta_tmp - is theta values on normalized data
fprintf('Cost at theta found by gradient descent: %9f\n', J_hist(end));
fprintf('theta_gd: \n');
fprintf(' %9f \n', theta_gd);

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
printf("\n--==## normal fminunc ##==--\n");
[ theta_fminunc, cost_fminunc ] = function_fminunc(X, y, iterations, lambda);

fprintf('Cost at theta found by fminunc: %9f\n', cost_fminunc);
fprintf('theta_fminunc: \n');
fprintf(' %9f \n', theta_fminunc);

%Xtmp = zeros(plot_max,1);
%Ytmp = zeros(plot_max,1);
%for i = plot_min:plot_max
%        Xtmp(i,1) = i;
%        Ytmp(i,1) = function_calculate_y(i,theta_fminunc);
%endfor
%warning ('off');
%hold on; % keep previousely generated plot visible
%plot(Xtmp, Ytmp, '-y');
%hold off
%warning ('on');
