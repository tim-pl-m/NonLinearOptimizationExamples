function [ sigma ] = armijo(f, gradf, x, delta)
betta1 = 1/2;
betta2 = 1/2;
sigma = 1;
gamma = 1;

while (f(x - sigma * gradf(x))> (f(x) - delta*sigma*((gradf(x))' *(gradf(x)))))
    sigma = 0.5 * (betta1 + betta2) * sigma;
end;

end

