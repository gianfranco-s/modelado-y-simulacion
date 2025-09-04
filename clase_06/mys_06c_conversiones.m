% Modelos y Simulación
% Tema: equivalentes discretos y continuos
% Autor: Gianfranco Salomone
 
clc;
clearvars;

% 1. Conversión a tiempo discreto
G_original = tf(1, [1 3])  % expresión correspondiente a sistema continuo
Ts = 0.1;
G_discreta = c2d(G_original, Ts, 'matched')  % Otras opciones: zoh, tustin, matched

% 2. Re-conversión a tiempo continuo
G_restaurada = d2c(G_discreta, 'matched')

% 3. Comparanción de las respuestas al escalón
t_end = 2;  % Tiempo de simulación

subplot(2, 2, 1)
step(G_original, t_end)

subplot(2, 2, 2)
step(G_discreta, t_end)

subplot(2, 2, 3)
step(G_restaurada, t_end)

subplot(2, 2, 4)
step(G_original, G_discreta, G_restaurada, t_end)
