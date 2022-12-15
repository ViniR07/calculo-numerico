function [x] = polinomiosSimultOrtgSom(x)
  %% Usando Alpha e Beta
  % p0xp1 = 0;
  % p1xp1 = 0;
  % p0p0 = 0;
  % p1p1 = 0;

  % for i = 1:4
  %   p0xp1 = p0xp1 + p0(x(i)) .* (x(i) .* p1(x(i)));
  %   p1xp1 = p1xp1 + p1(x(i)) .* (x(i) .* p1(x(i)));
  %   p0p0 = p0p0 + p0(x(i)) .* p0(x(i));
  %   p1p1 = p1p1 + p1(x(i)) .* p1(x(i));
  % end

  %% Usando <p2,p0>, <p2,p1> = 0
  xpower2 = 0;
  xpower3 = 0;
  xsolo = 0;

  a11=0;
  a12=0;
  a01=0;
  a02=0;

  for i = 1:4
    xpower2 = xpower2 + power(x(i), 2);
    xpower3 = xpower3 + power(x(i), 3);
    % xsolo = xsolo + x(i);

    a11 = a11 + 1*x(i);
    a12 = a12 + 1*power(x(i), 2);
    a01 = a01 + 1;
    a02 = a02 + 1*x(i);
  end


  A = [a11, a01; a12, a02];
  b = [-xpower2, -xpower3];

  [x, A, b] = gaussPivotP(A, b);
end