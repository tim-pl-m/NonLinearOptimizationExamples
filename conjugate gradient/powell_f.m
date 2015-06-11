function stepsize = powell(f,gradf,xk,sigma0)
    % function [ sigma ] = powell(f, gradf, x, sigma)
betha=0.9;
delta=0.01;

d = -gradf(xk);

%define function contraints
G1 = @(sigma) (f(xk+sigma*d) - f(xk)) / (sigma*gradf(xk)'*d);
G2 = @(sigma) (gradf(xk+sigma*d)'*d) / (gradf(xk)'*d);
%define intervals conditions
inI1 = @(sigma) ( G1(sigma) >= delta ) && ( G2(sigma) >  betha );
inI2 = @(sigma) ( G1(sigma) >= delta ) && ( G2(sigma) <= betha );
inI3 = @(sigma) ( G1(sigma) <  delta ) && ( G2(sigma) <= betha );

a0 = sigma0;
b0 = a0;

%find initial constants a0, b0
if inI2(sigma0)
    stepsize = sigma0;
    return;
    
elseif inI1(sigma0)
    a0 = sigma0;
    b0 = a0;
    while (~inI3(b0))
        b0 = 2*b0;
    end
    
elseif inI3(sigma0)
    b0 = sigma0;
    a0 = b0;
    while (~inI1(a0))
        a0 = a0/2;
    end      
end

%now I2 is in (a0,b0)

sigma0 = .5*(a0 + b0);

while ~inI2(sigma0)
    if inI1(sigma0)
        a0=sigma0;
    elseif inI3(sigma0)
        
        b0=sigma0;            
    end
    sigma0 = .5*(a0 + b0)
end

stepsize = sigma0;

end


