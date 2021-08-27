//clc
//clear

V1 = 1 
V2 = 0.88
r = 0.05

Xcap = -1:0.02:0  //reatancia capacitiva
xi = 0.2 //reatancia indutiva
Bcomp = ((-1./(Xcap)) * 0.5) //susceptancia capacitiva

x = xi + Xcap //soma das reatancias indutivas e capacitivas

z = r + %i*0.2 //impedancia complexa

y = 1./z //admitancia

g = real(y) //condutancia
b = imag(y) //susceptancia
Z = sqrt((r^2 + x^2)) //raízes da impedancia

t1 = r./Z //angulo1
t2 = x./Z //angulo2

Rcos = r.*(t1) //equações de cos
Xsen = (x.*t2) //equações de sen

S = (V1^2)./(2*(Z+Rcos+Xsen)) //potência aparente
P = real(S) //parte real da potência aparente

plot2d(Bcomp,P)

xgrid(1)
title("Potência Ativa vs Bcomp")
xlabel("Bcomp")
ylabel("Potência Ativa")
