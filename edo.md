# Metodos para EDO's de primer orden

## Archivo edoTaylor.m
```
function z=edoTaylor(f,fx,ft,a,xa,b,h)
t=a:h:b;
z=zeros(size(t));
z(1)=xa;
for i=1:length(t)-1
    F1= fx(z(i),t(i));
    F2= ft(z(i),t(i));
    F3 =f(z(i),t(i));
    z(i+1)=z(i) + h*F3+0.5*h^2*(F2+F3*F1);;
end
end
% f_edo=@(x,t) -x;fx=@(x,t) -1;ft=@(x,t) 0;
% x0 = 1; t0 = 0;
%% resuelve x'=-x, x(0)=1
% tf= 10;h=0.1;
% z=edoTaylor(f_edo,fx,ft,t0,x0,tf,h);
```
## Archivo edoEuler.m

```
function z=edoEuler(f,a,ya,b,h)
t=a:h:b;
z=zeros(size(t));
z(1)=ya;
for i=1:length(t)-1
    F1= h*f(z(i),t(i));
    z(i+1)=z(i) + F1;
end
end

% f_edo=@(x,t) -x;
% x0 = 1; t0 = 0;
%% resuelve x'=-x, x(0)=1
% tf= 10;h=0.1;
% z=edoEuler(f_edo,t0,x0,tf,h);
```
## Archivo edoRK4.m
```
function z=edoRK4(f,a,ya,b,h)
t=a:h:b;
z=zeros(size(t));
z(1)=ya;
for i=1:length(t)-1
    F1= h*f(z(i),t(i));
    F2= h*f(z(i)+0.5*F1,t(i)+0.5*h);
    F3= h*f(z(i)+0.5*F2,t(i)+0.5*h);
    F4= h*f(z(i)+F3,t(i)+h);
    z(i+1)=z(i) + (F1+2*F2+2*F3+F4)/6;
end
end

% f_edo=@(x,t) -x;
% x0 = 1; t0 = 0;
%% resuelve x'=-x, x(0)=1
% tf= 10;h=0.1;
% z=edoEuler(f_edo,t0,x0,tf,h);
```
