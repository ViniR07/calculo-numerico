function [a, p] = ajusteFuncPol(y, p0, p1, p2, p3, c, d)
  p0p0x = @(x) p0(x) .* p0(x);
  p1p1x = @(x) p1(x) .* p1(x);
  p2p2x = @(x) p2(x) .* p2(x);
  p3p3x = @(x) p3(x) .* p3(x);

  p0p0 = quadgk(p0p0x, c, d);
  p1p1 = quadgk(p1p1x, c, d);
  p2p2 = quadgk(p2p2x, c, d);
  p3p3 = quadgk(p3p3x, c, d);

  yp0x = @(x) y(x) .* p0(x);
  yp1x = @(x) y(x) .* p1(x);
  yp2x = @(x) y(x) .* p2(x);
  yp3x = @(x) y(x) .* p3(x);

  yp0 = quadgk(yp0x, c, d);
  yp1 = quadgk(yp1x, c, d);
  yp2 = quadgk(yp2x, c, d);
  yp3 = quadgk(yp3x, c, d);

  alpha0 = yp0/p0p0
  alpha1 = yp1/p1p1
  alpha2 = yp2/p2p2
  alpha3 = yp3/p3p3

  p = @(x) alpha0 .* p0(x) + alpha1 .* p1(x) + alpha2 .* p2(x) + alpha3 .* p3(x);
  p1 = p;
  a = coeffs(p1);

end