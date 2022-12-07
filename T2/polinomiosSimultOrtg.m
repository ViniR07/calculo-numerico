function [c, p2] = polinomiosSimultOrtg(p0, p1, x)
  alpha2 = 0;
  beta2 = 0;

  % fx = @(x) x;
  % p0xp1x = @(x) p0(x) .* (fx(x) .* p1(x));
  % p1xp1x = @(x) p1(x) .* (fx(x) .* p1(x));
  % p0p0x = @(x) p0(x) .* p0(x);
  % p1p1x = @(x) p1(x) .* p1(x);

  % p1xp1 = quadgk(p1xp1x, 0, 1);
  % p1p1 = quadgk(p1p1x, 0, 1);
  % p0xp1 = quadgk(p0xp1x, 0, 1);
  % p0p0 = quadgk(p0p0x, 0, 1);

  for i = 1:4
    p0xp1 = p0(x(i)) .* (x(i) .* p1(x(i)));
    p1xp1 = p1(x(i)) .* (x(i) .* p1(x(i)));
    p0p0 = p0(x(i)) .* p0(x(i));
    p1p1 = p1(x(i)) .* p1(x(i));
  end

  alpha2 = p1xp1 / p1p1
  beta2 = p0xp1 / p0p0

  p2 = @(x) (x - alpha2) .* p1(x) - beta2 .* p0(x);
  p21 = sym(p2);

  p2(1)
  p21(1)
  c = coeffs(p21);
end