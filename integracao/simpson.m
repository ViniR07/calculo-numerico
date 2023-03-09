function [r] = simpson(a, b, f, lim, showSteps = false)
  # a = limite inferior
  # b = limite superior
  # f = função
  # t = vetor para armazenar os valores de t_i
  # lim = limite de iterações
  # r = resultado

  printf("Método de Simpson\n")
  r = 0;
  for i = 1:lim
    n2 = 2*i;
    h = (b-a)/n2;

    t = [];
    for j = 1:n2+1
      t(j) = a + (j-1)*h;
    endfor

    s = 0;
    for j = 2:n2
      if mod(j, 2) == 0
        s = 4*f(t(j)) + s;
      else
        s = 2*f(t(j)) + s;
      endif
    endfor

    soma = (f(t(1)) + s + f(t(n2+1)));
    r = (h/3)*soma;

    if showSteps
      printf("2n = %d, n = %d, r = %.24f\n", n2, i, r);
    endif
  endfor
endfunction