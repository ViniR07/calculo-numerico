function x = backwardsub(A,b)
   n = length(b);
  %  x = vpa(zeros(n,1)); \\ with significant algarisms
   x = zeros(n,1);
   for i = n:-1:1
      x(i) = b(i);
      for j = i+1:n
         x(i) = x(i) - A(i,j)*x(j);
      end
      x(i) = x(i)/A(i,i);
   end
end