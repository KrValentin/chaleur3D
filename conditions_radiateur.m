function [A,b]=conditions_radiateur(A,b,X,Y,Z, x_rad_min, x_rad_max, y_rad_min, y_rad_max, z_rad_min, z_rad_max, T_rad)
  radiateur = find( X>= x_rad_min & X<=x_rad_max & Y>=y_rad_min & Y<=y_rad_max & Z>=z_rad_min & Z<=z_rad_max);
  for k=radiateur
    A(k,:) = zeros(length(k),size(A,1));
    A(k,k) =1;
    b(k,1) = T_rad;
  endfor
endfunction
