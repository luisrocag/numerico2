% Programa para calcular la trayectoria
% de un proyectil

v0 = 5; % magnitud de la velocidad inicial
theta0 = 45; % angulo de disparo
g = 9.81; % gravedad
t = linspace(0,1,1000); % vector de tiempo
x = v0*cos(theta0)*t; % posicion horizontal
y = v0*sin(theta0)*t - 0.5*g*t.^2; % posicion vertical
plot(x,y);
xlabel('x (m)'); % rotulo del eje X
ylabel('y (m)'); % rotulo del eje Y
title('y vs x'); % titulo del grafico 
saveas(gcf,'figura01.png');