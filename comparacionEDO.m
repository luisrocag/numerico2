funEDO=@(x,t) 1./(t.^2 + x.^2);
a=0;b=2;
xa=1;h=0.1;
solEuler = edoEuler(funEDO,a,xa,b,h);
solHeun  = edoHeun(funEDO,a,xa,b,h);
plot(solEuler,'-or;Euler;',solHeun,'-xb;Heun;');
title('Metodo Euler Vs Heun');
xlabel('X');
ylabel('Y');
%print -dpng figEulerHeun.png
