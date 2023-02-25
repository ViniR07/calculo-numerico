function [w] = metodoNewtonInterp(t, z)
  # Método de Newton para interpolação
  # t: vetor de coordenadas x dos pontos
  # z: vetor de coordenadas y dos pontos

  # inicializando nossa matriz de coeficientes
  w = zeros(length(t), length(t));


  # preenchendo a diagonal principal da matriz
  for h = 1:length(t)
    w(h, h) = z(h);
  end

  # preenchendo as 'escadinhas'
  for k = 1:length(t)
    for i = 1:length(t) - k
        j = i+k;
        w(i, j) = (w(i+1, j) - w(i, j-1)) / (t(j) - t(i));
        printf("i: %d, j: %d, w(i,j) = %.12f / %.12f = %.12f\n", i-1, j-1, (w(i+1, j) - w(i, j-1)), (t(j) - t(i)), w(i, j));
        % w
    end 
  end

  # calculando o ultimo coeficiente
  w(1, length(t)) = (w(2, length(t)) - w(1, length(t) - 1)) / (t(length(t)) - t(1));

  # metodo de newton



end