frunge=@(x)1./(1+25*x.^2);
n=15;
X=-1:1/n:1;
%X=cos((2*[1:n]-1)*pi/(2*n));
Y=frunge(X);
xx=linspace(-1,1,50);
p=lagrange(X, Y);
zz=polyval(p, xx);
yy=frunge(xx);
plot(xx,zz,'k',xx,yy,'r',X,Y,'+')
