function x = newtonverf(x0,fun,gradfun,hessfun)
    eps = 1;
    iter = 0;
    while eps >= 1e-6
        x = x0 - hessfun(x0)\gradfun(x0);
        eps = abs(x - x0);
        x0 = x;
        iter = iter + 1;
    end
end

