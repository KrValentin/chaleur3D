function A= Bords_reguliers_V2(A,X,Y,Z, L,l,h, N,hx,hy,hz)
  m = N+2;   % nombre total de points de discretisation d'un cote
  m2 = m^2;
  n_tot = m^3;
  % ************** FACES *******************

  %********************** 1/ face de gauche *************************
    K_g = find(X==0 & Y!= 0 & Y!=l & Z!=0 & Z!=h);
    n = length(K_g);

    L1 = sub2ind([n_tot n_tot],K_g,K_g);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K_g,K_g + ones(1,n));
    A(L2) = 2/hx^2;

    %Selon Y
    L3 = sub2ind([n_tot n_tot],K_g,K_g + m*ones(1,n));
    A(L3) = 1/hy^2;
    L4 = sub2ind([n_tot n_tot],K_g,K_g - m*ones(1,n));
    A(L4) = 1/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K_g,K_g + m2*ones(1,n));
    A(L5) = 1/hz^2;
    L6 = sub2ind([n_tot n_tot],K_g,K_g - m2*ones(1,n));
    A(L6) = 1/hz^2;

  %***********************  2/ face de droite *************************
    K_dr = find(X==L & Y!= 0 & Y!=l & Z!=0 & Z!=h);
    n = length(K_dr);
    L1 = sub2ind([n_tot n_tot],K_dr,K_dr);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K_dr,K_dr - ones(1,n));
    A(L2) = 2/hx^2;

    %Selon Y
    L3 = sub2ind([n_tot n_tot],K_dr,K_dr + m*ones(1,n));
    A(L3) = 1/hy^2;
    L4 = sub2ind([n_tot n_tot],K_dr,K_dr - m*ones(1,n));
    A(L4) = 1/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K_dr,K_dr + m2*ones(1,n));
    A(L5) = 1/hz^2;
    L6 = sub2ind([n_tot n_tot],K_dr,K_dr - m2*ones(1,n));
    A(L6) = 1/hz^2;

  %***********************  3/ face du haut *************************
  K_h = find(X!=0 & X!=L & Y!= 0 & Y!=l & Z==h);
  n = length(K_h);
    L1 = sub2ind([n_tot n_tot],K_h,K_h);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K_h,K_h - ones(1,n));
    A(L2) = 1/hx^2;
    L3 = sub2ind([n_tot n_tot],K_h,K_h + ones(1,n));
    A(L3) = 1/hx^2;

    %Selon Y
    L4 = sub2ind([n_tot n_tot],K_h,K_h + m*ones(1,n));
    A(L4) = 1/hy^2;
    L5 = sub2ind([n_tot n_tot],K_h,K_h - m*ones(1,n));
    A(L5) = 1/hy^2;

    %Selon Z
    L6 = sub2ind([n_tot n_tot],K_h,K_h - m2*ones(1,n));
    A(L6) = 2/hz^2;

  %*********************** 4/ face du bas *************************
  K_b = find(X!=0 & X!=L & Y!= 0 & Y!=l & Z==0);
  n = length(K_b);
    L1 = sub2ind([n_tot n_tot],K_b,K_b);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %selon x
    L2 = sub2ind([n_tot n_tot],K_b,K_b - ones(1,n));
    A(L2) = 1/hx^2;
    L3 = sub2ind([n_tot n_tot],K_b,K_b + ones(1,n));
    A(L3) = 1/hx^2;

    %selon y
    L4 = sub2ind([n_tot n_tot],K_b,K_b + m*ones(1,n));
    A(L4) = 1/hy^2;
    L5 = sub2ind([n_tot n_tot],K_b,K_b - m*ones(1,n));
    A(L5) = 1/hy^2;

    %selon z
    L6 = sub2ind([n_tot n_tot],K_b,K_b + m2*ones(1,n));
    A(L6) = 2/hz^2;

  %*********************** 5/  face avant *************************
    K_av = find(X!=0 & X!=L & Y==0 & Z!=0 & Z!=h);
    n = length(K_av);

    L1 = sub2ind([n_tot n_tot],K_av,K_av);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K_av,K_av - ones(1,n));
    A(L2) = 1/hx^2;
    L3 = sub2ind([n_tot n_tot],K_av,K_av + ones(1,n));
    A(L3) = 1/hx^2;

    %Selon Y
    L4 = sub2ind([n_tot n_tot],K_av,K_av + m*ones(1,n));
    A(L4) = 2/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K_av,K_av - m2*ones(1,n));
    A(L5) = 1/hz^2;
    L6 = sub2ind([n_tot n_tot],K_av,K_av + m2*ones(1,n));
    A(L6) = 1/hz^2;


  %*********************** 6/ face arriere *************************
  K_ar = find(X!=0 & X!=L & Y== l & Z!=0 & Z!=h);
  n = length(K_ar);

    L1 = sub2ind([n_tot n_tot],K_ar,K_ar);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K_ar,K_ar - ones(1,n));
    A(L2) = 1/hx^2;
    L3 = sub2ind([n_tot n_tot],K_ar,K_ar + ones(1,n));
    A(L3) = 1/hx^2;

    %Selon Y
    L4 = sub2ind([n_tot n_tot],K_ar,K_ar - m*ones(1,n));
    A(L4) = 2/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K_ar,K_ar - m2*ones(1,n));
    A(L5) = 1/hz^2;
    L6 = sub2ind([n_tot n_tot],K_ar,K_ar + m2*ones(1,n));
    A(L6) = 1/hz^2;

  %**************** ARETES***************

  % ************** 1/ arete gauche avant  ***************
  K = bij(0,0, 1:N,N);
  n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K + ones(1,n));
    A(L2) = 2/hx^2;

    %Selon Y
    L3 = sub2ind([n_tot n_tot],K,K + m*ones(1,n));
    A(L3) = 2/hy^2;

    %Selon Z
    L4 = sub2ind([n_tot n_tot],K,K - m2*ones(1,n));
    A(L4) = 1/hz^2;
    L5 = sub2ind([n_tot n_tot],K,K + m2*ones(1,n));
    A(L5) = 1/hz^2;

    % ************** 2/ arete gauche arriere  ***************
    K = bij(0,N+1, 1:N,N);
    n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K + ones(1,n));
    A(L2) = 2/hx^2;

    %Selon Y
    L3 = sub2ind([n_tot n_tot],K,K - m*ones(1,n));
    A(L3) = 2/hy^2;

    %Selon Z
    L4 = sub2ind([n_tot n_tot],K,K - m2*ones(1,n));
    A(L4) = 1/hz^2;
    L5 = sub2ind([n_tot n_tot],K,K + m2*ones(1,n));
    A(L5) = 1/hz^2;


  % ************** 3/ arrete gauche haut  ***************
  K = bij(0,1:N, N+1, N);
  n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K + ones(1,n));
    A(L2) = 2/hx^2;

    %Selon Y
    L3 = sub2ind([n_tot n_tot],K,K - m*ones(1,n));
    A(L3) = 1/hy^2;
    L4 = sub2ind([n_tot n_tot],K,K + m*ones(1,n));
    A(L4) = 1/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K,K - m2*ones(1,n));
    A(L5) = 2/hz^2;

  % ************** 4/ arrete gauche bas  ***************
    K = bij(0,1:N,0,N);
    n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K + ones(1,n));
    A(L2) = 2/hx^2;

    %Selon Y
    L3 = sub2ind([n_tot n_tot],K,K - m*ones(1,n));
    A(L3) = 1/hy^2;
    L4 = sub2ind([n_tot n_tot],K,K + m*ones(1,n));
    A(L4) = 1/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K,K + m2*ones(1,n));
    A(L5) = 2/hz^2;

  % ************** 5/ arrete droite avant  ***************
  K = bij(N+1, 0, 1:N,N);
  n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K - ones(1,n));
    A(L2) = 2/hx^2;

    %Selon Y
    L3 = sub2ind([n_tot n_tot],K,K + m*ones(1,n));
    A(L3) = 2/hy^2;

    %Selon Z
    L4 = sub2ind([n_tot n_tot],K,K + m2*ones(1,n));
    A(L4) = 1/hz^2;
    L5 = sub2ind([n_tot n_tot],K,K - m2*ones(1,n));
    A(L5) = 1/hz^2;

  % ************** 6/ arrete droite arriere  ***************
     K = bij(N+1, N+1, 1:N,N);
     n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K - ones(1,n));
    A(L2) = 2/hx^2;

    %Selon Y
    L3 = sub2ind([n_tot n_tot],K,K - m*ones(1,n));
    A(L3) = 2/hy^2;

    %Selon Z
    L4 = sub2ind([n_tot n_tot],K,K + m2*ones(1,n));
    A(L4) = 1/hz^2;
    L5 = sub2ind([n_tot n_tot],K,K - m2*ones(1,n));
    A(L5) = 1/hz^2;


  % ************** 7/ arete droite haut  ***************
    K = bij(N+1, 1:N, N+1,N);
    n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K - ones(1,n));
    A(L2) = 2/hx^2;

    %Selon Y
    L3 = sub2ind([n_tot n_tot],K,K - m*ones(1,n));
    A(L3) = 1/hy^2;
    L4 = sub2ind([n_tot n_tot],K,K + m*ones(1,n));
    A(L4) = 1/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K,K - m2*ones(1,n));
    A(L5) = 2/hz^2;

  % ************** 8/ arrete droite bas  ***************
    K = bij(N+1, 1:N, 0,N);
    n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K - ones(1,n));
    A(L2) = 2/hx^2;

    %Selon Y
    L3 = sub2ind([n_tot n_tot],K,K - m*ones(1,n));
    A(L3) = 1/hy^2;
    L4 = sub2ind([n_tot n_tot],K,K + m*ones(1,n));
    A(L4) = 1/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K,K + m2*ones(1,n));
    A(L5) = 2/hz^2;

  % ************** 9/ arrete avant_haut  ***************
    K = bij(1:N,0,N+1,N);
    n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K - ones(1,n));
    A(L2) = 1/hx^2;
    L3 = sub2ind([n_tot n_tot],K,K + ones(1,n));
    A(L3) = 1/hx^2;

    %Selon Y
    L4 = sub2ind([n_tot n_tot],K,K + m*ones(1,n));
    A(L4) = 2/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K,K - m2*ones(1,n));
    A(L5) = 2/hz^2;

  % ************** 10/ arete avant_bas  ***************
    K = bij(1:N, 0, 0,N);
    n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;

    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K - ones(1,n));
    A(L2) = 1/hx^2;
    L3 = sub2ind([n_tot n_tot],K,K + ones(1,n));
    A(L3) = 1/hx^2;

    %Selon Y
    L4 = sub2ind([n_tot n_tot],K,K + m*ones(1,n));
    A(L4) = 2/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K,K + m2*ones(1,n));
    A(L5) = 2/hz^2;


  % ************** 11/ arete arriere haut  ***************
    K = bij(1:N, N+1, N+1,N);
    n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K - ones(1,n));
    A(L2) = 1/hx^2;
    L3 = sub2ind([n_tot n_tot],K,K + ones(1,n));
    A(L3) = 1/hx^2;

    %Selon Y
    L4 = sub2ind([n_tot n_tot],K,K - m*ones(1,n));
    A(L4) = 2/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K,K - m2*ones(1,n));
    A(L5) = 2/hz^2;


  % ************** 12/ arete arriere bas  ***************
    K = bij(1:N, N+1, 0,N);
    n = length(K);

    L1 = sub2ind([n_tot n_tot],K,K);
    A(L1) = -2/hx^2 - 2/hy^2 - 2/hz^2;
    %Selon X
    L2 = sub2ind([n_tot n_tot],K,K-ones(1,n));
    A(L2) = 1/hx^2;
    L3 = sub2ind([n_tot n_tot],K,K + ones(1,n));
    A(L3) = 1/hx^2;

    %Selon Y
    L4 = sub2ind([n_tot n_tot],K,K - m*ones(1,n));
    A(L4) = 2/hy^2;

    %Selon Z
    L5 = sub2ind([n_tot n_tot],K,K + m2*ones(1,n));
    A(L5) = 2/hz^2;

  % ******** COINS *****

  % **************** 1/ coin gauche haut avant ********************
    coin_gauche_haut_avant = bij(0,0,N+1,N) ;           %find(X==0 & Y==0 & Z ==h);
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
