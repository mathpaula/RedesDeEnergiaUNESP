// Declarando as variáveis
z12 = 0.05+%i*0.1

bsh = 0.06

V1 = 1.01
t1 = 0

// Inversa de z12
y12 = inv(z12)

// Parte real e imaginaria
g = real(y12)
b = imag(y12)

//Construindo a Y_barra 
Y_barra(1,1) = y12 + (bsh/2)
Y_barra(1,2) = -y12

Y_barra(2,1) = -y12
Y_barra(2,2) = y12 + (bsh/2)

G = real(Y_barra)
B = imag(Y_barra)

// Chute inicial
V2 = 1
t2 = 0

for h = 1 : 4
    disp(h,"Iteração")

f1 = V2*V1*(G(2,1)*cos(t2-t1)+B(2,1)*sin(t2-t1))+V2^2*(G(2,2)*cos(t2-t2)) + 1.2
f2 = V2*V1*(G(2,1)*sin(t2-t1)-B(2,1)*cos(t2-t1))+V2^2*(-B(2,2)*cos(t2-t2)) + 0.3

F = [f1;f2]
X = [V2;t2]

J(1,1) = V1*(G(2,1)*cos(t2-t1)+B(2,1)*sin(t2-t1)) + 2*V2*G(2,2)*cos(t2-t2)
J(1,2) = V2*V1*(-(G(2,1))*sin(t2-t1) + B(2,1)*cos(t2-t1))

J(2,1) = V1*(G(2,1)*sin(t2-t1)-B(2,1)*cos(t2-t1)) + 2*V2*(-B(2,2)*cos(t2-t2))
J(2,2) = V2*V1*(G(2,1)*cos(t2-t1) + B(2,1)*sin(t2-t1))

//Newton Rapshon
X = X - inv(J)*F

// Atualizando V2 e t2
V2 = X(1)
t2 = X(2)

P2 = V2*V1*(G(2,1)*cos(t2-t1)+B(2,1)*sin(t2-t1)) + ...
     V2*V2*(G(2,2)*cos(t2-t2)+B(2,2)*sin(t2-t2))

disp('V2')
disp(V2)

disp('t2')
disp(t2*180/%pi)

end

P12 = g*V1*V1-V1*V2*(g*cos(t1-t2)+b*sin(t1-t2))
Q12 = -(b+(b/2))*V1*V1-V1*V2*(g*sin(t1-t2)-b*cos(t1-t2))

disp('P12')
disp(P12)

disp('Q12')
disp(Q12)

P21 = g*V2*V2-V2*V1*(g*cos(t2-t1)+b*sin(t2-t1))
Q21 = -(b+(bsh/2))*V2*V2-V2*V1*(g*sin(t2-t1)-b*cos(t2-t1))

disp('P21')
disp(P21)
disp('Q21')
disp(Q21)

Perdas = P12 + P21
disp('Perdas')
disp(Perdas)
