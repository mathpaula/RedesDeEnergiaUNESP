// calcular a injeção de potência no sistema de duas barras
// usando os parâmetros da linha e a informação das tensões
//clc;clear
z = 0.05 + %i*0.2
bsh = 0.1

V1 = 1
V2 = 0.9067
theta1 = 0
theta2 = -9.63 * %pi/180


y = 1 / z  // admitância série da linha, diferente de Ybarra
ysh = %i * bsh

Ybarra = zeros(2,2)
Ybarra(1,1) = y + ysh/2
Ybarra(2,2) = y + ysh/2
Ybarra(1,2) = -y
Ybarra(2,1) = -y

G = real(Ybarra)
B = imag(Ybarra)

P1 = V1 * ( V1*( G(1,1)*cos(theta1-theta1)+B(1,1)*sin(theta1-theta1) ) ...
          + V2*( G(1,2)*cos(theta1-theta2)+B(1,2)*sin(theta1-theta2) ) ) 
          
P2 = V2 * ( V1*( G(2,1)*cos(theta2-theta1)+B(2,1)*sin(theta2-theta1) ) ...
          + V2*( G(2,2)*cos(theta2-theta2)+B(2,2)*sin(theta2-theta2) ) ) 


Q1 = V1 * ( V1*( G(1,1)*sin(theta1-theta1)-B(1,1)*cos(theta1-theta1) ) ...
          + V2*( G(1,2)*sin(theta1-theta2)-B(1,2)*cos(theta1-theta2) ) ) 
          
Q2 = V2 * ( V1*( G(2,1)*sin(theta2-theta1)-B(2,1)*cos(theta2-theta1) ) ...
          + V2*( G(2,2)*sin(theta2-theta2)-B(2,2)*cos(theta2-theta2) ) ) 

disp(P1)
disp(P2)
disp(Q1)
disp(Q2)
