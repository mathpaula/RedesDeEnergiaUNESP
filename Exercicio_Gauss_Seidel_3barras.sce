// Metódo de Gauss Seidel Exercicio

// Definindo as variáveis

// Declarando as admitâncias
y12 = 2 - %i*9
y13 = 1 - %i*4
y23 = 1.5 - %i*8

// Impedâncias
z12 = 1/y12
z13 = 1/y13
z23 = 1/y23

// Tensão 1 e S3 (NESSE CASO A BARRA DE CARGA ESTÁ EM 3)
V1 = 1.03 * exp(%i*0)
S3 = -(1.2+%i*0.5)

// Definindo a Matriz YBarra
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

// Parte real e imaginária da matriz
G = real(Ybarra)
B = imag(Ybarra)

// PASSO 1 - DEFININDO O CHUTE INICIAL DAS BARRAS
V2 = 1.02 * exp(%i*0)  // Assumir que o ângulo é 0 - BARRA PV -> VALOR DADO (
V3 = 1.00 * exp(%i*0) // flat-start - BARRA DE CARGA (CHUTE DE 1) -> QUER DESCOBRIR

// ITERANDO COM UM LAÇO 15 VEZES
for h = 1 : 15
    disp(h)

    theta1 = 0
    theta2 = phasemag(V2)*%pi/180
    theta3 = phasemag(V3)*%pi/180
    
    // Passo 2 - Achar o reativo da barra PV
    Q2 = 1.02 * (    1.03*(G(2,1)*sin(theta2-theta1) - B(2,1)*cos(theta2-theta1)) + ...
                     1.02*(G(2,2)*sin(theta2-theta2) - B(2,2)*cos(theta2-theta2)) + ...
                     abs(V3)*(G(2,3)*sin(theta2-theta3) - B(2,3)*cos(theta2-theta3)) )
                     
    S2 = 0.4 + %i*Q2
    
    // Interando V2
    V2 = 1/Ybarra(2,2) * ( conj(S2)/conj(V2) - Ybarra(2,1)*V1 - Ybarra(2,3)*V3 )
    
    V3 = 1/Ybarra(3,3) * ( conj(S3)/conj(V3) - Ybarra(3,1)*V1 - Ybarra(3,2)*V2 )

    disp('V2')
    disp([abs(V2) phasemag(V2)])
    
    disp('V3')
    disp([abs(V3) phasemag(V3)])
    
   //disp(Q3)
    
end

// Definindo Valores encontrados

// Angulos
th1 =  0 * %pi/180
th2 = -1.8030 * %pi/180
th3 = -6.3207 * %pi/180 

// Tensoes
V2calc =  1.02
V3calc = 0.9560

// P1 E Q1 
P1 = 1.03 * ( 1.03 * ( G(1,1)*cos(th1-th1)+B(1,1)*sin(th1-th1) ) ...
 + 1.02 *( G(1,2)*cos(th1-th2)+B(1,2)*sin(th1-th2) ) ...
 + 0.9560 *( G(1,3)*cos(th1-th3)+B(1,3)*sin(th1-th3) ) )


Q1 = 1.03 * ( 1.03 * (G(1,1)*sin(th1-th1)-B(1,1)*cos(th1-th1) ) ...
 + 1.02 *( G(1,2)*sin(th1-th2)-B(1,2)*cos(th1-th2) ) ...
 + 0.9560 *( G(1,3)*sin(th1-th3)-B(1,3)*cos(th1-th3) ) )

disp('P1')
disp([abs(P1)])
disp('Q1')
disp([abs(Q1)])

// P3 E Q3
P3 = 0.9560 * (1.03 * ( G(3,1)*cos(th3-th1)+B(3,1)*sin(th3-th1) ) ...
 + 1.02 * ( G(3,2)*cos(th3-th2)+B(3,2)*sin(th3-th2) ) ...
 + 0.9560 * ( G(3,3)*cos(th3-th3)+B(3,3)*sin(th3-th3) ) )

Q3 = 0.9560 * (1.03 * ( G(3,1)*sin(th3-th1)-B(3,1)*cos(th3-th1) ) ...
 + 1.02 * ( G(3,2)*sin(th3-th2)-B(3,2)*cos(th3-th2) ) ...
 + 0.9560 * ( G(3,3)*sin(th3-th3)-B(3,3)*cos(th3-th3) ) )
 
disp('P3')
disp([abs(P3)])

disp('Q3')
disp([abs(Q3)])

//ACHANDO S2
disp('Potencia complexa Barra 2')
disp(S2)




















