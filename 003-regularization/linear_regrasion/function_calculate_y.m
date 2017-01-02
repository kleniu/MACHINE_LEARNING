function y = function_calculate_y(x, theta)
% function calculates y value 

degree = 6;
y = theta(1,1);


for i = 1:degree
        y = y + theta(i+1,1) * x.^i;
endfor

end
