clear all;
close all;
%Probleme du radiateur de 3D

% ###################### DONNEES DU PB ################################

% *** Dimension de la piece en metres ***
  L = 4;
  l = 3;
  h = 2.5;

% *** Fenetre ***

% position fenetre
  h_fenetre = 1.20;
  x_fen = 0;
  y_fen_min = 1;  y_fen_max = 2;
  z_fen_min= 1;   z_fen_max = 1+h_fenetre;

% thermo fenetre
  coeff_thermique_fenetre = 2;
  T_ext = 10;

% *** Radiateur ***

% Dimension commune a tous les radiateurs
  z_rad = 0.125; % distance entre le sol et le bas du radiateur
  h_rad = 0.75; % hauteur du radiateur
  z_rad_min = z_rad; z_rad_max = z_rad+h_rad;

% radiateur1 place sous la fenetre
  x_rad_min = 0; x_rad_max = 0.20; %=> profondeur du radiateur = 20cm
  y_rad_min = 1.05; y_rad_max = 1.95; % pour coller avec la longeur des sous intervalles de 0.15m
  T_rad = 25; %degres
  ACTIVATION_RAD1 = false;

% radiateur2 place sur le mur oppose a la fenetre
  x_rad_min2 = L-0.20; x_rad_max2 = L; %=> profondeur du radiateur = 20cm
  y_rad_min2 = 1.05; y_rad_max2 = 1.95; % pour coller avec la longeur des sous intervalles de 0.15m
  T_rad2 = 25; %degres
  ACTIVATION_RAD2 = false;

%radiateur3 place sur le mur adjacent a la fenetre
  x_rad_min3 = 1.4; x_rad_max3 = 2.4; %pour coller avec la longeur des sous intervalles de 0.2m
  y_rad_min3 = 0; y_rad_max3 = 0.20; % => on ne remarquera pas cette condition pour N = 19 car hy = 15cm
  T_rad3 = 25; %degres
  ACTIVATION_RAD3 = false;

%source de chaleur interne : un humain par exemple
  x_src_min = 1.00; x_src_max = 1.50;
  y_src_min = 1.00; y_src_max = 1.20;
  z_src_min = 0; z_src_max = 1.60;
  T_src = 28; % degre :  la temperature degagee par un humain habille
  PRESENCE_CORPS_CHAUD= false;


% ###################### RESOLUTION DU PB ################################
tic

% *** Discretisation ***
  N = 19; %Nombre de points interieurs =>20 sous intervalles
  [hx,hy,hz,X,Y,Z,x,y,z] = discretisation_XYZ(N, L, l, h);

% *** Assemblage de la matrice de difference finie ***

% Condition LapT = 0 a l'interieur
  [A,b]=Assemble_sans_les_bords_V2(N,hx,hy,hz, X, Y, Z, L,l,h);

% Condition dT/dn=0 sur les bords
  A= Bords_reguliers_V2(A,X,Y,Z, L,l,h, N,hx,hy,hz);

% Condition fenetre dT/dn = coeff_thermique_fenetre*(T-Text) au niveau de la fenetre
  [A,b]=conditions_fenetre(A,b,X, Y, Z, x_fen, y_fen_min, y_fen_max, z_fen_min, z_fen_max, coeff_thermique_fenetre, T_ext, hx);

% Conditions sources de chaleur T = T_source au niveau de la source de chaleur

% radiateur1 place sous la fenetre
  if (ACTIVATION_RAD1)
    [A,b]=conditions_radiateur(A,b,X,Y,Z, x_rad_min, x_rad_max, y_rad_min, y_rad_max, z_rad_min, z_rad_max, T_rad);
  endif

% radiateur2 place sur le mur oppose a la fenetre
  if (ACTIVATION_RAD2)
    [A,b]=conditions_radiateur(A,b,X,Y,Z, x_rad_min2, x_rad_max2, y_rad_min2, y_rad_max2, z_rad_min, z_rad_max, T_rad2);
  endif

% radiateur3 place sur le mur adjacent a la fenetre
  if (ACTIVATION_RAD3)
    [A,b]=conditions_radiateur(A,b,X,Y,Z, x_rad_min3, x_rad_max3, y_rad_min3, y_rad_max3, z_rad_min, z_rad_max, T_rad3);
  endif

% source de chaleur produite par un humain dans la piece
  if  (PRESENCE_CORPS_CHAUD)
    [A,b]=conditions_corps_chaud_interieur(A,b,X,Y,Z, x_src_min, x_src_max, y_src_min, y_src_max, z_src_min, z_src_max, T_src);
  endif


% *** Resolution matricielle ***
  u = A\b;

% ###################### RESULTATS ################################

% *** Graphe de la solution ***
  % plan de coupe a z fixe
  affiche_solution(u,x,y,h,N,Z,hz);


% *** Donnees generales ***

  Temperature_max=max(u)
  Temperature_min=min(u)
  Moyenne_temperature=mean(u)
  Ecart_de_temperature=std(u)


toc
