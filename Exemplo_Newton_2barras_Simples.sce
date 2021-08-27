//clc; clear;

// Declarando as variaveis
V1 = 1
t1 = 0
X = [V1;t1]  // X inicial

// F1 e F2 (P1 e Q1 equações de potencia injetada na barra)
f1 = 10.1*V1*sin(t1) + 1
f2 = 10*V1^2-10.1*V1*cos(t1)+0.25

// Critério epsilon de parada
epsilon = 0.0001

h = 0
// Loop considerando o critério 6 do método
while (f1 > epsilon) | (f2 > epsilon)
    h = h + 1
    // F1 e F2 interando
    f1 = 10.1*V1*sin(t1) + 1
    f2 = 10*V1^2-10.1*V1*cos(t1)+0.25
    
    // Matriz Jacobiana
    J = [10.1*sin(t1)         10.1*V1*cos(t1) ; ...
    20*V1-10.1*cos(t1)   10.1*V1*sin(t1)]
    
    // Interando X com a formulação de Newton-Rapson
    X = X - inv(J)*[f1 ; f2]
    V1 = X(1)
    t1 = X(2)
    
    disp("Iteração")
    disp(h)
    disp([V1 t1])
    disp("erro")
    disp([f1 f2])
end

// P1 e Q1
P1 = 10.1*V1*sin(t1)
Q1 = 10*V1^2-10.1*V1*cos(t1)
disp(P1)
disp(Q1)


