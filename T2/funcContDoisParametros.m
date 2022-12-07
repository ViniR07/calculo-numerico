function [x] = funcContDoisParametros(gxa, gxb, yx, c, d)
  # Inicializando as matrizes
  A = zeros(2, 2);
  b = zeros(2, 1);
  
  # Definindo as funções de integração
  gxaxb = @(x) gxa(x).*gxb(x);
  gxaxa = @(x) gxa(x).*gxa(x);
  gxbxb = @(x) gxb(x).*gxb(x);
  gxay = @(x) gxa(x).*yx(x);
  gxby = @(x) gxb(x).*yx(x);

  # Calculando as integrais
  gaga = quadgk(gxaxa, c, d);
  gagb = quadgk(gxaxb, c, d);
  gbgb = quadgk(gxbxb, c, d);
  gay = quadgk(gxay, c, d);
  gby = quadgk(gxby, c, d);

  # Montando as matrizes
  A = [gaga, gagb;
  gagb, gbgb];
  b = [gay; gby];

  # Resolvendo o sistema
  [x, A, b] = gaussPivotP(A, b);
end