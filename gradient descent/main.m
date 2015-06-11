%% Question 1

f = @(x) 0.5*(x(1)^2 +9*x(2)^2);
gradf = @(x) [x(1);9*x(2)]; % gradient of function f

x0 = [0.5;0.5]; % initial vector
tol = 10^(-6);  % tolerance
itmax = 1000;  % maximum iteration

[x,it] = grad_verfahren(f, gradf, x0, itmax, tol)
%It converges faster for small values of delta and slowly for larger values
%of delta. For delta = 0.1, iter = 11, for delta = 0.5, iter = 35 and for
%delta = 0.9, iter = 114

%% Question 2


%% Rosenbrock function
%malicious function definition
% f = @(x) 100*(x(2) -x(1)^2)^2 + (1-x(1))^2;
%converging function definition
f = @(x) (1-x(1))^2 + 100*(x(2) - x(1)^2)^2;

% gradient of Rosenbrock function
%malicious function definition
% gradf = @(x) [400*x(1)^2-400*x(1)*x(2)+2*x(1)-2;200*(x(2)-x(1)^2)];
%converging function definition
gradf = @(x)[(2*x(1) - 400*x(1)*(- x(1)^2 + x(2)) - 2) ; ( - 200*x(1)^2 + 200*x(2))];

x0 = [-1.9;2]; % initial vector
%tol = 10^(-6); % tolerance value
%itmax = 100; % maximum number of iterations

[x,it] = grad_verfahren(f, gradf, x0, itmax, tol)

% On Rosenbrock our Armijo-Implementation converges faster 
% for values around a delta of 0.4 . It didnt converge for values 
% around 0.1 and 0.75, but due to the fact we limited iterations 
% to 10000. So it converges at least much slower for these deltas.

%% Question 3
% Newton's method for Rosenbrock function converges to minimal value after
% 206 iterations when initial vector is (-1.9,2)
