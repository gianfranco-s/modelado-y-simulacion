% Modelos y Simulación
% Tema: Simulación MBK
% Autor: Gianfranco Salomone
 
clc;
clear all;
clf;
 
% Inicialización de variables:
m = 1;
b = 1;
k = 1;
f0 = 1.5;

% Valores iniciales:
x_0 = 0.5;
dx_0 = 0.7;

z0 = [x_0; dx_0];

% Como `ode45` únicamente admite ecuaciones de primer orden,
% el modelo de estados es una buena elección:
A = [0   1; -k/m -b/m];
B = [1 ; 1/m];

u  = @(t) f0;
dX = @(t, X) A * X + B * u(t);


tfinal = 5;
tspan = [0 tfinal];
[t, Y] = ode45(dX, tspan, z0);

% Gráficas
hold on;
plot(t, Y(:,1), 'b-', 'LineWidth', 1.2);
plot(t, Y(:,2), 'r--', 'LineWidth', 1.2);
xlabel('t (s)'); ylabel('Respuesta');
legend('x(t)', 'dx/dt', 'Location','Best');
title('Masa - resorte - amortiguador');
grid on;
hold off;
