% Modelos y Simulación
% Tema: utilización de funciones -- main
% Autor: Gianfranco Salomone
 
clc;
clear all;

t_start = 0;
t_end = 20;
t_step = 0.1;

% Llamado a la función
[t, y, dy] = mys_clase_01b_func(t_start, t_end, t_step);

figure;

subplot(2, 1, 1);
plot(t, y, 'b-', 'LineWidth', 1.5);
xlabel('Time (t)');
ylabel('y(t)');
title('y = t + sin(t)');
grid on;

subplot(2, 1, 2);
plot(t, dy, 'r-', 'LineWidth', 1.5);
xlabel('Time (t)');
ylabel('dy/dt');
title('dy/dt = 1 + cos(t)');
grid on;
