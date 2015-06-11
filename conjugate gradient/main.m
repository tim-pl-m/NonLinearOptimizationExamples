%% Setting parameters

itmax = 100;
x0 = [0.5;0.5];
tol = 10^(-6);
sigma0 = 0.001;

%% Rosenbrock function

f = @(x) [(1-x(1))^2 + 100*(x(2)-x(1)^2)^2];
gradf = @(x)[(2*x(1) - 400*x(1)*(- x(1)^2 + x(2)) - 2) ; ( - 200*x(1)^2 + 200*x(2))];
fhessian = @(x) [ 1200*x(1)^2 - 400*x(2) + 2, -400*x(1); -400*x(1) , 200];
x_g = grad_verfahren(f,gradf,x0,itmax,tol,sigma0);
x_cg = CG_method(f,gradf,fhessian,x0,itmax,tol,sigma0);

%% Beale function

f = @(x) [(1.5 - x(1)*(1-x(2)))^2 + (2.25-x(1)*(1-x(2)^2))^2 + (2.625 - x(1) * (1-x(2)^3))^2];
gradf = @(x) [2*x(1)*x(2)^6 + 2*x(1)*x(2)^4 - 4*x(1)*x(2)^3 - 4*x(1)*x(2)^2 + 6*x(1) + 5.25*x(2)^3 + 4.5*x(2)^2 - 2*x(2) - 10.75;...
              6*x(1)^2*x(2)^5 + 4*x(1)^2*x(2)^3-6*x(1)^2*x(2)^2 + 15.75*x(1)*x(2)^2 + 9*x(1)*x(2)-2*x(1)+2*x(2)+1];
fhessian = @(x) [2*x(2)^6+2*x(2)^4-4*x(2)^3-4*x(2)^2+6,...
                      12*x(1)*x(2)^5+8*x(1)*x(2)^5 + 8*x(1)*x(2)^3 - 12*x(1)*x(2)^2 - 8*x(1)*x(2)+15.75*x(2)^2+9*x(2)-2;...
                      12*x(1)*x(2)^5+8*x(1)*x(2)^5 + 8*x(1)*x(2)^3 - 12*x(1)*x(2)^2 - 8*x(1)*x(2)+15.75*x(2)^2+9*x(2)-2,...
                      30*x(1)^2*x(2) + 12*x(1)^2*x(2)^2-12*x(1)^2*x(2)+31.5*x(2)+9];
x_g = grad_verfahren(f,gradf,x0,itmax,tol,sigma0);
x_cg = CG_method(f,gradf,fhessian,x0,itmax,tol,sigma0);
                  
%% Himmelblau's Function

f = @(x) [(x(1)^2 + x(2) - 11)^2 + (x(1) + x(2)^2 - 7)^2];
gradf = @(x) [2*(2*x(x(1)^2 + x(2) - 11) + x(1) + x(2)^2 -7); 2*(x(1)^2 + 2*x(2)*(x(1) + x(2)^2 -7) + x(2) - 11)];
fhessian = @(x) [12*x(1)^2 + 4*x(2) - 42, 4*x(1)+ 4*x(2); 4*x(1)+ 4*x(2), 4*x(1) + 12*x(2)^2 - 26];
x_g = grad_verfahren(f,gradf,x0,itmax,tol,sigma0);
x_cg = CG_method(f,gradf,fhessian,x0,itmax,tol,sigma0);