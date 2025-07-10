% Ejemplo de un sistema MBK

clc;
clear all;

k = 0.3;
A = 1;

u = 10;

% Defino la funci�n, primero la var indep, luego la dependiente.
dy = @(t,y) -k*y/A + u/A

% para usarla, se escribe
dy(3,4)
% que evalua la ecuaci�n en los puntos deseados.


% Programas para resolver ecuaci�n diferencial:
% ordinary differential equations
% ode23
% ode45

[t,y] = ode23(dy,[0,50],4);
plot(t,y)

