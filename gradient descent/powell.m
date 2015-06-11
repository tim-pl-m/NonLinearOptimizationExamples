function [ sigma ] = powell(f, gradf, x, delta)
betta1 = 1/2;
betta2 = 1/2;
sigma = 1;
%gamma = 1;

%G1 fullfilled
while (f(x - sigma * gradf(x))> (f(x) - sigma*dot(gradf(x)' ,gradf(x))*delta))
    	
%     beInIntervall = 0.5
    sigma = beInIntervall * (betta1 + betta2) * sigma;
    
end;

%G2 fullfilled
while (f(x - sigma * gradf(x))< (f(x) - sigma*dot(gradf(x)' ,gradf(x))*delta))

%     sigma = 2 * sigma;
% end;

sigma = sigma/2;

end

 