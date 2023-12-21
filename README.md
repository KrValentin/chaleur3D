PROBLEME DU RADIATEUR EN 3D - Dimensions finies

AUTEURS :
  KAHIL Yannis,
  KRAEMER Valentin
  MACS2

Objectif :
  Modelisation de la temperature d'une piece cubique de dimensions L*l*h
  en presence d'une fenetre et de sources de chaleur


Equation :

  LapT = 0 a l'interieur

  dT/dn = 0 sur les murs

  dT/dn = coeff*(T-T_ext) au niveau de la fenetre,
  avec un certain coefficient de diffusion thermique caracteristique de la fenetre

  T = T_rad au niveau des radiateurs

  T = T_source au niveau d'une source de chaleur interieure a la piece,
  cela peut representer la presence d'un homme a l'interieur de la piece


Methode de resolution :

  Differences finies, utilisation de matrices creuses et la methode de bijection 3D -> 1D


Executable :

  main.m
