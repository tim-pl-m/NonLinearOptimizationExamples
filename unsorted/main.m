<<<<<<< HEAD
%% Question 1

f = @(x) 0.5*(x(1)^2 +9*x(2)^2);
gradf = @(x) [x(1);9*x(2)]; % gradient of function f

x0 = [0.5;0.5]; % initial vector
tol = 10^(-6);  % tolerance
itmax = 10000;  % maximum iteration

[x,it] = grad_verfahren(f, gradf, x0, itmax, tol)
%It converges faster for small values of delta and slowly for larger values
%of delta. For delta = 0.1, iter = 11, for delta = 0.5, iter = 35 and for
%delta = 0.9, iter = 114

%% Rosenbrock function
f = @(x) 100*(x(2) -x(1)^2)^2 + (1-x(1))^2;

% gradient of Rosenbrock function
gradf = @(x) [400*x(1)^2-400*x(1)*x(2)+2*x(1)-2;200*(x(2)-x(1)^2)];

x0 = [-1.9;2]; % initial vector
tol = 10^(-6); % tolerance value
itmax = 10000; % maximum number of iterations

[x,it] = grad_verfahren(f, gradf, x0, itmax, tol)

% gradient method for Rosenbrock fails to converge even after 10000
% iterations when initial vector is (-1.9,2)

%% Question 3
% Newton's method for Rosenbrock function converges to minimal value after
% 206 iterations when initial vector is (-1.9,2)
=======


%% Rosenbrock function:
fun_rosenbrock = @(x) [100*(x(2) - x(1)^2)^2 + (1-x(1))^2];
gradfun_rosenbrock = @(x) [400*x(1)^2 - 400*x(1)*x(2) + 2*x(1)-2; 200*(x(2) - x(1)^2)];
hessfun_rosenbrock = @(x) [1200*x(1)^2 - 400 * x(2) + 2, -400*x(1); -400*x(1), 200];
x_rosenbrock = zeros(10);
y_rosenbrock = zeros(10);
init_values = linspace(0.1,1,10);
for i = 1:10
    for j = 1:10
       x = newtonverf([init_values(i);init_values(j)],fun_rosenbrock,gradfun_rosenbrock,hessfun_rosenbrock);
       x_rosenbrock(i,j) = x(1,1);
       y_rosenbrock(i,j) = x(2,1);
    end
end
% For initial values (0.5,0.5), (1,0.1),(1,0.2), ....,(1,1), the method
% converges to stationary point (1,1)

%% Beale function:
fun_beale = @(x) [1.5-x(1)*(1-x(2))^2+(2.25-x(1)*(1-x(2)^2))^2+(2.625-x(1)*(1-x(2)^3))^2];
gradfun_beale = @(x) [2*x(1)*x(2)^6 + 2*x(1)*x(2)^4 - 4*x(1)*x(2)^3 - 4*x(1)*x(2)^2 + 6*x(1) + 5.25*x(2)^3 + 4.5*x(2)^2 - 2*x(2) - 10.75;...
                      6*x(1)^2*x(2)^5 + 4*x(1)^2*x(2)^3-6*x(1)^2*x(2)^2 + 15.75*x(1)*x(2)^2 + 9*x(1)*x(2)-2*x(1)+2*x(2)+1];
hessfun_beale = @(x) [2*x(2)^6+2*x(2)^4-4*x(2)^3-4*x(2)^2+6,...
                      12*x(1)*x(2)^5+8*x(1)*x(2)^5 + 8*x(1)*x(2)^3 - 12*x(1)*x(2)^2 - 8*x(1)*x(2)+15.75*x(2)^2+9*x(2)-2;...
                      12*x(1)*x(2)^5+8*x(1)*x(2)^5 + 8*x(1)*x(2)^3 - 12*x(1)*x(2)^2 - 8*x(1)*x(2)+15.75*x(2)^2+9*x(2)-2,...
                      30*x(1)^2*x(2) + 12*x(1)^2*x(2)^2-12*x(1)^2*x(2)+31.5*x(2)+9];
x_beale = zeros(10);
y_beale = zeros(10);
for i = 1:10
    for j = 1:10
        x = newtonverf([init_values(i);init_values(j)],fun_beale,gradfun_beale,hessfun_beale);
        x_beale(i,j) = x(1,1);
        y_beale(i,j) = x(2,1);
    end
end

%For initial values (0.1:0.1:1,0.1:0.1:0.3),(0.2:0.1:1,0.4),
%(0.4:0.1:1,0.5), (0.7:0.1:1,0.6), (1,0.8), the method converges to
%stationary point (1.8458,0.1344)
%Other stationary point is (0.0001,-26.2055)
%% Spelluci function: 
fun_spelluci = @(x) [2*x(1)^3+x(2)^2+x(1)^2*x(2)^2+4*x(1)*x(2)+3]; 
gradfun_spelluci = @(x)[6*x(1)^2 + 2*x(1)* x(2)^2 + 4 * x(2); 2 * x(2) + 2 * x(1)^2 * x(2) + 4 * x(1)];
hessfun_spelluci = @(x) [12*x(1) + 2*x(2),4*x(1)*x(2)+4;4*x(1)*x(2)+4, 2*x(1)^2 + 2];
x_spelluci = zeros(10);
y_spelluci = zeros(10);
for i = 1:10
    for j = 1:10
        x = newtonverf([init_values(i);init_values(j)],fun_spelluci,gradfun_spelluci,hessfun_spelluci);
        x_spelluci(i,j) = x(1,1);
        y_spelluci(i,j) = x(2,1);
    end
end
>>>>>>> origin/master
