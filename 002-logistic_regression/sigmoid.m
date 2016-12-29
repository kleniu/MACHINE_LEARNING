function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% Compute the sigmoid of each value of z (z can be a matrix, vector or scalar.

% let's perform element-by-element operations on matrix values
g = 1 ./ (1 + e.^-z);

end
