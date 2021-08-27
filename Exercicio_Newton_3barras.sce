// Exercicio Newton 3 Barras

// Admitancias
y12 = 2 - %i*9
y13 = 1 - %i*4
y23 = 1.5 - %i*8

// Ybarra
Ybarra = zeros(3,3)
Ybarra(1,1) = y12 + y13
Ybarra(2,2) = y12 + y23
Ybarra(3,3) = y13 + y23

Ybarra(1,2) = -y12
Ybarra(2,1) = -y12

Ybarra(1,3) = -y13
Ybarra(3,1) = -y13

Ybarra(2,3) = -y23
Ybarra(3,2) = -y23

// Parte real e imaginaria
G = real(Ybarra)
B = imag(Ybarra)

//Jacobiana de zeros
J = zeros(3,3)

// V1 theta1 e V3
V1 = 1.03
t1 = 0
V2 = 1.02

// Potencia gerada
P2 = 0.4

// Chutes iniciais
V3 = 1; t3 = 0; t2 = 0

for h = 1 : 10
    disp("Iter.")
    disp(h)
    f1 = V3*V1*(G(3,1)*cos(t3-t1) + B(3,1)*sin(t3-t1)) + ...
         V3*V2*(G(3,2)*cos(t3-t2) + B(3,2)*sin(t3-t2)) + ...
         V3^2*G(3,3) + 1.2

    f2 = V2*V1*(G(2,1)*cos(t2-t1) + B(2,1)*sin(t2-t1)) + ...
         V2^2*G(2,2) +  ...
         V2*V3*(G(2,3)*cos(t2-t1) + B(2,3)*sin(t2-t1)) - 0.4

    f3 = V3*V1*(G(3,1)*sin(t3-t1) - B(3,1)*cos(t3-t1)) + ...
         V3*V2*(G(3,2)*sin(t3-t2) - B(3,2)*cos(t3-t2)) + ...
         V3^2*(-B(3,3)) + 0.5

    X = [V3;t3;t2]
    F = [f1;f2;f3]
    
    // Em relacao a F1
    J(1,1) = V1*(G(3,1)*cos(t3-t1)+B(3,1)*sin(t3-t1)) + ...
             V2*(G(3,2)*cos(t3-t2)+B(3,2)*sin(t3-t2)) + ...
             2*V3*(G(3,3))

    J(1,2) = V3*V1*(-G(3,1)*sin(t3-t1)+B(3,1)*cos(t3-t1)) + ...
             V3*V2*(-G(3,2)*sin(t3-t2)+B(3,2)*cos(t3-t2))

    J(1,3) = V3*V1*(G(3,2)*sin(t3-t2)-B(3,2)*cos(t3-t2))

    // Em relacao a f2
    J(2,1) = V2*(G(2,3)*cos(t2-t3)+B(2,3)*sin(t2-t3))
    
    J(2,2) = V2*V3*(G(2,3)*sin(t2-t3)-B(2,3)*cos(t2-t3))

    J(2,3) = V2*V1*(-G(2,1)*sin(t2-t1)+B(2,1)*cos(t2-t1)) + ...
             V2*V3*(-G(2,3)*sin(t2-t3)+B(2,3)*cos(t2-t3))

    // Em relacao a f3
    J(3,1) = V1*(G(3,1)*sin(t3-t1)-B(3,1)*cos(t3-t1)) + ...
             V2*(G(3,2)*sin(t3-t2)-B(3,2)*cos(t3-t2)) + ...
             2*V3*(-B(3,3))
    
    J(3,2) = V3*V1*(G(3,1)*cos(t3-t1)+B(3,1)*sin(t3-t1)) + ...
             V3*V2*(G(3,2)*cos(t3-t2)+B(3,2)*sin(t3-t2))

    J(3,3) = V3*V1*(-G(3,2)*cos(t3-t2)-B(3,2)*sin(t3-t2))

    disp(X)
    disp(F)
    disp(J)

    X = X - inv(J)*F
    V3 = X(1)
    t3 = X(2)
    t2 = X(3)   //ângulo em radianos

    disp("V3");disp(V3)
    disp("t3");disp(t3*180/%pi)
    disp("t2");disp(t2*180/%pi)
end



Q2 = V2* ( V1*(G(2,1)*sin(t3-t1)-B(2,1)*cos(t3-t1)) + ...
           V2*(G(2,2)*sin(t3-t2)-B(2,2)*cos(t3-t2))+ ...
           V3*(G(2,3)*sin(t3-t3)-B(2,3)*cos(t3-t3)) )
disp("Q3");disp(Q3)

Q1 = V1* ( V1*(G(1,1)*sin(t1-t1)-B(1,1)*cos(t1-t1)) + ...
           V2*(G(1,2)*sin(t1-t2)-B(1,2)*cos(t1-t2))+ ...
           V3*(G(1,3)*sin(t1-t3)-B(1,3)*cos(t1-t3)) )
disp("Q1");disp(Q1)

P1 = V1* ( V1*(G(1,1)*cos(t1-t1)+B(1,1)*sin(t1-t1)) + ...
           V2*(G(1,2)*cos(t1-t2)+B(1,2)*sin(t1-t2))+ ...
           V3*(G(1,3)*cos(t1-t3)+B(1,3)*sin(t1-t3)) )
disp("P1");disp(P1)























