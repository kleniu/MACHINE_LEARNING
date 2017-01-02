function [ theta_fminunc, cost_fminunc ] = function_fminunc(X, y, iterations, lambda)
%  In this function, we will use a built-in func (fminunc) to find the
%  optimal parameters theta.

[m, n] = size(X);
X = [ones(m, 1) X];
%X
initial_theta = zeros(n + 1, 1);


%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', iterations);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost
[theta_fminunc, cost_fminunc, INFO] = ...
        fminunc(@(t)(lr_compute_cost(t, X, y, lambda)), initial_theta, options);

%printf ( "INFO = %d\n", INFO );

end

