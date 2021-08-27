// calcular o fluxo de potência no sistema de duas barras
// usando o Método de Gauss-Seidel
//clc;clear

// Declarando as admitancias
y12 = 1 - %i*5
y13 = 2 - %i*8
y23 = 1 - %i*5

// V1 (já definida) e S2(Barra de Carga)
V1 = 1.02 * exp(%i*0)
S2 = -(1.5+%i*0.6)

// Matriz Ybarra
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

// Parte Real e Imaginária da Matriz
G = real(Ybarra)
B = imag(Ybarra)

// chute inicial da tensão na barra 2
//V2_0 = 1.00 * exp(%i*0)  // flat-start
//V3_0 = 1.01 * exp(%i*0) // assumir que o ângulo é 0
// 1a iteração
//theta1 = 0
//theta2 = phasemag(V2_0)*%pi/180
//theta3 = phasemag(V3_0)*%pi/180
//Q3 = 1.01 * ( 1.02*(G(3,1)*sin(theta3-theta1) - B(3,1)*cos(theta3-theta1)) + ...
//         abs(V2_0)*(G(3,2)*sin(theta3-theta2) - B(3,2)*cos(theta3-theta2)) + ...
//              1.01*(G(3,3)*sin(theta3-theta3) - B(3,3)*cos(theta3-theta3)) )
//S3 = 0.25 + %i*Q3
//
//V2_1 = 1/Ybarra(2,2) * ( conj(S2)/conj(V2_0) - Ybarra(2,1)*V1 - Ybarra(2,3)*V3_0)
//disp('V2')
//disp([abs(V2_1) phasemag(V2_1)])
//
//V3_1 = 1/Ybarra(3,3) * ( conj(S3)/conj(V3_0) - Ybarra(3,1)*V1 - Ybarra(3,2)*V2_1)
//disp('V3')
//disp([abs(V3_1) phasemag(V3_1)])
//
//// 2a iteração
//theta1 = 0
//theta2 = phasemag(V2_1)*%pi/180
//theta3 = phasemag(V3_1)*%pi/180
//Q3 = 1.01 * ( 1.02*(G(3,1)*sin(theta3-theta1) - B(3,1)*cos(theta3-theta1)) + ...
//         abs(V2_1)*(G(3,2)*sin(theta3-theta2) - B(3,2)*cos(theta3-theta2)) + ...
//              1.01*(G(3,3)*sin(theta3-theta3) - B(3,3)*cos(theta3-theta3)) )
//S3 = 0.25 + %i*Q3
//
//V2_2 = 1/Ybarra(2,2) * ( conj(S2)/conj(V2_1) - Ybarra(2,1)*V1 - Ybarra(2,3)*V3_1)
//disp('V2')
//disp([abs(V2_2) phasemag(V2_2)])
//
//V3_2 = 1/Ybarra(3,3) * ( conj(S3)/conj(V3_1) - Ybarra(3,1)*V1 - Ybarra(3,2)*V2_2)
//disp('V3')
//disp([abs(V3_2) phasemag(V3_2)])
//
//// 3a iteração
//theta1 = 0
//theta2 = phasemag(V2_1)*%pi/180
//theta3 = phasemag(V3_1)*%pi/180
//Q3 = 1.01 * ( 1.02*(G(3,1)*sin(theta3-theta1) - B(3,1)*cos(theta3-theta1)) + ...
//         abs(V2_2)*(G(3,2)*sin(theta3-theta2) - B(3,2)*cos(theta3-theta2)) + ...
//              1.01*(G(3,3)*sin(theta3-theta3) - B(3,3)*cos(theta3-theta3)) )
//S3 = 0.25 + %i*Q3
//
//V2_3 = 1/Ybarra(2,2) * ( conj(S2)/conj(V2_2) - Ybarra(2,1)*V1 - Ybarra(2,3)*V3_2)
//disp('V2')
//disp([abs(V2_3) phasemag(V2_3)])
//
//V3_3 = 1/Ybarra(3,3) * ( conj(S3)/conj(V3_2) - Ybarra(3,1)*V1 - Ybarra(3,2)*V2_3)
//disp('V3')
//disp([abs(V3_3) phasemag(V3_3)])


V2 = 1.00 * exp(%i*0)  // flat-start (Barra de Carga Chute)
V3 = 1.01 * exp(%i*0) // assumir que o ângulo é 0 (Barra PV)
for h = 1 : 10
    disp(h)

    theta1 = 0
    theta2 = phasemag(V2)*%pi/180
    theta3 = phasemag(V3)*%pi/180
    Q3 = 1.01 * (    1.02*(G(3,1)*sin(theta3-theta1) - B(3,1)*cos(theta3-theta1)) + ...
                  abs(V2)*(G(3,2)*sin(theta3-theta2) - B(3,2)*cos(theta3-theta2)) + ...
                     1.01*(G(3,3)*sin(theta3-theta3) - B(3,3)*cos(theta3-theta3)) )
    S3 = 0.25 + %i*Q3
    
    V2 = 1/Ybarra(2,2) * ( conj(S2)/conj(V2) - Ybarra(2,1)*V1 - Ybarra(2,3)*V3 )

    V3 = 1/Ybarra(3,3) * ( conj(S3)/conj(V3) - Ybarra(3,1)*V1 - Ybarra(3,2)*V2 )

    disp('V2')
    disp([abs(V2) phasemag(V2)])
    disp('V3')
    disp([abs(V3) phasemag(V3)])
    disp(Q3)
end


theta1 = 0
theta2 = phasemag(V2)*%pi/180
theta3 = phasemag(V3)*%pi/180
P1 =  1.02 * (    1.02*(G(1,1)*cos(theta1-theta1) + B(1,1)*sin(theta1-theta1)) + ...
               abs(V2)*(G(1,2)*cos(theta1-theta2) + B(1,2)*sin(theta1-theta2)) + ...
                  1.01*(G(1,3)*cos(theta1-theta3) + B(1,3)*sin(theta1-theta3)) )

Q1 =  1.02 * (    1.02*(G(1,1)*sin(theta1-theta1) - B(1,1)*cos(theta1-theta1)) + ...
               abs(V2)*(G(1,2)*sin(theta1-theta2) - B(1,2)*cos(theta1-theta2)) + ...
                  1.01*(G(1,3)*sin(theta1-theta3) - B(1,3)*cos(theta1-theta3)) )
Q3 = 1.01 * (    1.02*(G(3,1)*sin(theta3-theta1) - B(3,1)*cos(theta3-theta1)) + ...
                  abs(V2)*(G(3,2)*sin(theta3-theta2) - B(3,2)*cos(theta3-theta2)) + ...
                     1.01*(G(3,3)*sin(theta3-theta3) - B(3,3)*cos(theta3-theta3)) )
disp(P1)
disp(Q1)
