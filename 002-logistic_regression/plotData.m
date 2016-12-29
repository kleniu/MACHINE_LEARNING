function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% find returns the matrix of indexes (pos) where value == 1 in matrix y
pos = find(y==1);

% this find returns the matrix of indexes (neg) where value == 0 in matrix y
neg = find(y==0);

% plot diagram
plot(X(pos,1), X(pos,2), 'k+', 'LineWidth', 1, 'MarkerSize', 7);
plot(X(neg,1), X(neg,2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

hold off;

end
