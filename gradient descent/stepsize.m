function [s] = stepsize(A,f)

%L = norm(full(inv(A)'*inv(A)))* norm(f);
% stepsize_e = (gradJ(x)' * d)/(L * norm(d,2))
L = norm((A^-1)'*((A^-1)*f)); 
s = - 1/L; 