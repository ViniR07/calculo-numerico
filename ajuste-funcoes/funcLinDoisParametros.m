function [x] = funcLinDoisParametros(y, ga, gb)
  # Inicializando as matrizes
  A = zeros(2, 2);
  b = zeros(2, 1);
  
  # Inicializando as variáveis dos somatórios (produtos internos)
  gaga = 0;
  gagb = 0;
  gbgb = 0;
  gay = 0;
  gby = 0;

  # Calculando os somatórios
  for i = 1:length(y)
      gaga = gaga + (ga(i)*ga(i));
      gagb = gagb + (ga(i)*gb(i));
      gbgb = gbgb + (gb(i)*gb(i));
      gay = gay + (ga(i)*y(i));
      gby = gby + (gb(i)*y(i));
  end

  # Montando as matrizes
  A = [gaga, gagb;
  gagb, gbgb];
  b = [gay; gby];

  # Resolvendo o sistema
  [x, A, b] = gaussPivotP(A, b);
end