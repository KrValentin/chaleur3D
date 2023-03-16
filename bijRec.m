% N c'est le nombre de points interieur sur une dimension
% bijRec  [1, (N+2)^3] -->  [0:N+1]^3
function [i1,i2,i3]=bijRec(k,N)
  i1= rem(rem(k-1,(N+2)^2),(N+2)) ;
  i2= (rem(k-1-i1, (N+2)^2))/(N+2);
  i3 = (k-1-i1-i2*(N+2))/(N+2)^2;
endfunction

