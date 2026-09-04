% Modelos y Simulación
% Tema: SISO
% Autor: Gianfranco Salomone

clc;
clear all;

% Funciones transferencia
G1 = tf(1, [1 2]);
G2 = tf(3, [1 4]);

% Tiempo de simulación
t = 0:.1:10;
t = t';  % Transpuesto para poder utilizarlo en lsim
u1 = exp(-t / 5);
u2 = sin(pi * t).*u1;  % .* se utiliza para multiplicación elemento a elemento

G12 = series(s1,s2)


figure(1)

% Salida del sistema S12 ante la entrada u1:
y1 = lsim(G12, u1, t);

% Salida del sistema S12 ante la entrada u2:
y2 = lsim(G12, u2, t);

plot(t, y1, t, y2);
title('Respuesta temporal de un Sistema SISO');
