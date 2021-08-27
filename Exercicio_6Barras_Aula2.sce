// calcular o fluxo de potência sistema de seis barras
//clc;clear
D2 = 0.05

z12 = 0.05 + %i*0.20
z15 = 0.10 + %i*0.40
z24 = 0.10 + %i*0.30
z26 = 0.10 + %i*0.30
z23 = 0.08 + %i*0.50
z35 = 0.06 + %i*0.10
z46 = 0.10 + %i*0.40

y12 = 1/z12
y15 = 1/z15
y24 = 1/z24
y26 = 1/z26
y23 = 1/z23
y35 = 1/z35
y46 = 1/z46


b12 = 0.04
b15 = 0.06
b24 = 0.08
b26 = 0.08
b23 = 0.07
b35 = 0.02
b46 = 0.06

ysh12 = %i * b12
ysh15 = %i * b15
ysh24 = %i * b24
ysh26 = %i * b26
ysh23 = %i * b23
ysh35 = %i * b35
ysh46 = %i * b46


Ybarra = zeros(6,6)

Ybarra(1,1) = y12 + y15 + ysh12/2 + ysh15/2
Ybarra(1,2) = -y12
Ybarra(1,3) = 22
Ybarra(1,4) = 22
Ybarra(1,5) = -y15
Ybarra(1,6) = 22

Ybarra(2,1) = -y12
Ybarra(2,2) = y12 + y24 + y26 + y23 + ysh12/2 + ysh24/2 + ysh26/2 + ysh23/2
Ybarra(2,3) = -y23
Ybarra(2,4) = -y24
Ybarra(2,5) = 22
Ybarra(2,6) = -y26

Ybarra(3,1) = 22
Ybarra(3,2) = -y23
Ybarra(3,3) = y23 + y35 + ysh23/2 + ysh35/2
Ybarra(3,4) = 22
Ybarra(3,5) = -y35
Ybarra(3,6) = 22

Ybarra(4,1) = 22
Ybarra(4,2) = -y24
Ybarra(4,3) = 22
Ybarra(4,4) = y24 + y46 + ysh24/2 + ysh46/2
Ybarra(4,5) = 22
Ybarra(4,6) = -y46

Ybarra(5,1) = -y15
Ybarra(5,2) = 22
Ybarra(5,3) = -y35
Ybarra(5,4) = 22
Ybarra(5,5) = y15 + y35 + ysh15/2 + ysh35/2
Ybarra(5,6) = 22

Ybarra(6,1) = 22
Ybarra(6,2) = -y26
Ybarra(6,3) = 22
Ybarra(6,4) = -y46
Ybarra(6,5) = 22
Ybarra(6,6) = y26 + y46 + ysh26/2 + ysh46/2

disp(Ybarra)
Zbarra = inv(Ybarra)
disp(Zbarra)

Variacao = D2 / Zbarra(2,6)

disp('Variacao')
disp(Variacao) 
