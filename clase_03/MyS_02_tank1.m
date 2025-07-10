% Modelos y Simulación
% Clase 02
% Ejemplo de script:

clc;
clear all;


% Inicialización de variables:
u = 10;      % señal externa
tfinal = 50; % tiempo final
y0 = 4;      % nivel inicial

% Constantes del sistema:
k = 0.3;
A = 1;

% Defino la ecuación diferencial,
% primero la var indep, luego la dependiente.
dy = @(t,y) -k*y/A + u/A

% Para usar la función dy: la evaluaremos para t = 3, y = 4
dy(3,4)

% Gráfica de la función y, una vez resuelta la ecuación diferencial:
[t,y] = ode23(dy,[0,tfinal],y0);
plot(t,y);
title('Respuesta de y(t)');
xlabel('Tiempo [seg]');
ylabel('Nivel del tanque [m]');

grid


