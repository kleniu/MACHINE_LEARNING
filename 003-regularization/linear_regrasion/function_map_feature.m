function [ X, Xcoldesc ] = function_map_feature(x)
% function adds extra polynomial features to feature x
% returns :
%  - X matrix with values x, x^2, x^3, x^4, x^5, x^6
%  - Xcoldesc - row vector with column descroption [ "x^1", "x^2", .. , "x^6" ]

degree = 6;
X = [];
Xcoldesc = {};

for i = 1:degree
	X(:,end+1) = x.^i;
	Xcoldesc{end+1} = sprintf("x^%d",i); 	
endfor

end
