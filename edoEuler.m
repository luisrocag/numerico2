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
