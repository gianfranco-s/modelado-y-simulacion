% Modelos y Simulación
% Tema: MIMO
% Autor: Gianfranco Salomone

clc;
clear all;


% Funciones transferencia
G1 = tf(1, [1 2]);
G2 = tf(3, [1 4]);
G3 = tf(5, [1 6]);
G4 = tf(7, [1 8]);

% Tiempo de simulación
t = 0:.1:10;
t = t';  % Transpuesto para poder utilizarlo en lsim
u1 = exp(-t / 5);
u2 = sin(pi * t).*u1;  % .* se utiliza para multiplicación elemento a elemento


Sist_1ent_2sal = tf({[5];[7]},{[1 6];[1 8]})
% produce un sistema cuya salida es
% Y1 = s3*U
% Y2 = s4*U
% Son dos bloques en paralelo.
% pause;

figure(3)
title('Sistema SIMO');
% Salida del SIMO frente a u1
y4 = lsim(Sist_1ent_2sal,u1,t);
subplot(2,1,1)
plot(t,y4)

% Salida del SIMO frente a u2
y5 = lsim(Sist_1ent_2sal,u2,t);
subplot(2,1,2)
plot(t,y5)

% FALTA PARTE MIMO

