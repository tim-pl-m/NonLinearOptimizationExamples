function [f,it ] = grad_verfahren_exact(J, gradJ,f0,itmax,tol,A)

%s = stepsize(A);
% s = tol;
it = 0;
f = f0;
    % check if gradient is precise enough
    while ((norm(gradJ(f),2)) > tol) && (it <= itmax)
%         s = stepsize(A,f);
        s = armijo(J, gradJ, f, 0.5);
        % move into descent direction (negative)
        f = f +s * gradJ(f);
        it = it + 1;
    end
    
% figure;
% hold on; grid on;
% xlabel('Delta')
% ylabel('Number of iterations')
% title('Number of iterations Vs Delta ')
% plot(delta, it_delta);
end

