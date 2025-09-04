% Modelos y Simulación
% Tema: verificación de equivalente discreto Tustin
% Autor: Gianfranco Salomone
 
clc;
clear all;

G = tf(1, [1 2])

% Conversión a tiempo discreto (sin `;` para ver el resultado)
Ts = 0.01;
zu = c2d(su, Ts, 'tustin')
