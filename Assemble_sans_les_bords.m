% N c'est le nombre de points interieur sur une dimension

function [A,b]=Assemble_sans_les_bords(N,hx,hy,hz, X, Y, Z,L,l,h)
  m= N+2;   % nombre total de points de discretisation d'un cote
  m2 = m^2;
  n = m^3;          %taille de la matrice
  A=spalloc(n,n,7*n);  %au maximum 7 coeff non nuls dans une ligne
  b=spalloc(n,1, 2*m2) ;


  %pas sur de moi ici
  for i3 = 1:N
    for i2 = 1:N
      for i1 = 1:N
        k = bij(i1,i2,i3,N);
        A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;

        %selon x
        A(k,k+1) = 1/hx^2;
        A(k, k-1) = 1/hx^2;

        %selon y
        A(k,k+m) = 1/hy^2;
        A(k,k-m) = 1/hy^2;

        %selon z
        A(k, k+m2) = 1/hz^2;
        A(k, k-m2) = 1/hz^2;

      endfor
    endfor
  endfor


endfunction
