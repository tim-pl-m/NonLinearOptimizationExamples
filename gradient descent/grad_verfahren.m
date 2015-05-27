function [x,it ] = grad_verfahren(f, gradf,x0,itmax,tol)
%grad descent implemintation with Armijo line search

delta = 0.1 * linspace(1,9, 7)';
it_delta = zeros(7,1);

for j = 1: 7
    it = 0;
    x = x0;
        while ((norm(gradf(x))) > tol) && (it <= itmax)
%             gradf
            sigma = armijo (f, gradf, x, delta(j));
            x = x -sigma*gradf(x);
            it = it + 1;
%             gradf = gradf(x)
        end
    it_delta(j) = it
end
figure;
hold on; grid on;
xlabel('Delta')
ylabel('Number of iterations')
title('Number of iterations Vs Delta')
plot(delta, it_delta);
end

