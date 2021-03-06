

% N = {array of 10 - 10000)
N = 10;

h = 1/N;

% A = 1/(h^2)*{Matrix with 2 in diagonal; -1 in upper and lower off diagonal; 
% rest 0}
A = 1/(h^2)*gallery('tridiag',N+1,-1,2,-1);
A(1,:) = zeros(1,N+1);
A(1,1) = 1;
A(N+1,:) = zeros(1,N+1);
A(N+1,N+1) = 1;

full(A)
% break;

theta = @(x) (x.^2).*((ones(N+1,1)-x).^2);
J = @(f,theta) (h/2).*(inv(A)*f-theta)'*(inv(A)*f-theta);
gradJ = @(f,theta) h.*(inv(A)'*((inv(A))*f-theta));

x = linspace(0,1,N+1)';


% d = -1 .* gradJ(x,theta(x));
% d=@(f) -gradJ(f,theta(x));



fun = @(f) J(f,theta(x));
gradfun = @(f) gradJ(f,theta(x));

itmax = 10000;
tol = 10^-6;
f0 = x;
[f,it] = grad_verfahren_exact(fun, gradfun, f0, itmax, tol, A)

% compute somehow exact stepsize

% use grad_verfahren