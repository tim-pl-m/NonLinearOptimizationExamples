function [sigma] = powell(f,gradf,d,y,sigma)
%sigmaA=sigma;
beta=0.9;
delta=0.01;

G1 =@(sig) (f(y(1,1)+sig*d(1,1),y(1,2)+sig*d(1,2))-f(y(1,1),y(1,2)))/(sig*dot([gradf{1}(y(1,1),y(1,2)) gradf{2}(y(1,1),y(1,2))],d));;

G2 =@(sig) dot([gradf{1}(y(1,1)+sig.*d(1,1),y(1,2)+sig.*d(1,2)) gradf{2}(y(1,1)+sig.*d(1,1),y(1,2)+sig.*d(1,2))],d)/(dot([gradf{1}(y(1,1),y(1,2)) gradf{2}(y(1,1),y(1,2))],d));

if G2(sigma) > beta
    a=sigma;
    b=sigma;
    while G1(b) >= delta
        b=2*b;
    end

end

if G1(sigma) < delta
    b = sigma;
    a = sigma;
    while G2(a) <= beta && G1(a) < delta
        a = a/2;
    end

while G1(sigma) < delta ||  G2(sigma) > beta
    sigma=(a+b)/2;
    
    if G2(sigma) > beta
        a=sigma;
    end
    if G1(sigma) < delta
        b=sigma;
    end    
    %wenn sigma in I1: a=sigma und wenn sigma in I3: b=sigma
    

        
end



end
