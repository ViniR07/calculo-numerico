function [x] = metodoIterativo(f, x0, lim, showSteps)
    # x0 = chute inicial
    # f = função
    # x = vetor de soluções
    # lim = limite de iterações
    x = [];
    xi = x0;
    for i = 1:lim
        x(i) = f(xi);
        if showSteps
            fprintf('x_%d at %d iterations is :\n', i, i-1);
            fprintf(' %.24f \n', x(i));
        end
        xi = x(i);
    end
    if !showSteps
        fprintf('x_%d is :\n', lim);
        fprintf(' %.20f \n', x(lim));
    end
end