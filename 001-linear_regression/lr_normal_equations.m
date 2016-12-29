function [theta] = lr_normal_equations(X, y)
%   Calculated the the best solution to linear regression 
%   using the normal equations.

theta = zeros(size(X, 2), 1);

theta = pinv( (X'*X) ) * X'*y; 

end