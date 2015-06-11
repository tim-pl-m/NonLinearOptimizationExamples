function [x,it] = CG_method(f,gradf,H,x0,itmax,tol,sigma0)
    it = 0;
    d = -gradf(x0);
    g = gradf(x0);
    x = x0;
    %sigma = sigma0;
    
    figure;
    hold on;
    
    while (norm(g)>tol) && (it<=itmax)
       sigma = powell(f,gradf,x,sigma0);
       x = x + sigma * d;
       %g_new = g + sigma * H(x) * d;
       g_new = gradf(x);
       beta = (g_new' * g_new)/(g'*g);
       g = g_new;
       d = -g + beta * d;
       if (d' * g >=0)
           d = -g;
       end
       it = it+1;
       plot(it,x(1),'.');
       plot(it,x(2),'.');
       
    end
end
