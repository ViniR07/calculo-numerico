function [a] = funcLinUmParametro(y, g)
  # Inicializa as variáveis dos somatórios
  sum1 = 0;
  sum2 = 0;  
    
  # Calcula os somatórios
  for i = 1:length(y)
      sum1 = sum1 + (g(i)*y(i));
  end
  for i = 1:length(y)
      sum2 = sum2 + (g(i)*g(i));
  end

  # Calcula o parâmetro a
  a = sum1/sum2;
end