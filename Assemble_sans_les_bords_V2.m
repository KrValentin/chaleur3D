function [A,b]=Assemble_sans_les_bords_V2(N,hx,hy,hz, X, Y, Z,L,l,h)
  m = N+2;   % nombre total de points de discretisation d'un cote
  m2 = m^2;
  n = m^3;          %taille de la matrice
  A=spalloc(n,n,7*n);  %au maximum 7 coeff non nuls dans une ligne
  b=spalloc(n,1, 2*m2) ;



  for k = 1:N % Boucle sur les z
    for j = 1:N % Boucle sur les y

        K = bij(1:N,j,k,N);

        % Element diagonal
        L1 = sub2ind([n,n],K,K);
        A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

        % Selon X
        L2 = sub2ind([n,n],K,K + ones(1,N));
        A(L2) = 1/hx^2;
        L3 = sub2ind([n,n],K,K - ones(1,N));
        A(L3) = 1/hx^2;

        % Selon Y
        L4 = sub2ind([n,n],K,K + m*ones(1,N));
        A(L4) = 1/hy^2;
        L5 = sub2ind([n,n],K,K - m*ones(1,N));
        A(L5) = 1/hy^2;

        % Selon Z
        L6 = sub2ind([n,n],K,K + m2*ones(1,N));
        A(L6) = 1/hz^2;
        L7 = sub2ind([n,n],K,K - m2*ones(1,N));
        A(L7) = 1/hz^2;

    endfor
  endfor
endfunction
