% Setting env vars
%addpath ("../LIB")

%% Initialization - Clear all names, close figures and clear screen
clear ; close all; clc

%% =====================================================================================
fprintf("STEP1 - Generating test data for y=25+3x^0.5 ...\n");
max_range = 100;        
step = 10;
X = zeros(floor(max_range/step), 1);
y = zeros(floor(max_range/step), 1);
i = 0;
j = 1;
while (i<max_range)
    X(j,1) = i;
    y(j,1) = 25 + 3*X(j,1)^0.5;
    i = i + step; 
    j++;
endwhile

%% =====================================================================================
fprintf("STEP2 - Printing test data ...\n");
fprintf(" X = [%.0f], y = %.0f \n", [X y]'); % print X and it's values y    

%% =====================================================================================
fprintf('STEP3- Ploting test data ...\n');

warning ("off")
figure; % open new figure


% plot test data
plot (X(:,1), y, 'rx', 'MarkerSize', 10);       % plot red crosses in size od 10 points
ylabel('Value');
xlabel('x');

FUN = zeros(max_range, 2);
i = 0;
while (i<max_range)
    FUN(i+1,1) = i;
    FUN(i+1,2) = 25 + 3*i^0.5;
    i++;
endwhile

% plot function on the same figure
hold on; % keep previousely generated plot visible
plot (FUN(:,1), FUN(:,2), "-b");
hold off;

warning ("on")


%% =====================================================================================
fprintf('STEP4 - Calculating theta using gradient descent ...\n');

alpha = 0.07; % learning spead
num_iters = 400; % number of iterations for gradient descent

[m, n] = size(X);

% normalize X
[Xnorm, mu, sigma] = featureNormalize(X);
% add 1's as x0
Xnorm = [ ones(m,1) Xnorm ];
X = [ ones(m,1) X];

% Init theta - number of rows is equal of number of input data in the single test 
theta = zeros(n+1, 1);
[theta, J_hist] = lr_gradient_descent(Xnorm, y, theta, alpha, num_iters);

fprintf(" tmpTheta = [%d %d]\n J = %d\n", [theta], lr_compute_cost(theta, Xnorm, y));

realTheta = calculateRealTheta(theta, Xnorm, mu, sigma);
theta = realTheta;

fprintf(" theta = [%d %d]\n J = %d\n", [theta], lr_compute_cost(theta, X, y));

GDFUN = zeros(max_range, 2);
i = 0;
while (i<max_range)
    GDFUN(i+1,1) = i;
    GDFUN(i+1,2) = theta(1) + theta(2)*i;
    i++;
endwhile

% plot function on the same figure
hold on; % keep previousely generated plot visible
plot (GDFUN(:,1), GDFUN(:,2), "-g");
hold off;



%% =====================================================================================
fprintf('STEP5 - Calculating theta using Normal Equations ...\n');
theta_ne = lr_normal_equations(X, y);
fprintf(" theta_ne = [%d %d]\n J = %d\n", [theta_ne], lr_compute_cost(theta_ne, X, y));

NEFUN = zeros(max_range, 2);
i = 0;
while (i<max_range)
    NEFUN(i+1,1) = i;
    NEFUN(i+1,2) = theta_ne(1) + theta_ne(2)*i;
    i++;
endwhile

% plot function on the same figure
hold on; % keep previousely generated plot visible
plot (NEFUN(:,1), NEFUN(:,2), "-k");
hold off;

%% =====================================================================================
fprintf('STEP6 - Ploting cost history ...\n');
warning ("off")
figure;
plot(1:numel(J_hist), J_hist, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
warning ("on")

