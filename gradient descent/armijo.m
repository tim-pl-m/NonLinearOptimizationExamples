function [ sigma ] = armijo(f, gradf, x, delta)
betta1 = 1/2;
betta2 = 1/2;
sigma = 1;
%gamma = 1;

%reduce stepsize if too big; with negative directions
while (f(x - sigma * gradf(x))> (f(x) - delta*sigma*dot(gradf(x)' ,gradf(x))))
    % take the middle
    sigma = 0.5 * (betta1 + betta2) * sigma;
end;

% widen stepsize if too small; with negative directions
% while (f(x - sigma * gradf(x))< (f(x) - delta*sigma*dot(gradf(x)' ,gradf(x))))
%     % take the middle
%     sigma = 2 * sigma;
% end;

sigma = sigma/2;

end

