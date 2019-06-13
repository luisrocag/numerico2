# Análisis Numérico 2 con Octave

Enviar codigo y resultados a lrocag@uni.pe con nombre codigo y curso.

## Laboratorio : Métodos para EDO

(https://github.com/luisrocag/numerico2/blob/master/lab4.md)

## Laboratorio : Diferencias finitas
% solucion numerica de u''+pu'=f; u(a)=ua; u(b)=ub
a = 0;b = 1;n = 100; h = (b-a)/(n-1);
x = linspace(a,b,n);
P = -ones(size(x));
F = (2/3)*exp(x)';
ua = 0;ub = e/3;
A = -2*diag(ones([n-2,1]))+ ...
diag(ones([n-3,1]),1)+...
diag(ones([n-3,1]),-1);

B = diag(ones([n-2,1]))+ ...
    -diag(ones([n-3,1]),-1);

F(2)   = F(2) - (1/h^2)*ua + (1/(2*h))*P(2)*ua;
F(n-1) = F(n-1) - (1/h^2)*ub;
%  resolver la ecuacion 
%   (1/h**2)A.U + (1/(2h))diag(P).B.U = F

U = ((1/h^2)*A + (1/(2*h))*diag(P(2:n-1))*B)\F(2:n-1);
plot(x,[ua,U',ub]);
