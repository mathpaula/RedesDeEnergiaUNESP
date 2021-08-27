///clc;clear

// Impedância da Linha
z = 0.05 + %i*0.2
bsh = 0.1

y = 1 / z  // admitância série da linha, diferente de Ybarra
ysh = %i * bsh

// Declarando a Y barra
Ybarra = zeros(2,2)
Ybarra(1,1) = y + ysh/2
Ybarra(2,2) = y + ysh/2
Ybarra(1,2) = -y
Ybarra(2,1) = -y

// Parte real e Imaginaria de YBarra
G = real(Ybarra)
B = imag(Ybarra)

J = zeros(2,2) // matriz Jacobiana
V1 = 1
t1 = 0  // radianos

// Chutes iniciais para V2 e Theta 2
V2 = 1 // 1pu
t2 = 0 // 0 radianos

// X que será utilizado para a atualização
X = [V2;t2]

// Loop para interar
for h = 1 : 5
    
    // Duas funções utilizando a equação de injeção da barra Vk e Qk, porém deixando em função de V2 e theta 2
    // Foi retirado uma parte da expressão pois o sen de 0 iria zerar a expressão no Caso -> V2*V1(B22*sin*(theta2-theta2))para f1 e V2(G22*sin(theta2-theta2) para f2
    f1 = V2*( V1*(G(2,1) * cos(t2-t1) + B(2,1)*sin(t2-t1)) + V2*G(2,2)) + 0.8
    f2 = V2*( V1*(G(2,1) * sin(t2-t1) - B(2,1)*cos(t2-t1)) - V2*B(2,2)) + 0.2
    
    // Armazenando os vetores em uma F
    F = [f1;f2]
    
    // Cada uma das derivadas calculadas
    J(1,1) = V1*(G(2,1) * cos(t2-t1) + B(2,1)*sin(t2-t1)) + 2*V2*G(2,2) 
    J(1,2) = V2*( V1*(-G(2,1) * sin(t2-t1) + B(2,1)*cos(t2-t1)) )
    J(2,1) = V1*(G(2,1) * sin(t2-t1) - B(2,1)*cos(t2-t1)) - 2*V2*B(2,2)
    J(2,2) = V2*( V1*(G(2,1) * cos(t2-t1) + B(2,1)*sin(t2-t1)) )
    
    //Newton Raphson
    X = X - inv(J) * F
    
    // Atualização das Variáveis
    V2 = X(1) 
    t2 = X(2)

    disp("Iter")
    disp(h)
    disp(X)
    disp(F)
end


