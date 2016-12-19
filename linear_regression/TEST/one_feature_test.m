% Setting env vars
addpath ("../LIB")

%% Initialization - Clear all names, close figures and clear screen
clear ; close all; clc

%% =====================================================================================
fprintf("STEP1 - Generating test data for y=25+3x^0.5 ...\n");
max_range = 100;        
step = 10;
X = zeros(floor(max_range/step), 2);
y = zeros(floor(max_range/step), 1);
i = 0;
j = 1;
while (i<max_range)
    X(j,1) = 1;
    X(j,2) = i;
    y(j,1) = 25*X(j,1) + 3*X(j,2)^0.5;
    i = i + step; 
    j++;
endwhile

%% =====================================================================================
fprintf("STEP2 - Printing test data ...\n");
fprintf(" X = [%.0f %.0f], y = %.0f \n", [X y]'); % print X and it's values y    

%% =====================================================================================
fprintf('STEP3- Ploting test data ...\n');

warning ("off")
figure; % open new figure


% plot test data
plot (X(:,2), y, 'rx', 'MarkerSize', 10);       % plot red crosses in size od 10 points
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

alpha = 0.0007; % learning spead
num_iters = 14000; % number of iterations for gradient descent

% Init theta - number of rows is equal of number of input data in the single test 
theta = zeros(2, 1);
[theta, J_hist] = lr_gradient_descent(X, y, theta, alpha, num_iters);

fprintf(" theta = [%d %d]\n J = %d\n", [theta], lr_compute_cost(X, y, theta));

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
fprintf(" theta_ne = [%d %d]\n J = %d\n", [theta_ne], lr_compute_cost(X, y, theta_ne));

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

