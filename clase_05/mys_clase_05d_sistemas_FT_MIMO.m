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


M = [ G1, G2 ;
      G3, G4 ];
U = [u1, u2];

Y = lsim(M, U, t);


figure(4)
title('Sistema MIMO');
plot(t, Y)
% plot(t, Y(:, 1))  % para graficar señal 1
% plot(t, Y(:, 2))  % para graficar señal 2
