function [] = catenaria(x0,y0,x1,y1,ele,c0,a0,h0,showSteps,lim)

  f1 = @(c,a,h) (cosh(c*(x0-a))/c) + h - y0;
  f2 = @(c,a,h) (cosh(c*(x1-a))/c) + h - y1;
  f3 = @(c,a,h) (sinh(c*(x1-a)) - sinh(c*(x0-a)))/c - ele;

  f1c = @(c,a,h) (c*sinh(c*(x0-a))*(x0-a) - cosh(c*(x0-a)))/(c^2);
  f2c = @(c,a,h) (c*sinh(c*(x1-a))*(x1-a) - cosh(c*(x1-a)))/(c^2);
  f3c = @(c,a,h) (c*x1*cosh(c*(x1 - a)) - c*a*cosh(c*(x1-a)) - sinh(c*(x1-a)) + c*a*cosh(c*(x0-a)) - c*x0*cosh(c*(x0-a)) + sinh(c*(x0-a)))/(c^2);

  f1a = @(c,a,h) - sinh(c*(x0-a));
  f2a = @(c,a,h) - sinh(c*(x1-a));
  f3a = @(c,a,h) cosh(c*(x0-a)) - cosh(c*(x1-a));

  f1h = @(c,a,h) 1;
  f2h = @(c,a,h) 1;
  f3h = @(c,a,h) 0;

  ci = [];
  ai = [];
  hi = [];

  ci(1) = c0;
  ai(1) = a0;
  hi(1) = h0;

  for i = 1:lim+1
    # D[F](x^k)
    DFx = [
      f1c(ci(i),ai(i),hi(i)), f1a(ci(i),ai(i),hi(i)), f1h(ci(i),ai(i),hi(i));
      f2c(ci(i),ai(i),hi(i)), f2a(ci(i),ai(i),hi(i)), f2h(ci(i),ai(i),hi(i));
      f3c(ci(i),ai(i),hi(i)), f3a(ci(i),ai(i),hi(i)), f3h(ci(i),ai(i),hi(i));
    ];
    # x^k
    xk = [ci(i); ai(i); hi(i)];
    # F(x^k)
    Fxk = [f1(ci(i),ai(i),hi(i)); f2(ci(i),ai(i),hi(i)); f3(ci(i),ai(i),hi(i))];

    A = DFx;
    b = (DFx * xk) - Fxk;

    [x] = gaussPivotP(A, b);

    ci(i+1) = x(1);
    ai(i+1) = x(2);
    hi(i+1) = x(3);

    if showSteps
        fprintf('c_%d, a_%d, h_%d at %d iterations is :\n', i-1, i-1, i-1, i-1);
        fprintf(' %.12f  %.12f %.12f \n', ci(i), ai(i), hi(i));
    end
  end
end