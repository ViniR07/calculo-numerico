function [y] = rangekutta(f, T, n, ordem, y0)

  h = T/n;
  h
  t = [];
  j = 1;
  t(j) = 0;
  while t(j) < T
    j = j + 1;
    t(j) = 0 + (j-1)*h;
  endwhile

  y = [];
  y(1) = y0;

  for k = 1:n
    if ((ordem == 2))
      e1 = f(t(k), y(k));
      e2 = f(t(k) + h, y(k) + h*e1);
      y(k+1) = y(k) + (h/2)*(e1 + e2);

    elseif ((ordem == 3))
      e1 = f(t(k), y(k));
      e2 = f(t(k) + h/2, y(k) + (h/2)*e1);
      e3 = f(t(k) + h, y(k) + 3/4 * h * e2);
      y(k+1) = y(k) + (h/9)*(2*e1 + 3*e2 + 4*e3);

    elseif ((ordem == 4))
      e1 = f(t(k), y(k));
      e2 = f(t(k) + h/2, y(k) + (h/2)*e1);
      e3 = f(t(k) + h/2, y(k) + (h/2)*e2);
      e4 = f(t(k) + h, y(k) + h*e3);
      y(k+1) = y(k) + (h/6)*(e1 + 2*e2 + 2*e3 + e4);
    
    endif

    printf("y(%.2f) = %.16f, n = %d\n", t(k), y(k), k);
  endfor

end