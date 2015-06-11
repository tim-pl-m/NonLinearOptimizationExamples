function [f,it ] = grad_verfahren_exact(theta,J, gradJ,f0,itmax,tol,A,par)
   
    it = 0;
    f = f0;
    gamma = 10^(-3);
    if strcmp(par,'nocost')
            % check if gradient is precise enough
        while ((norm(gradJ(f),2)) > tol) && (it <= itmax)
            f = A * theta;
            it = it + 1;
        end
    else strcmp(par,'cost')
        while ((norm(gradJ(f),2)) > tol) && (it <= itmax)
            f =  (inv(A)'*inv(A) + gamma.*speye(size(A)))\(A\theta);
            it = it + 1;
        end

    end
end



        

