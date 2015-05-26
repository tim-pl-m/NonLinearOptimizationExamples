stepsize.m

function[ sigma ] = armijo(f, gradf, x, delta) 
%minFunc
b1 = 1/2;
b2 = 1/2;
sigma = 1;
gamma = 1;

while (f(x-sigma * gradf(x)) > f(x) delta*sigma*(gradf(x)' * gradf(x))
% "-", because direction is negative
	sigma = 1/2 * (b1+b2) * sigma;
end;

end
