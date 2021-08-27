R = 0.05
X = 0.2
Vg = 1
Rc = 0:0.001:50
Xc = 0.25*Rc
Pc =((Vg^2)*Rc)./((R+Rc)^2 + (X+Xc)^2)

disp(max(Pc))

xgrid(1)
xlabel('Resistência [pu]')
ylabel('Potência Ativa [pu]')
title('Potência Ativa vs Resistência')
plot2d(Rc,Pc,logflag = 'ln')
