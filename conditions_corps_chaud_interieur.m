function [A,b]=conditions_corps_chaud_interieur(A,b,X,Y,Z, x_src_min, x_src_max, y_src_min, y_src_max, z_src_min, z_src_max, T_src)
  corps_chaud = find( X>= x_src_min & X<=x_src_max & Y>=y_src_min & Y<=y_src_max & Z>=z_src_min & Z<=z_src_max);
  for k=corps_chaud
    A(k,:) = zeros(length(k),size(A,1));
    A(k,k) =1;
    b(k,1) = T_src;
  endfor
endfunction
