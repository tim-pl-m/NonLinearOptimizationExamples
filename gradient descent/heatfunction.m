

% N = {array of 10 - 10000)

h = 1/N;

% A = 1/(h^2)*{Matrix with 2 in diagonal; -1 in upper and lower off diagonal; 
% rest 0}

theta = @(x) x^2*(1-x)^2

J = @(f,theta) h/2(inv(A)*f-theta)'*(inv(A)*f-theta);

gradJ = @(f,theta) h* (inv(A)'(inv(A)*f-theta);

% compute somehow exact stepsize

% use grad_verfahren