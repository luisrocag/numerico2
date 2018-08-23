x = 0:3;
y = [-5 -6 -1 16];

V = vander(x);
c = V\y';

xx = linspace(0,3,51);
plot(xx,polyval(c,xx),x,y,'*')