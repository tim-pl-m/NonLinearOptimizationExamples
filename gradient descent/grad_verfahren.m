function [x,it ] = grad_verfahren(f, gradf,x0,itmax,tol)
%grad descent implemintation with Armijo line search

% setup an array of different deltas
delta = 0.1 * linspace(1,9, 7)';
it_delta = zeros(7,1);
%gamma = 1;

for j = 1: 7

    it = 0;
    x = x0;
        % check if gradient is precise enough
        while ((norm(gradf(x),2)) > tol) && (it <= itmax)
%             gradf
            % compute stepsize
            sigma = armijo (f, gradf, x, delta(j));
            % move into descent direction (negative)
            x = x -sigma*gradf(x);
            it = it + 1;
%             gradf = gradf(x)
        end
    it_delta(j) = it;
end
% print array of iterations
it
figure;
hold on; grid on;
xlabel('Delta')
ylabel('Number of iterations')
title('Number of iterations Vs Delta ')
plot(delta, it_delta);
end

