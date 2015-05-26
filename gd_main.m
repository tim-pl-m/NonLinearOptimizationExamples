exercise_5.m

x_0 = [0.5 0.5]';
% columvector = linevector transposed :)
itmax = 1000;

b1 = b2 = 1 ;
sigma_0 = 1;
y = 1;
t1 = 0.1;
t2 = 0.5;
t3 = 0.9;

tol = 1e-6;

% define the objective function:
% f = @(x1,x2) 1/2 * x1.^2 + 9/2 * x2.^2;

f = @(x) 1/2*(x(1)^2)+9/2*(x(2)^2);
gradf = @(x) [x(1);9*x(2)];

[x,it] = grad_verfahren(f,gradf,x0,itmax,tol)