function affiche_solution(u,x,y,h,N,Z,hz)
  compteur = 1;

  for z_obj = 0 :6*hz:h
    K=find(Z==z_obj);
    data_z = zeros(N+2,N+2);
    data_z = reshape(u(K), N+2,N+2);


    figure(compteur);
    contourf(x,y,data_z);
    title(['plan de coupe pour z=', num2str(z_obj) ,'m']);
    colorbar;

    compteur+=1;
  endfor
endfunction
