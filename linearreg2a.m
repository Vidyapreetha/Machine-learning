% Load Data
load('detroit.mat');
for i = 2:8
X = data(:, [1 9 i]); 
y = data(:, 10);
m = length(y);

Column_names = ["FTP","UEMP","MAN","LIC","GR","NMAN","GOV","HE","WE","HOM"];
Predictor_contestants = ["UEMP","MAN","LIC","GR","NMAN","GOV","HE","WE"];
% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n'); 

%Calculate Least squares error from parameters
P(i,1) = computeCost(X, y, theta); 

% Display Least squares error result
fprintf('Least squares error from theta: \n');
fprintf(' %f \n', P);
fprintf('\n');
end

%Plot a graph to find the least value of error
% Bar plot

names={" ", "UEMP","MAN","LIC","GR","NMAN","GOV","HE"};
barh(P)
set(gca,'yticklabel',names)
title('Linear regression')
xlabel('Cost')



