// calcular o fluxo de potência no sistema de duas barras
// usando o Método de Newton
//clc;clear
y12 = 1 + %i*(-5)
y13 = 2 - %i*8
y23 = 1 - %i*5

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

G = real(Ybarra)
B = imag(Ybarra)

J = zeros(3,3)

V1 = 1.02
t1 = 0
V3 = 1.01

P3 = 0.25
// chutes iniciais
V2 = 1; t2 = 0; t3 = 0

for h = 1 : 4
    disp("Iter.")
    disp(h)
    f1 = V2*V1*(G(2,1)*cos(t2-t1)+B(2,1)*sin(t2-t1)) + V2^2*G(2,2) + ...
    V2*V3*(G(2,3)*cos(t2-t3)+B(2,3)*sin(t2-t3)) + 1.5

    f2 = V3*V1*(G(3,1)*cos(t3-t1)+B(3,1)*sin(t3-t1)) + ...
    V3*V2*(G(3,2)*cos(t3-t2)+B(3,2)*sin(t3-t2)) + V3^2*G(3,3) - P3

    f3 = V2*V1*(G(2,1)*sin(t2-t1)-B(2,1)*cos(t2-t1)) - V2^2*B(2,2) + ...
    V2*V3*(G(2,3)*sin(t2-t3)-B(2,3)*cos(t2-t3)) + 0.6

    X = [V2;t2;t3]
    F = [f1;f2;f3]

    J(1,1) = V1*(G(2,1)*cos(t2-t1)+B(2,1)*sin(t2-t1)) + 2*V2*G(2,2) + ...
    V3*(G(2,3)*cos(t2-t3)+B(2,3)*sin(t2-t3))

    J(1,2) = V2*V1*(-G(2,1)*sin(t2-t1)+B(2,1)*cos(t2-t1)) + ...
    V2*V3*(-G(2,3)*sin(t2-t3)+B(2,3)*cos(t2-t3))

    J(1,3) = V2*V3*(+G(2,3)*sin(t2-t3)-B(2,3)*cos(t2-t3))

    J(2,1) = V3*(G(3,2)*cos(t3-t2)+B(3,2)*sin(t3-t2))

    J(2,2) = V3*V2*(+G(3,2)*sin(t3-t2)-B(3,2)*cos(t3-t2))

    J(2,3) = V3*V1*(-G(3,1)*sin(t3-t1)+B(3,1)*cos(t3-t1)) + ...
    V3*V2*(-G(3,2)*sin(t3-t2)+B(3,2)*cos(t3-t2))

    J(3,1) = V1*(G(2,1)*sin(t2-t1)-B(2,1)*cos(t2-t1)) - 2*V2*B(2,2) + ...
    V3*(G(2,3)*sin(t2-t3)-B(2,3)*cos(t2-t3))

    J(3,2) = V2*V1*(G(2,1)*cos(t2-t1)+B(2,1)*sin(t2-t1)) + ...
    V2*V3*(G(2,3)*cos(t2-t3)+B(2,3)*sin(t2-t3))

    J(3,3) = V2*V3*(-G(2,3)*cos(t2-t3)-B(2,3)*sin(t2-t3))

    disp(X)
    disp(F)
    disp(J)

    X = X - inv(J)*F
    V2 = X(1)
    t2 = X(2)
    t3 = X(3)   //ângulo em radianos

    disp("V2");disp(V2)
    disp("t2");disp(t2*180/%pi)
    disp("t3");disp(t3*180/%pi)
end

Q3 = V3* ( V1*(G(3,1)*sin(t3-t1)-B(3,1)*cos(t3-t1)) + ...
           V2*(G(3,2)*sin(t3-t2)-B(3,2)*cos(t3-t2))+ ...
           V3*(G(3,3)*sin(t3-t3)-B(3,3)*cos(t3-t3)) )
disp("Q3");disp(Q3)

Q1 = V1* ( V1*(G(1,1)*sin(t1-t1)-B(1,1)*cos(t1-t1)) + ...
           V2*(G(1,2)*sin(t1-t2)-B(1,2)*cos(t1-t2))+ ...
           V3*(G(1,3)*sin(t1-t3)-B(1,3)*cos(t1-t3)) )
disp("Q1");disp(Q1)

P1 = V1* ( V1*(G(1,1)*cos(t1-t1)+B(1,1)*sin(t1-t1)) + ...
           V2*(G(1,2)*cos(t1-t2)+B(1,2)*sin(t1-t2))+ ...
           V3*(G(1,3)*cos(t1-t3)+B(1,3)*sin(t1-t3)) )
disp("P1");disp(P1)


g12 = real(y12)
b12 = imag(y12)
P12 = g12 * V1^2 - V1*V2*( g12*cos(t1-t2) + b12*sin(t1-t2))
disp("P12")
disp(P12)
P21 = g12 * V2^2 - V2*V1*( g12*cos(t2-t1) + b12*sin(t2-t1))
disp("P21")
disp(P21)

g13 = real(y13)
b13 = imag(y13)
P13 = g13 * V1^2 - V1*V3*( g13*cos(t1-t3) + b13*sin(t1-t3))
disp("P13")
disp(P13)
P31 = g13 * V3^2 - V3*V1*( g13*cos(t3-t1) + b13*sin(t3-t1))
disp("P31")
disp(P31)

g23 = real(y23)
b23 = imag(y23)
P23 = g23 * V2^2 - V2*V3*( g23*cos(t2-t3) + b23*sin(t2-t3))
disp("P23")
disp(P23)
P32 = g23 * V3^2 - V3*V2*( g23*cos(t3-t2) + b23*sin(t3-t2))
disp("P32")
disp(P32)


Perdas_nas_linhas = (P12+P21) + (P13+P31) + (P23+P32)
disp("Perdas_nas_linhas")
disp(Perdas_nas_linhas)

Ptotal_gerada = P1 + 0.25
disp("Ptotal_gerada")
disp(Ptotal_gerada)
Ptotal_carga = 1.5
disp("Ptotal_carga")
disp(Ptotal_carga)
