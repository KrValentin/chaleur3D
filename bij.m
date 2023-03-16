% N c'est le nombre de points interieur sur une dimension
% bij [0:N+1]^3  -->  [1, (N+2)^3]
function [k]= bij(i,j,m,N)
  k = i + 1 + j*(N+2) + m*(N+2)*(N+2);
endfunction
