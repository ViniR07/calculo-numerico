
function [x] = jacobinho(n, Ab, x, tol, m)
 k = 1;
  xNew = zeros(n,1);
 while k <= m
    err = 0;
    for i = 1 : n
       s = 0;
       for j = 1 : n
          s = s-Ab(i,j)*x(j);
       end
       s = (s+Ab(i,n+1))/Ab(i,i);
       if abs(s) > err
         err  = abs(s);
       end
       xNew(i) = xNew(i) + s;
    end
    # atualizando x
    for i = 1 : n
      x(i) = xNew(i);
    end
    if err <= tol
      break;
    else
      k = k+1;
    end
    fprintf('Solution vector after %d iterations is :\n', k-1);
    for i = 1 : n
      fprintf(' %11.8f \n', x(i));
    end
 end
%Gauss_Seidel.m