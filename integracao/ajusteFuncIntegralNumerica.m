function [px] = ajusteFuncIntegralNumerica(f, a, b, p0, p1, p2, p3, p4)
  p0p0x = @(x) p0(x) .* p0(x);
  p1p1x = @(x) p1(x) .* p1(x);
  p2p2x = @(x) p2(x) .* p2(x);
  p3p3x = @(x) p3(x) .* p3(x);
  p4p4x = @(x) p4(x) .* p4(x);

  p0p0 = simpson(a, b, p0p0x, 98);
  p1p1 = simpson(a, b, p1p1x, 98);
  p2p2 = simpson(a, b, p2p2x, 98);
  p3p3 = simpson(a, b, p3p3x, 98);
  p4p4 = simpson(a, b, p4p4x, 98);

  fp0x = @(x) f(x) .* p0(x);
  fp1x = @(x) f(x) .* p1(x);
  fp2x = @(x) f(x) .* p2(x);
  fp3x = @(x) f(x) .* p3(x);
  fp4x = @(x) f(x) .* p4(x);

  fp0 = simpson(a, b, fp0x, 98);
  fp1 = simpson(a, b, fp1x, 98);
  fp2 = simpson(a, b, fp2x, 98);
  fp3 = simpson(a, b, fp3x, 98);
  fp4 = simpson(a, b, fp4x, 98);

  alpha0 = fp0 / p0p0;
  alpha1 = fp1 / p1p1;
  alpha2 = fp2 / p2p2;
  alpha3 = fp3 / p3p3;
  alpha4 = fp4 / p4p4;

  p = @(x) alpha0 * p0(x) + alpha1 * p1(x) + alpha2 * p2(x) + alpha3 * p3(x) + alpha4 * p4(x);
  px = sym(p);
  alpha = [alpha0, alpha1, alpha2, alpha3, alpha4]

endfunction
