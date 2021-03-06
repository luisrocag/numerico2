function z=edoHeun(f,a,xa,b,h)
t=a:h:b;
z=zeros(size(t));
z(1)=xa;
for i=1:length(t)-1
    F1= h*f(z(i),t(i));
    F2= h*f(z(i)+F1,t(i+1));
    z(i+1)=z(i) + 0.5*(F1+F2);
end
endfunction

% f_edo=@(x,t) -x;
% x0 = 1; t0 = 0;
%% resuelve x'=-x, x(0)=1
% tf= 10;h=0.1;
% z=edoHeun(f_edo,t0,x0,tf,h);

