function J = lr_compute_cost(X, y, theta)
%   Compute cost for linear regression 
%   J = lr_compute_cost(X, y, theta) 
%   computes the cost - theta is the parameter for linear regression to fit into data points in X and y

m = length(y); % number of training points

J = 0;

    % X - is the matrix, where
    %   rows - are the training examples
    %   columns - are the features

    % theta - is the column vector

    H = X * theta;
    % H is the column vector with the hypothesis

    DIF = H - y;
    J = DIF' * DIF; % ' is the Transpose of the matrix 

    J = J / ( 2*m );

end