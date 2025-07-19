% Modelos y Simulación
% Tema: equivalentes discretos y continuos
% Autor: Gianfranco Salomone
 
clc;
clear all;

% 1a. Definición de la función transferencia
su_original = tf(1, [1 3])

% 1b. Conversión a tiempo discreto
Ts = 0.1;
zu = c2d(su_original, Ts, 'matched')  % Otras opciones: zoh, tustin, matched

% 2. Re-conversión a tiempo continuo
su_restored = d2c(zu, 'matched')

% 4. Comparanción de las respuestas al escalón
t_end = 2;  % Tiempo de simulación

subplot(2, 2, 1)
step(su_original, t_end)

subplot(2, 2, 2)
step(zu, t_end)

subplot(2, 2, 3)
step(su_restored, t_end)

subplot(2, 2, 4)
step(su_original, su_restored, zu, t_end)
