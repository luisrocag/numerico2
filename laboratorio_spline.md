# Interpolacion Spline

## Codigo Octave

```Matlab
X=[0,1,2,3];
Y=[0,1/2,2,3/2];
dx0=1/5;
dxn=-1;
N=length(X)-1;
H=diff(X);
D=diff(Y)./H;
A=H(2:N-1);
B=2*(H(1:N-1)+H(2:N));
C=H(2:N);
U=6*diff(D);
M=[];
S=[];
%restricciones en los extremos
B(1)=B(1)-H(1)/2;
U(1)=U(1)-3*(D(1)-dx0);
B(N-1)=B(N-1)-H(N)/2;
U(N-1)=U(N-1)-3*(dxn-D(N));

for k=2:N-1
  temp=A(k-1)/B(k-1);
  B(k)=B(k)-temp*C(k-1);
  U(k)=U(k)-temp*U(k-1);
end

M(N)=U(N-1)/B(N-1);

for k=N-2:-1:1
   M(k+1)=(U(k)-C(k)*M(k+2))/B(k);
end
M(1)=3*(D(1)-dx0)/H(1)-M(2)/2;
M(N+1)=3*(dxn-D(N))/H(N)-M(N)/2;
for k=0:N-1
  S(k+1,1)=(M(k+2)-M(k+1))/(6*H(k+1));
  S(k+1,2)=M(k+1)/2;
  S(k+1,3)=D(k+1)-H(k+1)*(2*M(k+1)+M(k+2))/6;
  S(k+1,4)=Y(k+1);
end


%%% graficas
x1=0:.01:1;
x2=1:.01:2;
x3=2:.01:3;
y1=polyval(S(1,:),x1-X(1));
y2=polyval(S(2,:),x2-X(2));
y3=polyval(S(3,:),x3-X(3));
plot(x1,y1,x2,y2,x3,y3,X,Y,'.')
plot(x1,y1,x2,y2,x3,y3,X,Y,'.')
```
