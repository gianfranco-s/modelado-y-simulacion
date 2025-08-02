% Modelos y Simulación
% Tema: Sistemas con Función Transferencia
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


% Caso 1: superposición
Yu1 = lsim(G1, u1, t);
Yu2 = lsim(G2, u2, t);

Ys = Yu1 + Yu2;


% Caso 2: matrices
M = [G1 G2]
U = [u1 u2];

Ym = lsim(M, U, t);


figure(2)
subplot(2, 1, 1);
xlabel('Time (t)');
ylabel('y(t)');
plot(t, Ys);
% plot(t, Yu1, t, Yu2);
title('Sistema MISO');

subplot(2, 1, 1);
xlabel('Time (t)');
ylabel('y(t)');
plot(t, Ym);
