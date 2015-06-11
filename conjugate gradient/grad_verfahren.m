function [f,it ] = grad_verfahren(f, gradf,x0,itmax,tol,sigma0)
   
    it = 0;
    x = x0;
    sigma = sigma0;
    while ((norm(gradf(x))) > tol) && (it <= itmax)
        sigma = powell(f,gradf,x,sigma);
        x = x - sigma * gradf(x);
        it = it+1;
        plot(x);
        hold on;
    end 
end



        

