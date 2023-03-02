function [r] = trapezios(a, b, f, lim)
  # a = limite inferior
  # b = limite superior
  # f = função
  # x = vetor de valores de x
  # lim = número de iterações
  # r = resultado



  for i = 2:lim
    tam = i;
    % xg = linspace(a, b, tam+1);
    % x = round(floor(10 * xg)) / 10 # arredondando para 1 casa decimal
    h = (b-a)/i;
    n = tam+2;
    x = [];
    for j = 1:n-1
      x(j) = a + (j-1)*h;
    endfor
    % x

    s = 0;

    for j = 2:n-2
    % j
      s = 2*f(x(j)) + s;
    endfor

    soma = (f(x(1)) + s + f(x(n-1)));
    r = h/2*soma;
    printf("n = %d, r = %.24f\n", i, r);
  endfor
endfunction