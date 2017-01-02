function [x,y] = function_load_data()
% function loads artificial test set. 

data = load("ex1data1.txt");

x = data(:,1);		
y = data(:,2);

end
