% Modelos y Simulación
% Tema: SIMO
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
% u1 = ones(1, length(t));  % entrada escalón

M = [G1 ; G2];

figure(3)
title('Sistema SIMO');
Y = lsim(M, u1, t);
plot(t, Y)
