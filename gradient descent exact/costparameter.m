
N = [10,100,1000];
itmax = 100;
tol = 10^(-6);
norm_gradJ = zeros(1,length(N));
gamma = 10^(-3);
color = ['r','g','b'];

for i = 1:length(N)
    h = 1/N(i);
    A = 1/(h^2)*gallery('tridiag',N(i)+1,-1,2,-1);
    A(1,:) = zeros(1,N(i)+1);
    A(1,1) = 1;
    A(N(i)+1,:) = zeros(1,N(i)+1);
    A(N(i)+1,N(i)+1) = 1;
    theta = zeros(N(i)+1,1);
    x = linspace(0,1,N(i)+1)';
    f0 = x;
    for j = 1:length(x)
        if x(j)>=0.25 && x(j)<=0.75
            theta(j,1) = 1;
        end
    end

    J = @(f) (h/2).*f'*(inv(A)' * inv(A) + gamma.* speye(size(A)))*f - h.* f'*inv(A)*theta + (norm(theta))^2;
    gradJ = @(f) h.*(inv(A)'*inv(A)+gamma.*speye(size(A)))*f - (h.*(A\theta));

    [f,it] = grad_verfahren_exact(theta,J, gradJ, f0, itmax, tol, A,'cost')
    Jf = J(f);
    y = A\f;
    norm_gradJ(1,i)= norm(gradJ(f));

    hold on; grid on;
    xlabel('x');
    ylabel('y');
    plot(x,y,color(i));
    legend('10','100','1000')
end
% figure;
%     hold on; grid on;
%     xlabel('N')
%     ylabel('gradJ')
%     plot(N,norm_gradJ)
%%
% With the inclusion of cost parameter, gamma, the function becomes
% smoother and non-zero for values of x between 0.25 and 0.75