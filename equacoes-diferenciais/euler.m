function [y] = euler(f, a, b, h, y0)

  t = [];
  j = 1;
  t(j) = a;
  while t(j) < b
    j = j + 1;
    t(j) = a + (j-1)*h;
  endwhile
  lim = j;
  y = [];
  y(1) = y0;

  for k = 1:lim
    y(k+1) = y(k) + h*f(t(k), y(k));
    printf("y(%.2f) = %.16f\n", t(k), y(k));
  endfor


end