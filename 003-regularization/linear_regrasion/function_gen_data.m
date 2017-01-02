function [x,y] = function_gen_data(start, step, iterations)
% function generates artificial test set. Size of test set is m=10. Values are calculated 
% according to equation y = 4 - 2x + x^2

m = iterations; 		% ten test cases in set
x = zeros(m,1);		% create matrix X with 10 rows an 1 column
y = zeros(m,1);

for i = 1:m
	x(i,1) = start + (i-1)*step;
	%y(i,1) = ( 4 - 2*x(i,1) + x(i,1)^2 ); % + (rand - 0.5)*x(i,1)^2 ;	
	y(i,1) = 2 + 67*sqrt(x(i,1)); 
endfor 

end
