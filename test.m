compteur = 1;
for z_obj = 0 :6*hz:h


K=find(Z==z_obj);
data= u(K);

data_z = zeros(N+2,N+2)

for i = 1:N+2
  data_z(i,:)= data((1:N+2) +(i-1)*(N+2));
endfor

figure(compteur);

contourf(x,y,data_z)
title("plan de coupe pour z="+ z_obj +"m");
colorbar
compteur+=1;
endfor
