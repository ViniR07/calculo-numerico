
function [x] = seidinho(n, Ab, x, tol, m)
 k = 1;
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
       x(i) = x(i) + s;
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
%  fprintf('Solution vector after %d iterations is :\n', k-1);
%  for i = 1 : n
  %  fprintf(' %11.8f \n', x(i));
%  end
%Gauss_Seidel.m