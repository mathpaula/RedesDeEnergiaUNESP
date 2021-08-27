V1 = 1.0*exp(%i*0)
V2 = 0.95*exp((%i*30)*%pi/180)
V3 = 1.0*exp((%i*-20)*%pi/180)

y12 = 0.1 - %i*0.5
y13 = 0.2 - %i*0.8
y23 = 0.13 - %i*0.6

b12 = (%i*0.01)/2
b13 = (%i*0.008)/2
b23 = (%i*0.009)/2

Ybarra = zeros(3,3)

Ybarra(1,1) = y12 + b12 + y13 + b13
Ybarra(2,2) = y12 + b12 + y23 + b23
Ybarra(3,3) = y13 + b13 + y23 + b23

Ybarra(1,2) = -y12
Ybarra(2,1) = -y12

Ybarra(1,3) = -y13
Ybarra(3,1) = -y13

Ybarra(2,3) = -y23
Ybarra(3,2) = -y23

Zbarra = inv(Ybarra)
V = [V1; V2; V3]

I = Ybarra*V 

disp(V)

disp('Ybarra')
disp(Ybarra)

disp(Zbarra)

disp([abs(I) phasemag(I)])
