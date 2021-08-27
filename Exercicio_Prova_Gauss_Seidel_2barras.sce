V1 = 1.01 * exp(%i*0)
S2 = -(1+%i*0.4)

// admitância série da linha, diferente de Ybarra
y = %i*-10 

Ybarra = zeros(2,2)
Ybarra(1,1) = y 
Ybarra(2,2) = y 
Ybarra(1,2) = -y
Ybarra(2,1) = -y

// Parte real e Imaginaria
G = real(Ybarra)
B = imag(Ybarra)

// 1º passo - Definição do chute inicial da tensão na barra 2
V2_0 = 1 * exp(%i*0)  // flat-start

// Definindo parametros
epsilon = 0.0001
V2 = V2_0
erro = 1
h = 0

// Loop
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

































