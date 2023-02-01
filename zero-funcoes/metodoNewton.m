function [x] = metodoNewton(f, fd, x0, lim, showSteps)
    # x0 = chute inicial
    # f = função
    # fd = derivada da função f
    # x = vetor de soluções
    # lim = limite de iterações
    x = [];
    xi = x0;
    for i = 1:lim
        x(i) = xi - f(xi) / fd(xi);
        if showSteps
            fprintf('x_%d at %d iterations is :\n', i, i);
            fprintf(' %.24f \n', x(i));
        end
        xi = x(i);
    end
    if !showSteps
        fprintf('x_%d is :\n', lim);
        fprintf(' %.20f \n', x(lim));
    end
end