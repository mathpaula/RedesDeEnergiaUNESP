V1 = 1
V2 = 0.8967

r = 0.05 //resistencia
x = 0.2  //reatancia
z = r + %i*0.2 //impedância
y = 1/z //admitancia
g = real(y) //condutancia   
b = imag(y) //susceptancia

P = (0:0.05:2)*0.8 //potencia ativa
Q = P*0.2506 //potencia reativa

A = g^2 + b^2 //coeficientes das raízes

B = 2*(g*P - b*Q) - V1^2*(g^2 + b^2)//coeficientes das raízes

C = P.^2 + Q.^2 //coeficientes das raízes

x1 = (-B+sqrt(B.^2-4*A*C))./(2*A) //discriminante delta
x2 = (-B-sqrt(B.^2-4*A*C))./(2*A) //discriminante delta

raiz1 = sqrt(x1) 
raiz2 = sqrt(x2)

V = [raiz1 raiz2] //une as raízes
disp(V)

xgrid(1)
plot(P, raiz1, P, raiz2) 
title('Potência Ativa vs Tensão')
xlabel('Potencia Ativa (pu)')
ylabel('Tensao (pu)')

