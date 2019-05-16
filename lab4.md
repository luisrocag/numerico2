## Problema 8
~~~~
int_trapecio=0

y(1) = 250;
y(2) = y(1) + h*( 1.3*y(1)-0.25*y(1)^2 );
for i=2:n-1
    int_trapecio = int_trapecio + h/2*( y(i-1) + y(i) )
    y(i+1) = y(i) + h*( 1.3*y(i)-0.24*y(i)^2 - 0.0001*y(i)*int_trapecio);
end
~~~~

## Metodos multipaso

Archivo edoPredCor.m

~~~~
function z=edoPredCor(f,a,ya,b,h)
t=a:h:b;
z=zeros(size(t));
z(1)=ya;
for i=1:3 % calcula x1,x2,x3
    F1= h*f(z(i),t(i));
    F2= h*f(z(i)+0.5*F1,t(i)+0.5*h);
    F3= h*f(z(i)+0.5*F2,t(i)+0.5*h);
    F4= h*f(z(i)+F3,t(i)+h);
    z(i+1)=z(i)+1/6*(F1+2*F2+2*F3+F4);
endfor
coefAB=[55,-59,37,-9];
coefAM=[9,19,-5,1];
for i=4:length(z)-1
   vf=[f(z(i),t(i)),f(z(i-1),t(i-1)),f(z(i-2),t(i-2)),f(z(i-3),t(i-3))];
   z(i+1)=z(i)+h/24*dot(vf,coefAB); 
   vf=[f(z(i+1),t(i+1)),vf(1:3)];
   z(i+1)=z(i)+h/24*dot(vf,coefAM);    
endfor

end % termina la function AB
~~~~
Archivo test_corrector.m
~~~~
f_edo=@(x,t) -x;
x0 = 1; t0 = 0;
% resuelve x'=-x, x(0)=1
tf= 10;h=0.1;
z=edoPredCor(f_edo,t0,x0,tf,h);
plot(t0:h:tf,z)
~~~~

## Ejemplo de inestabilidad

~~~~
f_edo=@(x,t) 30-5*x;
x0 = 1; t0 = 0;
% resuelve x'=-x, x(0)=1
tf= 10;
h1=0.3;
z1=edoPredCor(f_edo,t0,x0,tf,h1);
h2=0.2;
z2=edoPredCor(f_edo,t0,x0,tf,h2);
plot(t0:h1:tf,z1,t0:h2:tf,z2)
~~~~
