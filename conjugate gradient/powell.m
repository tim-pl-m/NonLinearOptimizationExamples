function [ sigma ] = powell(f, gradf, x, sigma)
% betta1 = 1/2;
% betta2 = 1/2;
sigma0 = sigma;
%gamma = 1;

d = -gradf(x);
numerator1 = @(sigma) f(x + sigma * d) - f(x);
denominator1 = @(sigma) sigma*gradf(x)'*d;

G1 = @(sigma) (numerator1(sigma) / denominator1(sigma));

numerator2 = @(sigma) gradf(x + sigma * d)' *d;
denominator2 = @(sigma) gradf(x)'*d;

G2 =@(sigma) (numerator2(sigma) / denominator2(sigma));


beta=0.9;
delta=0.01;

inI1 = @(sigma) ( G1(sigma) >= delta ) && ( G2(sigma) >  beta );
inI2 = @(sigma) ( G1(sigma) >= delta ) && ( G2(sigma) <= beta );
inI3 = @(sigma) ( G1(sigma) <  delta ) && ( G2(sigma) <= beta );

a0 = sigma0;
b0 = a0;



if inI2(sigma0)
    sigma = sigma0;
    % return;
elseif inI1(sigma0)
        a0 = sigma0;
        b0 = sigma0;
        while (~inI3(b0))
            b0 = 2*b0;   
        end
        sigma = 1/2 *(a0+b0);
else
        a0 = sigma0;
        b0 = sigma0;
        while (~inI1(a0))
            a0 = a0/2;  
        end
        sigma = 1/2 *(a0+b0);

end

while (~inI2(sigma))
    if inI1(sigma)
        a0 = sigma;
    end

    if inI3(sigma)
        b0 = sigma;
    end

    sigma = 1/2 *(a0+b0);
end;



end