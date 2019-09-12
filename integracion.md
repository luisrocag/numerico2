## Regla del trapecio
```
function z=trapecio(f,a,b,n)
  h=(b-a)/n;
  x=linspace(a,b,n+1);
  C=ones([n+1,1]);
  C(2:n)=2;
  z = 0.5*h*dot(f(x),C);
endfunction
```
## Regla de Simpson
```
function z=simpson(f,a,b,n)
  h=(b-a)/n;
  x=linspace(a,b,n+1);
  C=ones([n+1,1]);
  C(2:2:n)=4;
  C(3:2:n-1)=2;
  z = (h/3)*dot(f(x),C);
endfunction
```
## Ejemplo
```
f=@(x) exp(-x).*sqrt(1+exp(-2*x));
a=0;b=1;n=25;
z1=2*pi*trapecio(f,a,b,n)
z2=2*pi*simpson(f,a,b,n)
```
## Metodo de Taylor
```
function z=taylor(x)
t=x;
z=x;
cont=1;
while (true) 
  t = -(x.^2).*t*(2*cont-1)/(cont*(2*cont+1));
  cont=cont+1;
  z = z+t;
  if abs(t)<1E-8
    break
  endif
endwhile  
```
## Ejemplo
```
z=[];
val_x=0:0.1:1;
for x=val_x;
  z=[z,taylor(x)];
endfor
plot(val_x,z)
```
