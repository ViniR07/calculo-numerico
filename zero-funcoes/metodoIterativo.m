function [x] = metodoIterativo(f, x0, lim)
    # x0 = chute inicial
    # f = função
    # x = vetor de soluções
    # lim = limite de iterações
    x = [];
    xi = x0;
    for i = 1:lim
        x(i) = f(xi);
        fprintf('x_%d at %d iterations is :\n', i, i-1);
        fprintf(' %.20f \n', x(i));
        xi = x(i);
    end
    % fprintf('x_5 is :\n');
    % fprintf(' %11.8f \n', x(lim));
end