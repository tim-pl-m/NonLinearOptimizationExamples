function [f,y,Jf] = Sheet06_1a
    N = [10,100,1000,10000];
    itmax = 100;
    tol = 10^-6;
    norm_gradJ = zeros(1,length(N));
    for i = 1:length(N)
        h = 1/N(i);
        A = 1/(h^2)*gallery('tridiag',N(i)+1,-1,2,-1);
        A(1,:) = zeros(1,N(i)+1);
        A(1,1) = 1;
        A(N(i)+1,:) = zeros(1,N(i)+1);
        A(N(i)+1,N(i)+1) = 1;

        x = linspace(0,1,N(i)+1)';
        f0 = x;

        theta = (x.^2).*((ones(N(i)+1,1)-x).^2);
        J = @(f) (h/2).*(A\f-theta)'*(A\f-theta);
        gradJ = @(f) h.*(A'\(A\f-theta));

        [f,it] = grad_verfahren_exact(theta,J, gradJ, f0, itmax, tol, A,'nocost');

        Jf = J(f);
        y = A\f;
        norm_gradJ(1,i)= norm(gradJ(f));

    %   figure;
        hold on; grid on;
        xlabel('x');
        ylabel('y');
    %   title('For N = ' + N(i))
        plot(x,y)
    end
    figure;
    hold on; grid on;
    xlabel('N')
    ylabel('gradJ')
    plot(N,norm_gradJ)
end

