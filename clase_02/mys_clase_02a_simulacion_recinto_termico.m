% Modelos y Simulación
% Tema: Simulación recinto térmico
% Autor: Gianfranco Salomone
 
clc;
clear all;
clf;
 
% Inicialización de variables:
R = 1;
C = 1;
r = 1;

% Valores iniciales:
theta_0 = 10;
e_0 = 1;

dtheta = @(t, theta) -1/(R*C) * theta + e_0^2/(r*C);

tfinal = 5;
tspan = [0, tfinal];
[t, theta] = ode23(dtheta, tspan, theta_0);

plot(t, theta)
