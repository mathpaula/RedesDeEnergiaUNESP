// calcular o fluxo de potência no sistema de duas barras
// usando o Método de Gauss-Seidel
//clc;clear

// Impedancia e Bsh
z = 0.05 + %i*0.2
bsh = 0.1

// V1 e S2
V1 = 1 * exp(%i*0)
S2 = -(0.8+%i*0.2)

// Admitância Série da Linha diferente de Ybarra
y = 1 / z  
ysh = %i * bsh

// Ybarra
Ybarra = zeros(2,2)
Ybarra(1,1) = y + ysh/2
Ybarra(2,2) = y + ysh/2
Ybarra(1,2) = -y
Ybarra(2,1) = -y

// 1º passo - Definiçaõ do chute inicial da tensão na barra 2
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
    // V2cal iterando
    V2cal = 1/Ybarra(2,2) * ( conj(S2)/conj(V2) - Ybarra(2,1)*V1 )
    // Diferença do novo valor calculado e V2
    erro = abs(V2cal - V2)
    // Último valor calculado
    V2 = V2cal
    disp([h abs(V2) phasemag(V2) erro])
end


