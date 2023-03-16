function [A,b]=conditions_fenetre(A,b,X, Y, Z, x_fen, y_fen_min, y_fen_max, z_fen_min, z_fen_max, coeff_thermique_fenetre, T_ext, hx)
  fenetre = find(X==x_fen & Y <=y_fen_max & Y>= y_fen_min & Z<= z_fen_max & Z>=z_fen_min);
  for k = fenetre
    A(k,k) = A(k,k)-coeff_thermique_fenetre/hx;
    b(k,1) = b(k,1) -coeff_thermique_fenetre*T_ext/(hx);
  endfor

endfunction
