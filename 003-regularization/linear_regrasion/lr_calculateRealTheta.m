function [realTheta] = lr_calculateRealTheta(theta, X_norm, mu, sigma)
%   calculateRealTheta - calculates Theta as it would be calculated on NOT normalized X data
%   returns single column vector with Theta 

realTheta = zeros( size(theta) );

realTheta(1) = theta(1);
for i = 2:rows(theta)
   realTheta(1) = realTheta(1) - mu(i-1)*theta(i)/sigma(i-1);
   realTheta(i) = theta(i)/sigma(i-1);
endfor

end

