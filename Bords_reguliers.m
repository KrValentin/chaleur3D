function A= Bords_reguliers(A,X,Y,Z, L,l,h, N,hx,hy,hz)
  m= N+2;   % nombre total de points de discretisation d'un cote
  m2 = m^2;
  % ************** FACES *******************

  %********************** 1/ face de gauche *************************
  face_gauche = find(X==0 & Y!= 0 & Y!=l & Z!=0 & Z!=h);
  for k = face_gauche

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k+1) = 2/hx^2;

    %selon y
    A(k,k+m) = 1/hy^2;
    A(k,k-m) = 1/hy^2;

    %selon z
    A(k, k+m2) = 1/hz^2;
    A(k, k-m2) = 1/hz^2;
  endfor

  %***********************  2/ face de droite *************************
  face_droite = find(X==L & Y!= 0 & Y!=l & Z!=0 & Z!=h);
  for k=face_droite

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 2/hx^2;

    %selon y
    A(k,k+m) = 1/hy^2;
    A(k,k-m) = 1/hy^2;

    %selon z
    A(k, k+m2) = 1/hz^2;
    A(k, k-m2) = 1/hz^2;
  endfor

  %***********************  3/ face du haut *************************
  face_haut = find(X!=0 & X!=L & Y!= 0 & Y!=l & Z==h);
  for k= face_haut

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 1/hx^2;
    A(k,k+1) = 1/hx^2;

    %selon y
    A(k,k+m) = 1/hy^2;
    A(k,k-m) = 1/hy^2;

    %selon z
    A(k,k-m2) = 2/hz^2;
  endfor
  %*********************** 4/ face du bas *************************
  face_bas = find(X!=0 & X!=L & Y!= 0 & Y!=l & Z==0);
  for k= face_bas

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 1/hx^2;
    A(k,k+1) = 1/hx^2;

    %selon y
    A(k,k+m) = 1/hy^2;
    A(k,k-m) = 1/hy^2;

    %selon z
    A(k, k+m2) = 2/hz^2;
  endfor

  %*********************** 5/  face avant *************************
  face_avant = find(X!=0 & X!=L & Y==0 & Z!=0 & Z!=h);
  for k= face_avant

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 1/hx^2;
    A(k,k+1) = 1/hx^2;

    %selon y
    A(k,k+m) = 2/hy^2;

    %selon z
    A(k, k-m2) = 1/hz^2;
    A(k, k+m2) = 1/hz^2;
  endfor


  %*********************** 6/ face arriere *************************
  face_arriere = find(X!=0 & X!=L & Y== l & Z!=0 & Z!=h);
  for k= face_arriere

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 1/hx^2;
    A(k,k+1) = 1/hx^2;

    %selon y
    A(k,k-m) = 2/hy^2;

    %selon z
    A(k, k-m2) = 1/hz^2;
    A(k, k+m2) = 1/hz^2;
  endfor



  %**************** ARETES***************

  % ************** 1/ arrete gauche avant  ***************
  arete_gauche_avant = bij(0,0, 1:N,N);
  for k = arete_gauche_avant
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k+1) = 2/hx^2;

    %selon y
    A(k,k+m) = 2/hy^2;

    %selon z
    A(k, k-m2) = 1/hz^2;
    A(k, k+m2) = 1/hz^2;
  endfor



    % ************** 2/ arrete gauche arriere  ***************
  arete_gauche_arriere = bij(0,N+1, 1:N,N);
  for k = arete_gauche_arriere
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k+1) = 2/hx^2;

    %selon y
    A(k,k-m) = 2/hy^2;

    %selon z
    A(k, k-m2) = 1/hz^2;
    A(k, k+m2) = 1/hz^2;
  endfor


  % ************** 3/ arrete gauche haut  ***************
  arete_gauche_haut= bij(0,1:N, N+1, N);
  for k = arete_gauche_haut
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k+1) = 2/hx^2;

    %selon y
    A(k,k-m) = 1/hy^2;
    A(k,k+m) = 1/hy^2;

    %selon z
    A(k, k-m2) = 2/hz^2;
  endfor

  % ************** 4/ arrete gauche bas  ***************
  arete_gauche_bas = bij(0,1:N,0,N);
  for k = arete_gauche_bas
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k+1) = 2/hx^2;

    %selon y
    A(k,k-m) = 1/hy^2;
    A(k,k+m) = 1/hy^2;

    %selon z
    A(k, k+m2) = 2/hz^2;
  endfor

  % ************** 5/ arrete droite avant  ***************
  arete_droite_avant = bij(N+1, 0, 1:N,N);
  for k = arete_droite_avant
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 2/hx^2;

    %selon y
    A(k,k+m) = 2/hy^2;

    %selon z
    A(k, k+m2) = 1/hz^2;
    A(k, k-m2) = 1/hz^2;
  endfor

  % ************** 6/ arrete droite arriere  ***************
  arete_droite_arriere = bij(N+1, N+1, 1:N,N);
  for k = arete_droite_arriere
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 2/hx^2;

    %selon y
    A(k,k-m) = 2/hy^2;

    %selon z
    A(k, k+m2) = 1/hz^2;
    A(k, k-m2) = 1/hz^2;
  endfor


  % ************** 7/ arrete droite haut  ***************
  arete_droite_haut= bij(N+1, 1:N, N+1,N);
  for k = arete_droite_haut
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 2/hx^2;

    %selon y
    A(k,k-m) = 1/hy^2;
    A(k,k+m) = 1/hy^2;

    %selon z
    A(k, k-m2) = 2/hz^2;
  endfor


  % ************** 8/ arrete droite bas  ***************
  arete_droite_bas = bij(N+1, 1:N, 0,N);
  for k = arete_droite_bas
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 2/hx^2;

    %selon y
    A(k,k-m) = 1/hy^2;
    A(k,k+m) = 1/hy^2;

    %selon z
    A(k, k+m2) = 2/hz^2;
  endfor


  % ************** 9/ arrete avant_haut  ***************
  arete_avant_haut = bij(1:N,0,N+1,N);
  for k = arete_avant_haut
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 1/hx^2;
    A(k,k+1) = 1/hx^2;

    %selon y
    A(k,k+m) = 2/hy^2;

    %selon z
    A(k, k-m2) = 2/hz^2;
  endfor



  % ************** 10/ arrete avant_bas  ***************
  arete_avant_bas = bij(1:N, 0, 0,N);
  for k = arete_avant_bas
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 1/hx^2;
    A(k,k+1) = 1/hx^2;

    %selon y
    A(k,k+m) = 2/hy^2;

    %selon z
    A(k, k+m2) = 2/hz^2;
  endfor


  % ************** 11/ arrete arriere haut  ***************
  arete_arriere_haut =bij(1:N, N+1, N+1,N);
  for k = arete_arriere_haut
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 1/hx^2;
    A(k,k+1) = 1/hx^2;

    %selon y
    A(k,k-m) = 2/hy^2;

    %selon z
    A(k, k-m2) = 2/hz^2;
  endfor


  % ************** 12/ arrete arriere bas  ***************
  arete_arriere_bas = bij(1:N, N+1, 0,N);
  for k = arete_arriere_bas
    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 1/hx^2;
    A(k,k+1) = 1/hx^2;

    %selon y
    A(k,k-m) = 2/hy^2;

    %selon z
    A(k, k+m2) = 2/hz^2;
  endfor


  % ******** COINS *****

  % **************** 1/ coin gauche haut avant ********************
  coin_gauche_haut_avant= bij(0,0,N+1,N) ;           %find(X==0 & Y==0 & Z ==h);
    k = coin_gauche_haut_avant;

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k+1) = 2/hx^2;

    %selon y
    A(k,k+m) = 2/hy^2;

    %selon z
    A(k, k-m2) = 2/hz^2;


  % ******************** 2/ coin gauche haut arriere ****************
  coin_gauche_haut_arriere = bij(0,N+1,N+1,N);       %find(X==0 & Y ==l & Z==h);
  k = coin_gauche_haut_arriere;

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k+1) = 2/hx^2;

    %selon y
    A(k,k-m) = 2/hy^2;

    %selon z
    A(k, k-m2) = 2/hz^2;

  % ******************** 3/ coin gauche bas avant ********************
  coin_gauche_bas_avant = bij(0,0,0,N);              %find(X==0 & Y==0 & Z==0);
  k = coin_gauche_bas_avant;

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k+1) = 2/hx^2;

    %selon y
    A(k,k+m) = 2/hy^2;

    %selon z
    A(k, k+m2) = 2/hz^2;

  % ******************** 4/ coin gauche bas arriere ******************
  coin_gauche_bas_arriere = bij(0,N+1,0,N);          %find(X==0 & Y==l & Z==0);
  k = coin_gauche_bas_arriere;

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k+1) = 2/hx^2;

    %selon y
    A(k,k-m) = 2/hy^2;

    %selon z
    A(k, k+m2) = 2/hz^2;

  % ******************** 5/ coin droit haut avant *********************
  coin_droit_haut_avant= bij(N+1,0,N+1,N);           %find(X==L & Y==0 & Z ==h);
  k = coin_droit_haut_avant;

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 2/hx^2;

    %selon y
    A(k,k+m) = 2/hy^2;

    %selon z
    A(k, k-m2) = 2/hz^2;

  % ******************** 6/ coin droit haut arriere *******************
  coin_droit_haut_arriere = bij(N+1,N+1,N+1,N);      %find(X==L & Y ==l & Z==h);
  k = coin_droit_haut_arriere;

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 2/hx^2;

    %selon y
    A(k,k-m) = 2/hy^2;

    %selon z
    A(k, k-m2) = 2/hz^2;


  % ********************* 7/ coin droit bas avant *********************
  coin_droit_bas_avant = bij(N+1,0,0,N);             %find(X==L & Y==0 & Z==0);
  k = coin_droit_bas_avant;

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 2/hx^2;

    %selon y
    A(k,k+m) = 2/hy^2;

    %selon z
    A(k, k+m2) = 2/hz^2;


  % ********************** 8/ coin droit bas arriere ******************
  coin_droit_bas_arriere = bij(N+1,N+1,0,N);         %find(X==L & Y==l & Z==0);
  k = coin_droit_bas_arriere;

    A(k,k) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %selon x
    A(k,k-1) = 2/hx^2;

    %selon y
    A(k,k-m) = 2/hy^2;

    %selon z
    A(k, k+m2) = 2/hz^2;

endfunction
