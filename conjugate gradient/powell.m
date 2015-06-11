function [ sigma ] = powell(f, gradf, x, sigma0)
% betta1 = 1/2;
% betta2 = 1/2;
%gamma = 1;

%sigma = sigma0;
d = -gradf(x);
%numerator1 = f(x + sigma0 * d) - f(x);
%denominator1 = sigma0*gradf(x)'*d;

G1 =@(sigma) ((f(x + sigma * d) - f(x)) / (sigma*gradf(x)'*d));

%numerator2 = gradf(x + sigma0 * d)' *d;
%denominator2 = gradf(x)'*d;

G2 =@(sigma) ((gradf(x + sigma * d)' *d )/ (gradf(x)'*d));


beta=0.9;
delta=0.01;

inI1 = @(sigma) ( G1(sigma) >= delta ) && ( G2(sigma) >  beta );
inI2 = @(sigma) ( G1(sigma) >= delta ) && ( G2(sigma) <= beta );
inI3 = @(sigma) ( G1(sigma) <  delta ) && ( G2(sigma) <= beta );

a0 = sigma0;
b0 = a0;



if inI2(sigma0)
    sigma = sigma0;
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



% if G2(sigma) > beta
%     a=sigma;
%     b=sigma;
%     while G1(b) >= delta
%         b=2*b;
%     end

% end

% if G1(sigma) < delta
%     b = sigma;
%     a = sigma;
%     while G2(a) <= beta && G1(a) < delta
%         a = a/2;
%     end

% while G1(sigma) < delta ||  G2(sigma) > beta
%     sigma=(a+b)/2;
    
%     if G2(sigma) > beta
%         a=sigma;
%     end
%     if G1(sigma) < delta
%         b=sigma;
%     end    
%     %wenn sigma in I1: a=sigma und wenn sigma in I3: b=sigma
    

        
% end

% end

end