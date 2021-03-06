function [x,it ] = grad_verfahren(f, gradf,x0,itmax,tol,sigma0)
   
    it = 0;
    x = x0;
    %sigma = sigma0;
    figure;
    hold on;
    while ((norm(gradf(x))) > tol) && (it <= itmax)
        sigma = powell(f,gradf,x,sigma0);
        x = x - sigma * gradf(x);
        it = it+1;
        plot(it,x(1),'.');
        plot(it,x(2),'.');
        
    end 
end



        

