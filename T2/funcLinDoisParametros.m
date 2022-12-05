function [x] = funcLinDoisParametros(y, ga, gb)
  A = zeros(2, 2);
  b = zeros(2, 1);
  
  gaga = 0;
  gagb = 0;
  gbgb = 0;
  gay = 0;
  gby = 0;
  for i = 1:length(y)
      gaga = gaga + (ga(i)*ga(i));
      gagb = gagb + (ga(i)*gb(i));
      gbgb = gbgb + (gb(i)*gb(i));
      gay = gay + (ga(i)*y(i));
      gby = gby + (gb(i)*y(i));
  end

  A = [gaga, gagb;
  gagb, gbgb];
  b = [gay; gby];

  [x, A, b] = gaussPivotP(A, b);
end