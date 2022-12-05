function [a] = funcLinUmParametro(y, g)
  sum1 = 0;
  sum2 = 0;  
    
  for i = 1:length(y)
      sum1 = sum1 + (g(i)*y(i));
  end
  for i = 1:length(y)
      sum2 = sum2 + (g(i)*g(i));
  end
  a = sum1/sum2;
end