% Modelos y Simulaci�n
% Clase 02
% Ejemplo de script:

clc;
clear all;


% Inicializaci�n de variables:
u = 10;      % se�al externa
tfinal = 50; % tiempo final
y0 = 4;      % nivel inicial

% Constantes del sistema:
k = 0.3;
A = 1;

% Defino la ecuaci�n diferencial,
% primero la var indep, luego la dependiente.
dy = @(t,y) -k*y/A + u/A

% Para usar la funci�n dy: la evaluaremos para t = 3, y = 4
dy(3,4)

% Gr�fica de la funci�n y, una vez resuelta la ecuaci�n diferencial:
[t,y] = ode23(dy,[0,tfinal],y0);
plot(t,y);
title('Respuesta de y(t)');
xlabel('Tiempo [seg]');
ylabel('Nivel del tanque [m]');

grid


