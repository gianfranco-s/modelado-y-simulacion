% Modelos y Simulación
% Tema: Función transferencia a partir del modelo de estados
% Autor: Gianfranco Salomone
 
clc;
clear all;
clf;
 
% Inicialización de variables:
m = 1;
b = 1;
k = 1;
f0 = 1.5;

A = [0   1; -k/m -b/m];
B = [0 ; 1/m];
C = [1 0; 0 1];  % "elige" posición y velocidad como salidas
D = [0 ; 0];


% Opción A: obtener posición modificando C y D
pos_tf_A = tf(ss(A, B, [1 0], 0));
vel_tf_A = tf(ss(A, B, [0 1], 0));

% Opción B: obtener las funciones transferencia parseando el resultado
[num, den] = ss2tf(A, B, C, D);
pos_tf_B = tf(num(1,:), den);
vel_tf_B = tf(num(2,:), den);

% figure(1)
% subplot(2,1,1)
% hold on;
% step(pos_tf_A)
% step(vel_tf_A)
% hold off;

% subplot(2,1,2)
% hold on;
% step(pos_tf_B)
% step(vel_tf_B)
% hold off;


figure(2)
subplot(2,2,1)
hold on;
step(pos_tf_A)
step(vel_tf_A)
hold off;

subplot(2,2,3)
hold on;
step(pos_tf_B)
step(vel_tf_B)
hold off;

subplot(2,2,[2 4])
title('Polos y ceros');
% pzmap(pos_tf_A, 'b');
pzmap(vel_tf_A, 'r');  % Muestra un cero en el origen, debido a la velocidad