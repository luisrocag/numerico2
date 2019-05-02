# Integracion de Gauss-Legendre
```
function [w,x]=gaussian(n)
  if n==1
    x=[0];
    w=[2];
  elseif n==2
    x=[-1/sqrt(3),1/sqrt(3)];
    w=[1,1];
  elseif n==3
    x=[-1/sqrt(3/5),0,1/sqrt(3/5)];
    w=[5/9,8/9,5/9];
  endif
endfunction
```
```
test_gauss=@(x) x.^2;
[w,x]=gaussian(3);
int_gauss = dot(w,test_gauss(x))
```
# Integracion de Gauss-Chebyshev
```
function [w,x]=chebyshev(n)
  w = pi/n*ones([1,n]);
  x = cos( ((2*[1:n]-1)*pi)/(2*n) );
endfunction
```
```
test_cheby = @(x) x.^2;
[w,x] = chebyshev(3);
int_cheby = dot(w,test_cheby(x))
```
