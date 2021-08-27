// calcular o fluxo de potência no sistema de duas barras
// usando o Método de Gauss-Seidel
//clc;clear

// Impedância da Linha e Bsh
z = 0.05 + %i*0.1
bsh = 0.06

// V1
V1 = 1.01 * exp(%i*0)

// Potência Aparente (Valor já dado)
S2 = -(1.2+%i*0.3)

// Admitância Série da Linha (Diferente de Ybarra)
y = 1 / z  
ysh = %i * bsh

// Matriz Ybarra
Ybarra = zeros(2,2)
Ybarra(1,1) = y + ysh/2
Ybarra(2,2) = y + ysh/2
Ybarra(1,2) = -y
Ybarra(2,1) = -y

// Parte Real e Imaginária da Matriz
G = real(Ybarra)
B = imag(Ybarra)

// chute inicial da tensão na barra 2
V2_0 = 1 * exp(%i*0)  // flat-start

//V2_1 = 1/Ybarra(2,2) * ( conj(S2)/conj(V2_0) - Ybarra(2,1)*V1 )
//disp([abs(V2_1) phasemag(V2_1)])
//
//V2_2 = 1/Ybarra(2,2) * ( conj(S2)/conj(V2_1) - Ybarra(2,1)*V1 )
//disp([abs(V2_2) phasemag(V2_2)])
//
//V2_3 = 1/Ybarra(2,2) * ( conj(S2)/conj(V2_2) - Ybarra(2,1)*V1 )
//disp([abs(V2_3) phasemag(V2_3)])

epsilon = 0.0001
V2 = V2_0
erro = 1
h = 0

while erro > epsilon
    h = h + 1
    V2cal = 1/Ybarra(2,2) * ( conj(S2)/conj(V2) - Ybarra(2,1)*V1 )
    erro = abs(V2cal - V2)
    V2 = V2cal
    disp([h abs(V2) phasemag(V2) erro])
end

// Definindo o Theta 2 e o Y12
theta2 = -6.66*%pi/180

// y12 como y para usar na formula do SG
y12 = y

// Partes Reais e Imaginárias para usar em P12, Q12, ...
g12 = real(y12)
b12 = imag(y12) 
g21 = real(y12) 
b21 = imag(y12) 

// P12, Q12 e S12
P12 = (g12*(1.01^2)-((1.01*0.9066489)*(g12*cos(0-theta2)+b12*sin(0-theta2))))
Q12 = (-b12*(1.01^2)-((1.01*0.9066489)*(g12*sin(0-theta2)-b12*cos(0-theta2))))
    disp('P12')
    disp(P12)
    
    disp('Q12')
    disp(Q12)
    
S12 = P12 + %i*Q12
    disp('S12')
    disp(S12)

//P21, Q21 e S21
P21 = (g21*(0.9066489 ^2)-((0.9066489 *1.01)*(g21*cos(theta2-0)+b21*sin(theta2-0))))
Q21 = (-b21*(0.9066489 ^2)-((0.9066489 *1.01)*(g21*sin(theta2-0)-b21*cos(theta2-0))))

    disp('P21')
    disp(P21)
    
    disp('Q21')
    disp(Q21)
    
S21 = P21 + %i*Q21

    disp('S21')
    disp(S21)

// SG - Slide 2
Sg  = V1*conj((y*(V1-V2))+((ysh/2)*V2))

disp('SG')
disp(Sg)

// Perdas SG + S2
Perdas = Sg + S2
disp('Perdas')
disp(Perdas)






