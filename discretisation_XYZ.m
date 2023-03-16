function [hx,hy,hz,X,Y,Z,x,y,z] = discretisation_XYZ(N, L, l, h) %N Nombre de points interieurs
  hx = L/(N+1); hy = l/(N+1); hz = h/(N+1); %pas de discretisation
  x = 0 : hx : L;
  y = 0 : hy : l;
  z = 0 : hz : h;
  [I1, I2, I3] = bijRec(1:(N+2)^3,N);
  X= x(I1+1);
  Y= y(I2+1);
  Z= z(I3+1);
endfunction
