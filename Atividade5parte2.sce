// Declarando as Variáveis
y12 = 2 - %i*8
y13 = 1 - %i*5
y23 = 1 - %i*5

V1 = 1.02 
V2 = 1.01 
V3 = 0.9090 

theta1 = 0
theta2 = -2.73 * %pi/180
theta3 = -9.62 * %pi/180

// Declarando YBarra
Ybarra = zeros(3,3)

Ybarra(1,1) = y12 + y13
Ybarra(2,2) = y12 + y23
Ybarra(3,3) = y13 + y23

Ybarra(1,2) = y12
Ybarra(2,1) = y12

Ybarra(1,3) = y13
Ybarra(3,1) = y13

Ybarra(2,3) = y23
Ybarra(3,2) = y23

g = real(Ybarra)
b = imag(Ybarra)

// P12, Q12 e S12
P12 = (g(1,2)*(V1^2))  -( (V1*V2) * (g(1,2)*cos(theta1-theta2)+b(1,2)*sin(theta1-theta2)) )
Q12 = -(b(1,2)*(V1^2)) -( (V1*V2) * (g(1,2)*sin(theta1-theta2)-b(1,2)*cos(theta1-theta2)) )
S12 = P12 + %i*Q12

// P12, Q12 e S12
P21 = (g(2,1)*(V2^2)) -( (V2*V1) * (g(2,1)*cos(theta2-theta1)+b(2,1)*sin(theta2-theta1)) )
Q21 = -(b(2,1)*(V2^2))-( (V2*V1) * (g(2,1)*sin(theta2-theta1)-b(2,1)*cos(theta2-theta1)) )
S21 = P21 + %i*Q21

// P13, Q13 e S13
P13 = (g(1,3)*(V1^2)) -( (V1*V3)* (g(1,3)*cos(theta1-theta3)+b(1,3)*sin(theta1-theta3)) )
Q13 = -(b(1,3)*(V1^2))-( (V1*V3) *(g(1,3)*sin(theta1-theta3)-b(1,3)*cos(theta1-theta3)) )
S13 = P13 + %i*Q13

// P31, Q31 e S31
P31 = (g(3,1)*(V3^2)) - ( (V3*V1)* (g(3,1)*cos(theta3-theta1)+b(3,1)*sin(theta3-theta1)) )
Q31 = -(b(3,1)*(V3^2))- ( (V3*V1)* (g(3,1)*sin(theta3-theta1)-b(3,1)*cos(theta3-theta1)) )
S31 = P31 + %i*Q31

// P23, Q23 e S23
P23 = (g(2,3)*(V2^2)) - ( (V2*V3)* (g(2,3)*cos(theta2-theta3)+b(2,3)*sin(theta2-theta3)) )
Q23 = -(b(2,3)*(V2^2))- ( (V2*V3)* (g(2,3)*sin(theta2-theta3)-b(2,3)*cos(theta2-theta3)) )
S23 = P23 + %i*Q23

// P32, Q32, S32
P32 = (g(3,2)*(V3^2)) - ( (V3*V2) * (g(3,2)*cos(theta3-theta2)+b(3,2)*sin(theta3-theta2)) )
Q32 = -(b(3,2)*(V3^2))- ( (V3*V2) * (g(3,2)*sin(theta3-theta2)-b(3,2)*cos(theta3-theta2)) )
S32 = P32 + %i*Q32

//disp('S12          S21          P3')

disp('S12')
//disp([P12 Q12])
disp(S12)

disp('S21')
//disp([P21 Q21])
disp(S21)

disp('S13')
//disp([P13 Q13])
disp(S13)

disp('S31')
//disp([P31 Q31])
disp(S31)


disp('S23')
//disp([P23 Q23])
disp(S23)

disp('S32')
//disp([P32 Q32])
disp(S32)
