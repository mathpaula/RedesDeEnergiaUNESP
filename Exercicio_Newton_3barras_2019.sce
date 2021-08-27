//clc;

y12 = 2-%i*9
y13 = 1-%i*4
y23 = 1.5-%i*8

Ybarra = [y12+y13 -y12 -y13;
          -y12 y12+y23 -y23;
          -y13 -y23 y13+y23]

G = real(Ybarra)
B = imag(Ybarra)
disp(Ybarra)

V1 = 1.03;
V2 = 1.02;

//chute inicial
V3 = 1;
teta2 = 0;
teta3 = 0;

X = [V3;teta2;teta3]

fa = V1*V3*( G(3,1)*cos(teta3) + B(3,1)*sin(teta3) ) + V2*V3* ( G(3,2)*cos(teta3 - teta2) + B(3,2)*sin(teta3 - teta2) ) + G(3,3)*V3^2 + 1.2
fb = V1*V3*( G(3,1)*sin(teta3) - B(3,1)*cos(teta3) ) + V2*V3* ( G(3,2)*sin(teta3 - teta2) - B(3,2)*cos(teta3 - teta2) ) - B(3,3)*V3^2 + 0.5
fc = V1*V2*( G(2,1)*cos(teta2) + B(2,1)*sin(teta2) ) + V2*V3* ( G(2,3)*cos(teta2 - teta3) + B(2,3)*sin(teta2 - teta3) ) + G(2,2)*V2^2 - 0.4
F = [fa;fb;fc]

erro = max(fa,fb,fc)

erro_max = 0.0001
h = 0
while erro > erro_max
    h = h + 1
    fa = V1*V3*( G(3,1)*cos(teta3) + B(3,1)*sin(teta3) ) + V2*V3* ( G(3,2)*cos(teta3 - teta2) + B(3,2)*sin(teta3 - teta2) ) + G(3,3)*V3^2 + 1.2
    fb = V1*V3*( G(3,1)*sin(teta3) - B(3,1)*cos(teta3) ) + V2*V3* ( G(3,2)*sin(teta3 - teta2) - B(3,2)*cos(teta3 - teta2) ) - B(3,3)*V3^2 + 0.5
    fc = V1*V2*( G(2,1)*cos(teta2) + B(2,1)*sin(teta2) ) + V2*V3* ( G(2,3)*cos(teta2 - teta3) + B(2,3)*sin(teta2 - teta3) ) + G(2,2)*V2^2 - 0.4
    F = [fa;fb;fc]
    erro = max(fa,fb,fc)

    J(1,1) = V1*(G(3,1)*cos(teta3) + B(3,1)*sin(teta3)) + V2*G(3,2)*cos(teta3 - teta2) + V2*B(3,2)*sin(teta3 - teta2) + 2*G(3,3)*V3
    J(1,2) = V2*V3*(G(3,2)*sin(teta3 - teta2) - B(3,2)*cos(teta3 - teta2))
    J(1,3) = V1*V3*(-G(3,1)*sin(teta3) + B(3,1)*cos(teta3)) + V2*V3*(-G(3,2)*sin(teta3 - teta2) + B(3,2)*cos(teta3 - teta2))
    J(2,1) = V1*(G(3,1)*sin(teta3) - B(3,1)*cos(teta3)) + V2*(G(3,2)*sin(teta3 - teta2) - B(3,2)*cos(teta3 - teta2))- 2*B(3,3)*V3
    J(2,2) = V2*V3*(-G(3,2)*cos(teta3 - teta2) - B(3,2)*sin(teta3 - teta2))
    J(2,3) = V1*V3*(G(3,1)*cos(teta3) + B(3,2)*sin(teta3)) + V2*V3*(G(3,2)*cos(teta3-teta2) + B(3,2)*sin(teta3 - teta2))
    J(3,1) = V2*(G(2,3)*cos(teta2-teta3) + B(2,3)*sin(teta2-teta3))
    J(3,2) = V1*V2*(-G(2,1)*sin(teta2) + B(2,1)*cos(teta2)) + V2*V3*(-G(2,3)*sin(teta2 - teta3) + B(2,3)*cos(teta2 - teta3))
    J(3,3) = V2*V3*(G(2,3)*sin(teta2 - teta3) - B(2,3)*cos(teta2 - teta3))

    X = X - inv(J) * F
    V3 = X(1)
    teta2 = X(2)
    teta3 = X(3)
    
    disp(h)
    disp(F)
    disp(J)
    disp(inv(J))
    disp(V3)
    disp(teta2*180/%pi)
    disp(teta3*180/%pi)
//    disp(abs(F(1)))
//    disp(abs(F(2)))
    disp(erro)
end
