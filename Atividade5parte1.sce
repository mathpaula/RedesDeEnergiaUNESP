//Declarando as Variáveis
y12 = 2 - %i*8
y13 = 1 - %i*5
y23 = 1 - %i*5

V1 = 1.02
V2 = 1.01
V3 = 0.9090

theta1 = 0
theta2 = -2.73* %pi/180 
theta3 = -9.62* %pi/180

// Fazendo a Matriz Ybarra
Ybarra = zeros(3,3)

Ybarra(1,1) = y12+y13
Ybarra(2,2) = y12+y23
Ybarra(3,3) = y13+y23

Ybarra(1,2) = -y12
Ybarra(1,3) = -y13

Ybarra(2,1) = -y12
Ybarra(2,3) = -y23

Ybarra(3,1) = -y13
Ybarra(3,2) = -y23

G = real(Ybarra)
B = imag(Ybarra)

// Encontrando os Valores de P1 e Q1
P1 = V1 * ( V1*( G(1,1)*cos(theta1-theta1)+B(1,1)*sin(theta1-theta1) ) ...
          + V2*( G(1,2)*cos(theta1-theta2)+B(1,2)*sin(theta1-theta2) ) ...
          + V3*( G(1,3)*cos(theta1-theta3)+B(1,3)*sin(theta1-theta3) ) )
          
Q1 = V1 * ( V1*( G(1,1)*sin(theta1-theta1)-B(1,1)*cos(theta1-theta1) ) ...
          + V2*( G(1,2)*sin(theta1-theta2)-B(1,2)*cos(theta1-theta2) ) ...
          + V3*(G(1,3)*sin(theta1-theta3)-B(1,3)*cos(theta1-theta3)  ) )
          
// Encontrando os Valores de P2 e Q2
P2 = V2 * ( V1*( G(2,1)*cos(theta2-theta1)+B(2,1)*sin(theta2-theta1) ) ...
          + V2*( G(2,2)*cos(theta2-theta2)+B(2,2)*sin(theta2-theta2) ) ...
          + V3*( G(2,3)*cos(theta2-theta3)+B(2,3)*sin(theta2-theta3) ) )
          
Q2 = V2 * ( V1*( G(2,1)*sin(theta2-theta1)-B(2,1)*cos(theta2-theta1) ) ...
          + V2*( G(2,2)*sin(theta2-theta2)-B(2,2)*cos(theta2-theta2) ) ...
          + V3*( G(2,3)*sin(theta2-theta3)-B(2,3)*cos(theta2-theta3)  ) )
          
// Encontrando os Valores de P3 e Q3
P3 = V3 * ( V1*( G(3,1)*cos(theta3-theta1)+B(3,1)*sin(theta3-theta1) ) ...
          + V2*( G(3,2)*cos(theta3-theta2)+B(3,2)*sin(theta3-theta2) ) ...
          + V3*( G(3,3)*cos(theta3-theta3)+B(3,3)*sin(theta3-theta3) ) )
          
Q3 = V3 * ( V1*( G(3,1)*sin(theta3-theta1)-B(3,1)*cos(theta3-theta1) ) ...
          + V2*( G(3,2)*sin(theta3-theta2)-B(3,2)*cos(theta3-theta2) ) ...
          + V3*(G(3,3)*sin(theta3-theta3)-B(3,3)*cos(theta3-theta3)  ) )

//Observando os valores          
disp(P1)
disp(Q1)

disp(P2)
disp(Q2)

disp(P3)
disp(Q3)
